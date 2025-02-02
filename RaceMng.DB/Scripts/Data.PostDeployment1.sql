﻿/*
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

IF (NOT EXISTS(SELECT * FROM [rc].[Sex]))  
BEGIN 
  SET IDENTITY_INSERT [rc].[Sex] ON 

  INSERT [rc].[Sex] ([Id], [Name]) VALUES (1, 'Muž')
  INSERT [rc].[Sex] ([Id], [Name]) VALUES (2, 'Žena')

  SET IDENTITY_INSERT [rc].[Sex] OFF
END
GO


