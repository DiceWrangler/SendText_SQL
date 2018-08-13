/*
	Data_App_Config.sql
*/

delete from App_Config where AppCon_App_Name = 'SendText';
go

insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Shutdown_Request', 'False')  -- False | True
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Cycle_Interval', '10000') -- milliseconds
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Email_to_Use', 'Test')  -- Live | Test
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Test_Email', '7208403074@messaging.sprintpcs.com') -- SMS text
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Output', 'Draft')  -- Send | Draft
insert into App_Config(AppCon_App_Name, AppCon_Config_Name, AppCon_Config_Value) values ('SendText', 'Process', 'First')  -- All | First
go

select * from App_Config where AppCon_App_Name = 'SendText' order by AppCon_App_Name, AppCon_Config_Name;
go

