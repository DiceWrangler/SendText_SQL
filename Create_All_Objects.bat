REM
REM    Create_All_Objects.bat
REM

type Table_*.mssql > All_Table.mssql
type Data_*.mssql > All_Data.mssql
type Proc_*.mssql > All_Proc.mssql
type Trig_*.mssql > All_Trig.mssql
REM type Index_*.mssql > All_Index.mssql

type All_Table.mssql,All_Data.mssql,All_Proc.mssql,All_Trig.mssql,All_Index.mssql > All_Objects.mssql
