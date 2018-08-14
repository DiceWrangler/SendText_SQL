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

