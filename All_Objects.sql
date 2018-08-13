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

/*
	Data_App_Config.sql
*/

delete from App_Config where AppCon_App_Name = 'SendText';
go

insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Shutdown_Request', 'False')  -- False | True
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Cycle_Interval', '10000') -- milliseconds
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Email_to_Use', 'Test')  -- Live | Test
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Test_Email', '7208403074@messaging.sprintpcs.com') -- SMS text
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Output', 'Draft')  -- Send | Draft
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Process', 'First')  -- All | First
go

select * from App_Config where AppCon_App_Name = 'SendText' order by AppCon_App_Name, AppCon_Config_Name;
go

/*
	Data_Batch_Status.sql
*/

truncate table Batch_Status;
go


insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('C','Created' ,1.0,0,0,'C','C');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('S','Started' ,2.0,1,0,'S','C');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('P','Priority',2.1,1,0,'C','C');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('R','Retry'   ,3.0,1,0,'C','C');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('I','Ignore'  ,3.1,0,0,'N','N');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('Q','Queued'  ,3.2,1,0,'C','C');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('E','Error'   ,4.0,0,1,'N','S');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('F','Finished',4.1,0,1,'N','S');
go


select * from Batch_Status order by BatSta_Priority;
go

/*
	Data_Message_Status.sql
*/

truncate table Message_Status;
go


insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('C','Created' ,1.0,1,0,'C','C');
insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('S','Started' ,2.0,1,0,'S','C');
insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('R','Retry'   ,3.0,1,0,'C','C');
insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('I','Ignore'  ,3.1,0,0,'N','N');
insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('E','Error'   ,4.0,0,1,'N','S');
insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('F','Finished',4.1,0,1,'N','S');
go


select * from Message_Status order by MsgSta_Priority;
go

/*
	Proc_GetActiveTextBatches.sql
*/

if object_id('dbo.GetActiveTextBatches', 'P') is not null
	drop procedure dbo.GetActiveTextBatches;
GO


CREATE PROCEDURE dbo.GetActiveTextBatches
AS
BEGIN
	SET NOCOUNT ON;

select
	TB.TxtBat_Text_Batch_ID,
	TB.TxtBat_Created_Time,
	TB.TxtBat_Subject,
	TB.TxtBat_Text_Message,
	TB.TxtBat_Batch_Status,
	BS.BatSta_Description as 'BatchStatusDesc'
from Text_Batch TB
left outer join Batch_Status BS on BS.BatSta_Batch_Status = TB.TxtBat_Batch_Status
where
	isnull(TB.TxtBat_Scheduled_Time, getdate()) <= getdate() and
	BS.BatSta_Active = 1
order by
	BS.BatSta_Priority,
	TB.TxtBat_Created_Time;

END
GO

/*
	Proc_GetActiveTextMessages.sql
*/

if object_id('dbo.GetActiveTextMessages', 'P') is not null
	drop procedure dbo.GetActiveTextMessages;
GO


CREATE PROCEDURE dbo.GetActiveTextMessages
	@BatchID int
AS
BEGIN
	SET NOCOUNT ON;

select
	TM.TxtMsg_Text_Message_ID,
	TM.TxtMsg_Text_To,
	TM.TxtMsg_Text_To_Email,
	TM.TxtMsg_Message_Status,
	MS.MsgSta_Description as 'MessageStatusDesc'
from Text_Message TM
left outer join Message_Status MS on MS.MsgSta_Message_Status = TM.TxtMsg_Message_Status
where
	TM.TxtMsg_Text_Batch_ID = @BatchID and
	MS.MsgSta_Active = 1
order by
	MS.MsgSta_Priority,
	TM.TxtMsg_Created_Time;

END
GO

/*
	Proc_GetAppConfig.sql
*/

if object_id('dbo.GetAppConfig', 'P') is not null
	drop procedure dbo.GetAppConfig;
GO


CREATE PROCEDURE dbo.GetAppConfig
	@AppName varchar(50),
	@ConfigName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

select
	AC.AppCon_Config_Value
from App_Config AC
where
	AC.AppCon_App_Name = @AppName and
	AC.AppCon_Config_Name = @ConfigName

END
GO

/*
	Proc_GetAsset.sql
*/

if object_id('dbo.GetAsset', 'P') is not null
	drop procedure dbo.GetAsset;
GO


CREATE PROCEDURE dbo.GetAsset
	@AssetID int
AS
BEGIN
	SET NOCOUNT ON;

select
	isnull(A.Address, '') as 'Address',
	isnull(P.PropertyAddress, '') as 'Property'

