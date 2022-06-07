create table profile_test1(id number(10), text varchar2(100));
create table profile_test2(id number(10), text2 varchar2(100));
insert into profile_test1 values (10, 'First test table 1');
insert into profile_test1 values (20, 'Second test table 1');
insert into profile_test2 values (10, 'First test table 2');
insert into profile_test2 values (20, 'Second test table 2');
commit;
