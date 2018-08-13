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