from BPMCO.dbo.tblAssets A
join BPMCO.dbo.tblProperty P on P.PropertyID = A.PropertyID
where
	A.AssetID = @AssetID;

END
GO

/*
	Proc_GetSecurityUser.sql
*/

if object_id('dbo.GetSecurityUser', 'P') is not null
	drop procedure dbo.GetSecurityUser;
GO


CREATE PROCEDURE dbo.GetSecurityUser
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	select
		isnull(SU.NameFirst + ' ' + SU.NameLast, '') as 'FullName',
		isnull(SU.Email, '') as 'Email',
		case SU.ActiveEmployee
			when 1 then 'Y'
			else 'N'
		end as 'ActiveEmployee'

	from BPMCO.dbo.tblSecurityUsers SU
	where
		SU.UserNameID = @UserID;

END
GO

/*
	Proc_GetSentMessagesByEmail.sql
*/

if object_id('dbo.GetSentMessagesByEmail', 'P') is not null
	drop procedure dbo.GetSentMessagesByEmail;
GO


CREATE PROCEDURE dbo.GetSentMessagesByEmail
	@EmailAddress varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

select
	TxtMsg_Text_Message_ID as 'MessageID',
	TxtMsg_Text_Batch_ID as 'BatchID',
	isnull(TxtBat_Text_Type_ID, 0) as 'TextTypeID',
	isnull(TxtBat_Sent_By_User_ID, 0) as 'SentByUserID',
	TxtMsg_Finished_Time as 'SentTime',
	isnull(TxtMsg_Tenant_ID, 0) as 'TenantID',
	isnull(TxtMsg_Asset_ID, 0) as 'AssetID',
	isnull(TxtBat_Subject, '') as 'SubjectLine',
	isnull(TxtBat_Text_Message, '') as 'BodyText'

from Text_Message TM
join Text_Batch TB on TB.TxtBat_Text_Batch_ID = TM.TxtMsg_Text_Batch_ID
where
	TxtMsg_Text_To_Email = @EmailAddress and
	TxtMsg_Finished_Time is NOT NULL
order by
	TxtMsg_Finished_Time desc;


END
GO

/*
	Proc_GetTenant.sql
*/

if object_id('dbo.GetTenant', 'P') is not null
	drop procedure dbo.GetTenant;
GO


CREATE PROCEDURE dbo.GetTenant
	@TenantID int
AS
BEGIN
	SET NOCOUNT ON;

select
	isnull(T.NameFirst + ' ' + T.NameLast, '') as 'FullName',
	isnull(T.CellPhone, '') as 'CellPhone',
	isnull(T.PrimaryEmail, '') as 'PrimaryEmail'

from BPMCO.dbo.tblTenants T
where
	T.TenantID = @TenantID;

END
GO

/*
	Proc_GetTextMessage.sql
*/

if object_id('dbo.GetTextMessage', 'P') is not null
	drop procedure dbo.GetTextMessage;
GO


CREATE PROCEDURE dbo.GetTextMessage
	@MessageID int
AS
BEGIN
	SET NOCOUNT ON;

select
	TM.TxtMsg_Text_Message_ID,
	TM.TxtMsg_Text_To,
	TM.TxtMsg_Text_To_Email,
	TB.TxtBat_Subject,
	TB.TxtBat_Text_Message,
	TB.TxtBat_Sent_By_User_ID
from Text_Message TM
inner join Text_Batch TB on TB.TxtBat_Text_Batch_ID = TM.TxtMsg_Text_Batch_ID
where
	TM.TxtMsg_Text_Message_ID = @MessageID;

END
GO

/*
	Proc_ImportTxtLog.sql
*/

if object_id('dbo.ImportTxtLog', 'P') is not null
	drop procedure dbo.ImportTxtLog;
go


create procedure dbo.ImportTxtLog
as begin

set NOCOUNT ON;  -- disable display of intermediate row count

declare
	@TextTypeID as int,
	@Subject as varchar(100),
	@TextMessage as varchar(250),
	@SentByID as int,
	@SendDate as date,
	@Priority as char(1),
	@Schedule as datetime,
	@TextTo as varchar(50),
	@TextToEmail as varchar(150),
	@Text_Batch_ID as int,
	@First_Attempt as int,
	@Last_TextTo as varchar(50),
	@Last_TextToEmail as varchar(150),
	@BatchesCreated as int = 0,
	@MessagesCreated as int = 0,
	@BatchStatus as char(1),
	@BATCH_STATUS_CREATED as char(1) = 'C',
	@BATCH_STATUS_QUEUED as char(1) = 'Q',
	@BATCH_STATUS_PRIORITY as char(1) = 'P',
	@TenantID as int,
	@AssetID as int


