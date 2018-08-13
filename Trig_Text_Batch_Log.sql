/*
	Trig_Text_Batch_Log.sql
*/

if object_id('TR_Text_Batch_Log', 'U') is not null
	drop table Text_Batch_Log;
go

create trigger TR_Text_Batch_Log on Text_Batch
after insert, update as
	insert into Text_Batch_Log select * from inserted;
go

