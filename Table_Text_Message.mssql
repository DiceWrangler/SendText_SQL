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

