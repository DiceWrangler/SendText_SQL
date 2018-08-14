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

