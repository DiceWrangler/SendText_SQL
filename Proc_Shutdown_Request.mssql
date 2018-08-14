/*
	Proc_ShutdownRequest.sql

	NOTE: This script creates a set of *3* stored procedures: Clear/Set/Test
*/

if object_id('dbo.ShutdownRequestSet', 'P') is not null
	drop procedure dbo.ShutdownRequestSet;
GO
if object_id('dbo.ShutdownRequestClear', 'P') is not null
	drop procedure dbo.ShutdownRequestClear;
GO
if object_id('dbo.ShutdownRequestTest', 'P') is not null
	drop procedure dbo.ShutdownRequestTest;
GO


CREATE PROCEDURE dbo.ShutdownRequestSet
	@AppName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	update App_Config set
		AppCon_Config_Value = 'True'
	where
		AppCon_App_Name = @AppName and
		AppCon_Config_Name = 'Shutdown_Request';

END
GO


CREATE PROCEDURE dbo.ShutdownRequestClear
	@AppName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	update App_Config set
		AppCon_Config_Value = 'False'
	where
		AppCon_App_Name = @AppName and
		AppCon_Config_Name = 'Shutdown_Request';

END
GO


CREATE PROCEDURE dbo.ShutdownRequestTest
	@AppName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	select
		AppCon_Config_Value
	from App_Config
	where
		AppCon_App_Name = @AppName and
		AppCon_Config_Name = 'Shutdown_Request';

END
GO

