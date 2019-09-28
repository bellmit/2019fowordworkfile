SELECT table_name
      ,tablespace_name
      ,num_rows
      ,blocks
  FROM ALL_tables
 WHERE owner = 'RUN'
 ORDER BY blocks ASC;

SELECT b.file_name file_name
      ,b.tablespace_name space_name
      
      ,b.bytes / 1024 / 1024 munm
      ,(b.bytes - SUM(nvl(a.bytes, 0))) / 1024 / 1024 usedm
      ,substr((b.bytes - SUM(nvl(a.bytes, 0))) / (b.bytes) * 100, 1, 5) "use%"
  FROM dba_free_space a
      ,dba_data_files b
 WHERE a.file_id = b.file_id
 GROUP BY b.tablespace_name
         ,b.file_name
         ,b.bytes
 ORDER BY b.tablespace_name;
 
 --alter tablespace "DB_DATA" add datafile '/home/oracle/oradata/RUNBIDBP/DB_DATA02.DBF'size 500M autoextend on next 50M maxsize unlimited;


SELECT tablespace_name
      ,autoextensible       
      ,file_id
      ,file_name
      ,round(bytes / (1024 * 1024), 0) total_space
  FROM sys.dba_data_files
 ORDER BY tablespace_name;

SELECT a.autoextensible FROM sys.dba_data_files a