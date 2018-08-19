/*
	Data_App_Config_RouteText.sql
*/

delete from App_Config where AppCon_App_Name = 'RouteText';
go

insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('RouteText', 'Shutdown_Request', 'False')  -- False | True
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('RouteText', 'Cycle_Interval', '10000') -- milliseconds
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('RouteText', 'Output', 'Draft')  -- Send | Draft
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('RouteText', 'Email_to_Use', 'Test')  -- Live | Test
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('RouteText', 'Test_Email', 'dicewrangler@gmail.com') -- Test email
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('RouteText', 'Admin_Email', 'dicewrangler@yahoo.com') -- Administrator's email
go


select * from App_Config where AppCon_App_Name = 'RouteText' order by AppCon_App_Name, AppCon_Config_Name;
go

