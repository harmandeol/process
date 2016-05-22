CREATE TRIGGER [DatabaseTrigger_DELETE_PROCESS]
ON [Process]
FOR DELETE
AS
BEGIN
DECLARE @processId int
SELECT @processId = Id from DELETED
	DECLARE @Delete TABLE
(
  id int
)

;WITH IdsToDelete (id)
AS (
  SELECT Id
  FROM ProcessStep
  WHERE ProcessId = @processId
  UNION ALL
  SELECT s.Id
  FROM ProcessStep s 
  INNER JOIN IdsToDelete I ON I.id = s.ParentProcessStepId AND s.ProcessId = @processId
)



INSERT INTO @Delete (id)
  SELECT id
  FROM IdsToDelete


DELETE FROM ProcessViewingHistory WHERE ProcessId = @processId
Update ProcessStep SET LinkedProcessId = NULL Where LinkedProcessId = @processId
Update ProcessStep SET ParentProcessStepId = NULL WHERE ParentProcessStepId IN (SELECT Id FROM @Delete) AND ProcessId != @processId
DELETE FROM ProcessStep WHERE Id IN (SELECT Id FROM @Delete) 
Update Process SET ParentId = NULL  Where ParentId = @processId

END
