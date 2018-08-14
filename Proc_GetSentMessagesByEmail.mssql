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

