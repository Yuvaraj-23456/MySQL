use company;

show tables;

-- selecting all the columns

select * from customers;

-- Insert data into the table
INSERT INTO customers VALUES (4,'Jeevan', 'Sharma', 'India');
select * from customers;

-- Fetch the first name and country from customers
select first_name, country from customers;

-- Where is used to filter rows from the dataset
-- Display employees belonging to India
select * from customers 
where country = 'India';

select * from customers 
where country = 'Spain';






CREATE DATABASE hr_emp;
USE hr_emp;



-- Set Operations

CREATE TABLE employees1 (
	employee_id INT (11) UNSIGNED NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	salary DECIMAL(8, 2) NOT NULL,	
	PRIMARY KEY (employee_id)
	);


INSERT INTO employees1 VALUES (26,'Jagriti','Bahal',9000);
INSERT INTO employees1 VALUES (27,	'Sang',	'Wuu',	4000);
INSERT INTO employees1 VALUES (28,	'Jamie','Lannister',3400);

select * from employees1;

-- Set operations
-- union all lists duplicates rows
select employee_id, first_name, last_name, salary from employees
union all
select employee_id, first_name, last_name, salary from employees1;


select employee_id, first_name, last_name, salary from employees
union 
select employee_id, first_name, last_name, salary from employees1;


select employee_id, first_name, last_name, salary, email from employees
union 
select employee_id, first_name, last_name, salary, ' ' from employees1;








