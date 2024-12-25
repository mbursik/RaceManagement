CREATE TABLE [rc].[CompetitorCategory]
(
  [Category_Id] INT NOT NULL, 
  [Competitor_Id] INT NOT NULL,
  [Number] INT NULL,
  [Time] TIME NULL, 
  [Created] DATETIME NOT NULL DEFAULT GETDATE(),
  CONSTRAINT PK_CompetitorCategory PRIMARY KEY ([Category_Id],[Competitor_Id])
)
