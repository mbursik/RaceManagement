using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RaceMng.Database.Migrations
{
  /// <inheritdoc />
  public partial class Procedures : Migration
  {
    /// <inheritdoc />
    protected override void Up(MigrationBuilder migrationBuilder)
    {
      migrationBuilder.Sql(@"
CREATE PROCEDURE [rc].[CreateCompetitorCategory]
	@Category_Id int output,
	@Competitor_Id int output,
	@Number int=null,
	@Time time(7)=null,
	--Competitor
	@FirstName varchar(50), 
	@LastName varchar(50), 
	@BirthYear int, 
	@Team varchar(50), 
	@Sex_Id int

AS
BEGIN

	SET NOCOUNT ON;

	declare @ErrMsg varchar(1000), @Race_Id int

	--find or create competitor
	select top 1 @Competitor_Id=Id 
	from [rc].[Competitor] 
	where FirstName=@FirstName and LastName=@LastName and BirthYear=@BirthYear and Sex_Id=@Sex_Id
		
	BEGIN TRAN
	BEGIN TRY
	--current race
	select top 1 @Race_Id=Id 
	from [rc].[Race]
	where IsValid = 1

	if @Race_Id is null
	begin
		set @ErrMsg = 'Valid race does not exists'
		;throw 50001, @ErrMsg, 1
	end

	if @Number is not null and exists(select * from [rc].[Category] ca
																		inner join [rc].[CompetitorCategory] cc on ca.Id = cc.Category_Id
																		where ca.[Race_Id]=@Race_Id and ca.IsValid=1 and cc.Number=@Number)
	begin
		set @ErrMsg = FORMATMESSAGE('Cannot insert duplicate start number. Number(%i)', @Number) 
		;throw 50002, @ErrMsg, 1
	end


	if @Competitor_Id is null
	begin
		INSERT INTO [rc].[Competitor]
						([FirstName]
						,[LastName]
						,[BirthYear]
						,[Team]
						,[Sex_Id])
		VALUES
						(@FirstName
						,@LastName
						,@BirthYear
						,@Team
						,@Sex_Id)
		SELECT @Competitor_Id = SCOPE_IDENTITY() 
	end
	else begin
		update [rc].[Competitor] 
		set [Team] = @Team 
		where Id=@Competitor_Id
	end

	--find category
	select top 1 @Category_Id=Id
	from [rc].[Category]
	where Race_Id=@Race_Id and Sex_Id=@Sex_Id and @BirthYear between BirthYearFrom and BirthYearTo and IsValid=1

	if @Category_Id is null
	begin
		set @ErrMsg = FORMATMESSAGE('Valid category does not exists for Race_Id(%i), Sex_Id(%i), BirthYear(%i), IsValid(1).', @Race_Id, @Sex_Id, @BirthYear) 
		;throw 50003, @ErrMsg, 1
	end


	if exists(select * from [rc].[CompetitorCategory] where [Category_Id]=@Category_Id and [Competitor_Id]=@Competitor_Id)
	begin
		set @ErrMsg = FORMATMESSAGE('Cannot insert duplicate key into table [CompetitorCategory]. Category_Id(%i), Competitor_Id(%i)', @Category_Id, @Competitor_Id, @BirthYear) 
		;throw 50004, @ErrMsg, 1
	end


	INSERT INTO [rc].[CompetitorCategory]
						([Category_Id]
						,[Competitor_Id]
						,[Number]
						,[Time]
						,[Created])
	VALUES
						(@Category_Id
						,@Competitor_Id
						,@Number
						,@Time
						,getdate())


	COMMIT TRANSACTION
		--print 'Commit tran'
		RETURN 0
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--print 'Rollback tran'
		;throw
		RETURN 1
	END CATCH
END
        ");
    }

    /// <inheritdoc />
    protected override void Down(MigrationBuilder migrationBuilder)
    {
			migrationBuilder.Sql(@"DROP PROCEDURE [rc].[CreateCompetitorCategory]");
    }
  }
}
