REM
REM    Create_All_Objects.bat
REM

type Table_*.sql > All_Table.sql
type Data_*.sql > All_Data.sql
type Proc_*.sql > All_Proc.sql
type Trig_*.sql > All_Trig.sql
REM type Index_*.sql > All_Index.sql

type All_Table.sql,All_Data.sql,All_Proc.sql,All_Trig.sql,All_Index.sql > All_Objects.sql
