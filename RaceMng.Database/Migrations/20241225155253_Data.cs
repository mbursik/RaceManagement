using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RaceMng.Database.Migrations
{
  /// <inheritdoc />
  public partial class Data : Migration
  {
    /// <inheritdoc />
    protected override void Up(MigrationBuilder migrationBuilder)
    {
      string sqlFilePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Scripts", "Data.sql");
      string sqlScript = File.ReadAllText(sqlFilePath);

      migrationBuilder.Sql(sqlScript);


      string sqlFilePathTestData = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Scripts", "TestData.sql");
      string sqlScriptTestData = File.ReadAllText(sqlFilePathTestData);

      migrationBuilder.Sql(sqlScriptTestData);


    }

    /// <inheritdoc />
    protected override void Down(MigrationBuilder migrationBuilder)
    {

    }
  }
}
