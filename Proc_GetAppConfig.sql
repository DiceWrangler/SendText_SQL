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

