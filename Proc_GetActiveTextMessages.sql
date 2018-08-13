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

