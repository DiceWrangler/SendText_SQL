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
/*
	Table_Batch_Status.sql
*/

if object_id('Batch_Status', 'U') is not null
	drop table Batch_Status;
go


CREATE TABLE Batch_Status(
	BatSta_Batch_Status char(1) NOT NULL,
	BatSta_Description varchar(50) NOT NULL,
	BatSta_Priority float NULL,
	BatSta_Active bit NULL, -- Eligible to be sent?
	BatSta_Terminal bit NULL,  -- Terminal state
	BatSta_Set_Started_Time char(1) NULL, -- (S)et, (C)lear, (N)o change
	BatSta_Set_Finished_Time char(1) NULL, -- (S)et, (C)lear, (N)o change
	CONSTRAINT PK_Batch_Status PRIMARY KEY CLUSTERED (BatSta_Batch_Status)
);
GO

/*
	Table_Message_Status.sql
*/

if object_id('Message_Status', 'U') is not null
	drop table Message_Status;
go


CREATE TABLE Message_Status(
	MsgSta_Message_Status char(1) NOT NULL,
	MsgSta_Description varchar(50) NOT NULL,
	MsgSta_Priority float NULL,
	MsgSta_Active bit NULL, -- Eligible to be sent?
	MsgSta_Terminal bit NULL,  -- Terminal state
	MsgSta_Set_Started_Time char(1) NULL, -- (S)et, (C)lear, (N)o change
	MsgSta_Set_Finished_Time char(1) NULL, -- (S)et, (C)lear, (N)o change
	CONSTRAINT PK_Message_Status PRIMARY KEY CLUSTERED (MsgSta_Message_Status)
);
GO

/*
	Table_Text_Batch.sql
*/

if object_id('Text_Batch', 'U') is not null
	drop table Text_Batch;
go


CREATE TABLE Text_Batch(
	TxtBat_Text_Batch_ID int NOT NULL identity(1,1),
	TxtBat_Text_Type_ID int NULL,
	TxtBat_Subject varchar(100) NULL,
	TxtBat_Text_Message varchar(250) NULL,
	TxtBat_Sent_By_User_ID int NULL,
	TxtBat_Batch_Status char(1) NULL CONSTRAINT DF_TxtBat_Batch_Status DEFAULT 'C',
	TxtBat_Created_Time datetime NULL CONSTRAINT DF_TxtBat_Created_Time DEFAULT getdate(),
	TxtBat_Started_Time datetime NULL,
	TxtBat_Finished_Time datetime NULL,
	TxtBat_Scheduled_Time datetime NULL,
	CONSTRAINT PK_Text_Batch PRIMARY KEY CLUSTERED (TxtBat_Text_Batch_ID)
);
GO

/*
	Table_Text_Batch_Log.sql
*/

if object_id('Text_Batch_Log', 'U') is not null
	drop table Text_Batch_Log;
go


CREATE TABLE Text_Batch_Log(
	TxtBat_Text_Batch_ID int NULL,
	TxtBat_Text_Type_ID int NULL,
	TxtBat_Subject varchar(100) NULL,
	TxtBat_Text_Message varchar(250) NULL,
	TxtBat_Sent_By_User_ID int NULL,
	TxtBat_Batch_Status char(1) NULL,
	TxtBat_Created_Time datetime NULL,
	TxtBat_Started_Time datetime NULL,
	TxtBat_Finished_Time datetime NULL,
	TxtBat_Scheduled_Time datetime NULL
);
GO

/*
	Table_Text_Message.sql
*/

if object_id('Text_Message', 'U') is not null
	drop table Text_Message;
go


CREATE TABLE Text_Message(
	TxtMsg_Text_Message_ID int NOT NULL identity(1,1),
	TxtMsg_Text_Batch_ID int NOT NULL,
	TxtMsg_Tenant_ID int NULL,
	TxtMsg_Asset_ID int NULL,
	TxtMsg_Text_To varchar(50) NULL,
	TxtMsg_Text_To_Email varchar(150) NULL,
	TxtMsg_Message_Status char(1) NULL CONSTRAINT DF_TxtMsg_Message_Status  DEFAULT 'C',
	TxtMsg_Created_Time datetime NULL CONSTRAINT DF_TxtMsg_Created_Time  DEFAULT getdate(),
	TxtMsg_Started_Time datetime NULL,
	TxtMsg_Finished_Time datetime NULL,
	CONSTRAINT PK_Text_Message PRIMARY KEY CLUSTERED (TxtMsg_Text_Message_ID)
);
GO

/*
	Table_Text_Message_Log.sql
*/

if object_id('Text_Message_Log', 'U') is not null
	drop table Text_Message_Log;
go


CREATE TABLE Text_Message_Log(
	TxtMsg_Text_Message_ID int NULL,
	TxtMsg_Text_Batch_ID int NULL,
	TxtMsg_Tenant_ID int NULL,
	TxtMsg_Asset_ID int NULL,
	TxtMsg_Text_To varchar(50) NULL,
	TxtMsg_Text_To_Email varchar(150) NULL,
	TxtMsg_Message_Status char(1) NULL,
	TxtMsg_Created_Time datetime NULL,
	TxtMsg_Started_Time datetime NULL,
	TxtMsg_Finished_Time datetime NULL
);
GO

