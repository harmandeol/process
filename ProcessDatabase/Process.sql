CREATE TABLE [dbo].[Process]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [ParentId] INT NULL,
    CONSTRAINT [Process_SelfRef] FOREIGN KEY ([ParentId]) REFERENCES [Process]([Id]) ON DELETE NO Action

)
