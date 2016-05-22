CREATE TABLE [dbo].[ProcessViewingHistory]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [ProcessId] INT NOT NULL, 
    [DateViewed] DATETIME NOT NULL, 
    CONSTRAINT [FK_ProcessViewingHistory_Process_ProcessId] FOREIGN KEY (ProcessId)
	 REFERENCES [Process]([Id]) ON DELETE CASCADE
)
