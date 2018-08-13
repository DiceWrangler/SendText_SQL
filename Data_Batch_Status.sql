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

