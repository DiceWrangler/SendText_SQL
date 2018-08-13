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

/*
	Data_Batch_Status.sql
*/

truncate table Batch_Status;
go


insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('C','Created' ,1.0,0,0,'C','C');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('S','Started' ,2.0,1,0,'S','C');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('P','Priority',2.1,1,0,'C','C');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('R','Retry'   ,3.0,1,0,'C','C');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('I','Ignore'  ,3.1,0,0,'N','N');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('Q','Queued'  ,3.2,1,0,'C','C');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('E','Error'   ,4.0,0,1,'N','S');
insert into Batch_Status(BatSta_Batch_Status,BatSta_Description,BatSta_Priority,BatSta_Active,BatSta_Terminal,BatSta_Set_Started_Time,BatSta_Set_Finished_Time) values ('F','Finished',4.1,0,1,'N','S');
go


select * from Batch_Status order by BatSta_Priority;
go

/*
	Data_Message_Status.sql
*/

truncate table Message_Status;
go


insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('C','Created' ,1.0,1,0,'C','C');
insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('S','Started' ,2.0,1,0,'S','C');
insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('R','Retry'   ,3.0,1,0,'C','C');
insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('I','Ignore'  ,3.1,0,0,'N','N');
insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('E','Error'   ,4.0,0,1,'N','S');
insert into Message_Status(MsgSta_Message_Status,MsgSta_Description,MsgSta_Priority,MsgSta_Active,MsgSta_Terminal,MsgSta_Set_Started_Time,MsgSta_Set_Finished_Time) values ('F','Finished',4.1,0,1,'N','S');
go


select * from Message_Status order by MsgSta_Priority;
go

