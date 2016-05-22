CREATE TABLE [dbo].[ProcessStep]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Description] NVARCHAR(50) NOT NULL, 
    [ProcessId] INT NOT NULL, 
    [LinkedProcessId] INT NULL, 
    [ParentProcessStepId] INT NULL, 
    CONSTRAINT [FK_ProcessStep_Process_ProcessId] FOREIGN KEY ([ProcessId]) REFERENCES [Process]([Id]) ON DELETE NO ACTION, 
    CONSTRAINT [FK_ProcessStep_Process_LinkedProcessId] FOREIGN KEY ([LinkedProcessId]) REFERENCES [Process]([Id]) ON DELETE CASCADE,
    CONSTRAINT [SelfRef] FOREIGN KEY ([ParentProcessStepId]) REFERENCES [ProcessStep]([Id]) ON DELETE NO ACTION

)
