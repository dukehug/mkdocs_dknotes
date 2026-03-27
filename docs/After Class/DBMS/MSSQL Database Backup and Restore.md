2026-02-19 13:47

Tags: #DBMS  
Author:  Duke Hsu

---
## MSSQL Database Backup and Restore


!!! warning
	數據操作有風險！！請根據業務情況和需求進行備份和恢復！ 
	Data handling involves risks! Please back up and restore data according to your business needs and requirements!


```sql
-- 1. 先備份現況（最重要！）
BACKUP DATABASE XUdb TO DISK = 'D:\backup\XUdb_before_YYYYMMDD.bak' 
	WITH COMPRESSION;

-- 2. 檢查備份內容
RESTORE HEADERONLY FROM DISK = 'D:\DBMS\XUdb.bak';
RESTORE FILELISTONLY FROM DISK = 'D:\DBMS\XUdb.bak';

-- 3. 踢掉所有人
ALTER DATABASE XUdb SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

-- 4. 覆蓋還原（可加 MOVE 如果路徑不同）
RESTORE DATABASE XUdb
	FROM DISK = 'D:\DBMS\XUdb.bak'
	WITH REPLACE, RECOVERY;
	    -- , MOVE 'XUdb_Data' TO 'E:\Data\XUdb.mdf'    ← 如有需要
	    -- , MOVE 'XUdb_Log'  TO 'F:\Log\XUdb.ldf';

-- 5. 恢復正常
ALTER DATABASE XUdb SET MULTI_USER;
```
 






----
### References
