#create Database school
create database school;
use school;
#create a table student with following data
create table  Records (ID int, Name varchar(30), Age int, City varchar(30));
insert into Records
values(1,'Samuel',18,'Coimbatore'),(2,'Philip',20,'Pune'),(3,'John',22,'Chennai');
select * from Records;
# Enter the following command: set autocommit=0
set autocommit=0;
#commit the changes
commit;
#Insert new student 4, Raju, 17, Madurai
Insert into Records values(4,'Raju',17,'Madurai');
select * from Records;
#create a savepoint with name insert1
savepoint insert1;
#insert new student 5, Mark,19, Delhi
Insert into Records values(5,'Mark',19,'Delhi');
select * from Records;
#create a savepoint with name insert2
savepoint insert2;
#Delete Student with id2
set sql_safe_updates=0;
delete from Records where ID=2;
#Check the data in in the student table
select * from Records;
#rollback to savepoint insert 2
rollback to insert2;
#check the data
select * from Records;
#commit the changes
commit;