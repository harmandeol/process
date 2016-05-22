/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
INSERT INTO Process  (Name, ParentId)VALUES("FirstProcess",NULL);
INSERT INTO ProcessStep (Description,ProcessId,LinkedProcessId,ParentProcessStepId) VALUES("FirstProcessStep",1,NULL,NULL);
INSERT INTO ProcessStep (Description,ProcessId,LinkedProcessId,ParentProcessStepId) VALUES("SecondProcessStep",1,NULL,NULL);
INSERT INTO ProcessStep (Description,ProcessId,LinkedProcessId,ParentProcessStepId) VALUES("FirstProcessStepFirst",1,NULL,1);
INSERT INTO ProcessStep (Description,ProcessId,LinkedProcessId,ParentProcessStepId) VALUES("FirstProcessStepSecond",1,NULL,1);
