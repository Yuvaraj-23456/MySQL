#Create a database called "employee_db" in SQL Workbench Or Command-Line Interface
create database employee_db;
use employee_db;
show tables;
#What command can be used in SQL Workbench to display a list of all databases in a MySQL connection?
show databases;
#How to check whether the database is selected and What is the process for selecting the database named 'employee_db' in SQL Workbench?
use employee_db;
#Create a table called "emp" with columns for employee ID, name, department, and salary
create table emp(employee_Id int, name varchar(20),department varchar(30),salary int);
show tables;
describe emp;
#Rename “emp” database to “employees” in SQL Workbench Or Command-Line Interface
rename table emp to employees;
show tables;
#How to describe the columns for a table named 'employees' in SQL?
describe employees;
#How can the name of a column be modified from 'employee_id' to 'Id' in SQL?
alter table employees change employee_Id Id int;
describe employees;
#How can we add two columns after the name column in employees table?Fields are “Age”, “Sex”
alter table employees add column Age int after name;
alter table employees add column Sex int after name;
describe employees;
#How can we change the datatype of name column in SQL?
alter table employees modify name int;
describe employees;
#How can we drop age column in employees table
alter table employees drop column Age;
describe employees;
# How to delete the records without deleting the structure of employees table?
select * from employees;
Truncate employees;
#What is the process for dropping a table and verifying its deletion in SQL?
#What is the process for dropping a database and verifying its deletion in SQL?