declare cTB cursor
for select
	TL.TextTypeID,
	TL.Subject,
	TL.TextMessage,
	TL.SentByID,
	convert(date, TL.SendDate) as 'SendDate',
	TL.SendTextPriority,
	TL.SendTextSchedule
from BPMCO.dbo.tblTextLog TL
where
	TL.SendTextImport is NULL -- only unimported messages
group by
	TL.TextTypeID,
	TL.Subject,
	TL.TextMessage,
	TL.SentByID,
	convert(date, TL.SendDate),
	TL.SendTextPriority,
	TL.SendTextSchedule
order by
	SendDate;


open cTB;


fetch next from cTB into
	@TextTypeID,
	@Subject,
	@TextMessage,
	@SentByID,
	@SendDate,
	@Priority,
	@Schedule;

-- select @TextTypeID, @Subject, @TextMessage, @SentByID, @SendDate, @Priority, @Schedule; -- DEBUG

while @@FETCH_STATUS = 0 begin

	begin transaction;

	insert into SendText.dbo.Text_Batch (
		TxtBat_Text_Type_ID,
		TxtBat_Subject,
		TxtBat_Text_Message,
		TxtBat_Sent_By_User_ID,
		TxtBat_Created_Time,
		TxtBat_Scheduled_Time,
		TxtBat_Batch_Status )
	values (
		@TextTypeID,
		@Subject,
		@TextMessage,
		@SentByID,
		@SendDate,
		@Schedule,
		@BATCH_STATUS_CREATED );  -- Batch is not ready yet

	set @Text_Batch_ID = @@IDENTITY;
-- select @Text_Batch_ID; -- DEBUG

	set @BatchesCreated = @BatchesCreated + 1;

	set	@First_Attempt = -1;  -- always first attempt if starting a new batch
	set	@Last_TextTo = '';
	set	@Last_TextToEmail = '';

	declare cTM cursor 
	for select
		TL.TextTo,
		TL.TextToEmail,
		TL.TenantID,
		TL.AssetID
	from BPMCO.dbo.tblTextLog TL
	where
		TL.TextTypeID = @TextTypeID and
		TL.Subject = @Subject and
		TL.TextMessage = @TextMessage and
		TL.SentByID = @SentByID and
		convert(date, TL.SendDate) = @SendDate and
		TL.SendTextImport is NULL
	order by
		TL.SendDate,
		TL.TextTo,
		TL.TextToEmail
	for update of TL.SendTextImport;

	open cTM;

	fetch next from cTM into
		@TextTo,
		@TextToEmail,
		@TenantID,
		@AssetID;

-- select @TextTo, @TextToEmail; -- DEBUG

	while @@FETCH_STATUS = 0 begin

		if @First_Attempt = 0 begin
			if (@TextTo != @Last_TextTo) or (@TextToEmail != @Last_TextToEmail) begin
				set	@First_Attempt = -1;
				set @Last_TextTo = '';
				set @Last_TextToEmail = '';
			end
		end

		if @First_Attempt != 0 begin

			insert into SendText.dbo.Text_Message (
				TxtMsg_Text_Batch_ID,
				TxtMsg_Text_To,
				TxtMsg_Text_To_Email,
				TxtMsg_Tenant_ID,
				TxtMsg_Asset_ID )
			values (
				@Text_Batch_ID,
				@TextTo,
				@TextToEmail,
				@TenantID,
				@AssetID );

			set @First_Attempt = 0;
			set @Last_TextTo = @TextTo;
			set @Last_TextToEmail = @TextToEmail;

			set @MessagesCreated = @MessagesCreated + 1;

		end

		update BPMCO.dbo.tblTextLog set
			SendTextImport = getdate()
		where
			current of cTM;

		fetch next from cTM into
			@TextTo,
			@TextToEmail,
			@TenantID,
			@AssetID;

	end;

	close cTM;
	deallocate cTM;

	if upper(isnull(@Priority, 'N')) = 'Y'
		set @BatchStatus = @BATCH_STATUS_PRIORITY
	else
		set @BatchStatus = @BATCH_STATUS_QUEUED;

	update SendText.dbo.Text_Batch set
		TxtBat_Batch_Status = @BatchStatus -- Batch is now ready for processing
	where
		TxtBat_Text_Batch_ID = @Text_Batch_ID;

	commit transaction;

	fetch next from cTB into
		@TextTypeID,
		@Subject,
		@TextMessage,
		@SentByID,
		@SendDate,
		@Priority,
		@Schedule;

end;


close cTB;
deallocate cTB;

select
	@BatchesCreated as 'BatchesCreated',
	@MessagesCreated as 'MessagesCreated';

end
go

