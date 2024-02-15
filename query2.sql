use comp;
select * from employees;
describe employees;
select count(employee_id) from employees;
create table emp_contact as
select employee_id,first_name,last_name,email,phone_number from employees;
show tables;
select * from emp_contact;
describe employees;
describe emp_contact;