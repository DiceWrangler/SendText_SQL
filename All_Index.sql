/*
	All_Index.sql
*/

create index IX_TxtBat_Batch_Status on Text_Batch(TxtBat_Batch_Status);
go

create index IX_TxtMsg_Text_To_Email on Text_Message(TxtMsg_Text_To_Email);
go

create index IX_TxtBat_Text_Batch_ID_Log on Text_Batch_Log(TxtBat_Text_Batch_ID);
go

create index IX_TxtMsg_Text_Message_ID_Log on Text_Message_Log(TxtMsg_Text_Message_ID);
go


/*
alter table Text_Message add constraint
	FK_TxtMsg_Text_Batch_ID foreign key (TxtMsg_Text_Batch_ID) references Text_Batch(TxtBat_Text_Batch_ID);
go
*/

