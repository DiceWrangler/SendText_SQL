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

