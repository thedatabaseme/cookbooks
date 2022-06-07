-- Explain and get us the plan for the following statement

explain plan for select a.id, b.text2 from profile_test1 a, profile_test2 b where a.id =20 and a.id=b.id;

set lines  200
set pages 100
select * from table(dbms_xplan.display(null,null,'ADVANCED'));