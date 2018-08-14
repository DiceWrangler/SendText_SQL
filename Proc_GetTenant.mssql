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

