/*
	Trig_Text_Message_Log.sql
*/

if object_id('TR_Text_Message_Log', 'U') is not null
	drop table Text_Message_Log;
go

create trigger TR_Text_Message_Log on Text_Message
after insert, update as
	insert into Text_Message_Log select * from inserted;
go

