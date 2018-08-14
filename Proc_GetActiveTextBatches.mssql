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

