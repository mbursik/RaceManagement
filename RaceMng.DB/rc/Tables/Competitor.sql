CREATE TABLE [rc].[Competitor]
(
    [Id] INT NOT NULL IDENTITY (1,1), 
    [FirstName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [BirthYear] INT NOT NULL, 
    [Team] VARCHAR(50) NOT NULL, 
    [Sex_Id] INT NOT NULL,
    CONSTRAINT [PK_Competitor] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_SexCompetitor] FOREIGN KEY ([Sex_Id])
    REFERENCES [rc].[Sex]([Id])
)
