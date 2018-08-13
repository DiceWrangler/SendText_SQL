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

