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

