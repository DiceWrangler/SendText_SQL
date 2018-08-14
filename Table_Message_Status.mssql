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

