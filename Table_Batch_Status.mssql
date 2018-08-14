/*
	Table_Batch_Status.sql
*/

if object_id('Batch_Status', 'U') is not null
	drop table Batch_Status;
go


CREATE TABLE Batch_Status(
	BatSta_Batch_Status char(1) NOT NULL,
	BatSta_Description varchar(50) NOT NULL,
	BatSta_Priority float NULL,
	BatSta_Active bit NULL, -- Eligible to be sent?
	BatSta_Terminal bit NULL,  -- Terminal state
	BatSta_Set_Started_Time char(1) NULL, -- (S)et, (C)lear, (N)o change
	BatSta_Set_Finished_Time char(1) NULL, -- (S)et, (C)lear, (N)o change
	CONSTRAINT PK_Batch_Status PRIMARY KEY CLUSTERED (BatSta_Batch_Status)
);
GO

