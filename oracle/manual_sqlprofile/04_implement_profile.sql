-- Get the SQL_ID for the problematic statement
-- Execute it once to get the SQL_ID

set lines 200
set pages 100

select a.id, b.text2 from profile_test1 a, profile_test2 b where a.id =20 and a.id=b.id;

col SQL_TEXT form a60

SELECT SQL_ID, SQL_TEXT
FROM V$SQL
WHERE SQL_TEXT LIKE 'select a.id, b.text2 from profile_test1 a, profile_test2 b where a.id =20 and a.id=b.id%';

DECLARE
  SQL_FTEXT CLOB;
BEGIN
SELECT SQL_FULLTEXT INTO SQL_FTEXT FROM V$SQLAREA WHERE SQL_ID = '23yyk92xsubyq';
 
DBMS_SQLTUNE.IMPORT_SQL_PROFILE(
  SQL_TEXT => SQL_FTEXT,
  PROFILE => SQLPROF_ATTR('LEADING(@"SEL$1" "B"@"SEL$1" "A"@"SEL$1")'),
  NAME => 'PROFILE_23yyk92xsubyq',
  REPLACE => TRUE,
  FORCE_MATCH => TRUE
);
END;
/