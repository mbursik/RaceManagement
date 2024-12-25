CREATE TABLE [rc].[Category]
(
  [Id] INT NOT NULL IDENTITY (1,1), 
  [Race_Id] INT NOT NULL,
  [Name] VARCHAR(100) NOT NULL, 
  [BirthYearFrom] INT NOT NULL, 
  [BirthYearTo] INT NOT NULL, 
  [Distance] INT NOT NULL,
  [Position] INT NOT NULL,
  [Sex_Id] INT NOT NULL, 
  [IsValid] BIT NOT NULL, 
  CONSTRAINT [PK_Category] PRIMARY KEY ([Id]),
  CONSTRAINT [FK_RaceCategory] FOREIGN KEY ([Race_Id])
  REFERENCES [rc].[Race]([Id]),
  CONSTRAINT [FK_SexCategory] FOREIGN KEY ([Sex_Id])
  REFERENCES [rc].[Sex]([Id])
)
