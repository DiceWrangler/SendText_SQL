/*
	Table_App_Config.sql
*/

if object_id('App_Config', 'U') is not null
	drop table App_Config;
go


CREATE TABLE App_Config(
	AppCon_App_Config_ID int NOT NULL identity(1,1),
	AppCon_App_Name varchar(50) NOT NULL,
	AppCon_Config_Name varchar(50) NOT NULL,
	AppCon_Config_Value varchar(250) NULL,
	CONSTRAINT PK_App_Config PRIMARY KEY NONCLUSTERED (AppCon_App_Config_ID),
	CONSTRAINT UK_App_Config UNIQUE CLUSTERED (AppCon_App_Name, AppCon_Config_Name)
);
GO