/*
	Proc_ShutdownRequest.sql

	NOTE: This script creates a set of *3* stored procedures: Clear/Set/Test
*/

if object_id('dbo.ShutdownRequestSet', 'P') is not null
	drop procedure dbo.ShutdownRequestSet;
GO
if object_id('dbo.ShutdownRequestClear', 'P') is not null
	drop procedure dbo.ShutdownRequestClear;
GO
if object_id('dbo.ShutdownRequestTest', 'P') is not null
	drop procedure dbo.ShutdownRequestTest;
GO


CREATE PROCEDURE dbo.ShutdownRequestSet
	@AppName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	update App_Config set
		AppCon_Config_Value = 'True'
	where
		AppCon_App_Name = @AppName and
		AppCon_Config_Name = 'Shutdown_Request';

END
GO


CREATE PROCEDURE dbo.ShutdownRequestClear
	@AppName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	update App_Config set
		AppCon_Config_Value = 'False'
	where
		AppCon_App_Name = @AppName and
		AppCon_Config_Name = 'Shutdown_Request';

END
GO


CREATE PROCEDURE dbo.ShutdownRequestTest
	@AppName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	select
		AppCon_Config_Value
	from App_Config
	where
		AppCon_App_Name = @AppName and
		AppCon_Config_Name = 'Shutdown_Request';

END
GO

/*
	Proc_UpdateTextBatchStatus.sql
*/

if object_id('dbo.UpdateTextBatchStatus', 'P') is not null
	drop procedure dbo.UpdateTextBatchStatus;
GO


CREATE PROCEDURE dbo.UpdateTextBatchStatus
	@BatchID int,
	@BatchStatus char(1)
AS
BEGIN
	SET NOCOUNT ON;

	update TB set
		TB.TxtBat_Batch_Status = @BatchStatus,
		TB.TxtBat_Started_Time = case BS.BatSta_Set_Started_Time when 'C' then null when 'S' then getdate() else TB.TxtBat_Started_Time end,
		TB.TxtBat_Finished_Time = case BS.BatSta_Set_Finished_Time when 'C' then null when 'S' then getdate() else TB.TxtBat_Finished_Time end
	from Text_Batch TB
	inner join Batch_Status BS on BS.BatSta_Batch_Status = @BatchStatus
	where
		TB.TxtBat_Text_Batch_ID = @BatchID;

END
GO

/*
	Proc_UpdateTextMessageStatus.sql
*/

if object_id('UpdateTextMessageStatus', 'P') is not null
	drop procedure dbo.UpdateTextMessageStatus;
GO


CREATE PROCEDURE dbo.UpdateTextMessageStatus
	@MessageID int,
	@MessageStatus char(1)
AS
BEGIN
	SET NOCOUNT ON;

	update TM set
		TM.TxtMsg_Message_Status = @MessageStatus,
		TM.TxtMsg_Started_Time = case MS.MsgSta_Set_Started_Time when 'C' then null when 'S' then getdate() else TxtMsg_Started_Time end,
		TM.TxtMsg_Finished_Time = case MS.MsgSta_Set_Finished_Time when 'C' then null when 'S' then getdate() else TxtMsg_Finished_Time end
	from Text_Message TM
	inner join Message_Status MS on MS.MsgSta_Message_Status = @MessageStatus
	where
		TM.TxtMsg_Text_Message_ID = @MessageID;

END
GO

/*
	Trig_Text_Batch_Log.sql
*/

if object_id('TR_Text_Batch_Log', 'U') is not null
	drop table Text_Batch_Log;
go

create trigger TR_Text_Batch_Log on Text_Batch
after insert, update as
	insert into Text_Batch_Log select * from inserted;
go

/*
	Trig_Text_Message_Log.sql
*/

if object_id('TR_Text_Message_Log', 'U') is not null
	drop table Text_Message_Log;
go

create trigger TR_Text_Message_Log on Text_Message
after insert, update as
	insert into Text_Message_Log select * from inserted;
go

/*
	All_Index.sql
*/

create index IX_TxtBat_Batch_Status on Text_Batch(TxtBat_Batch_Status);
go

create index IX_TxtMsg_Text_To_Email on Text_Message(TxtMsg_Text_To_Email);
go

create index IX_TxtBat_Text_Batch_ID_Log on Text_Batch_Log(TxtBat_Text_Batch_ID);
go

create index IX_TxtMsg_Text_Message_ID_Log on Text_Message_Log(TxtMsg_Text_Message_ID);
go


/*
alter table Text_Message add constraint
	FK_TxtMsg_Text_Batch_ID foreign key (TxtMsg_Text_Batch_ID) references Text_Batch(TxtBat_Text_Batch_ID);
go
*/

