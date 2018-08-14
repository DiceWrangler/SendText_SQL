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

