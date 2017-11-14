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

INSERT INTO [dbo].[Customer]
           ([Code]
           ,[Name]
           ,[LastModified])
     VALUES
           ('C0001','Customer1', '2017-11-08 21:21:30'),
		   ('C0002','Customer2', '2017-11-08 21:21:30')

INSERT INTO [dbo].[Machine]
           ([Code]
            ,[Name]
		   ,[Condition]
           ,[LastModified])
     VALUES
           ('M0001','Machine1', 'Perfect', '2017-11-08 21:21:30'),
		   ('M0002','Machine2', 'Good', '2017-11-08 21:21:30')