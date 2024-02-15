-- -------------------------------------
-- Conversion functions
-- -------------------------------------
SELECT CAST(150 AS CHAR);

select * from employees;

select * from employees 
where commission_pct is null;

select employee_id, first_name,salary, commission_pct ,
coalesce(commission_pct,0)
from employees;

select employee_id, first_name,salary, ifnull(commission_pct,0)
from employees;

select employee_id, first_name,salary, coalesce(commission_pct,0)
from employees;

select coalesce(NULL,1,2,'Great Learning');

 

-- sorting data
select * from employees;


-- order by
select * from employees
order by first_name asc;


select * from employees
order by first_name desc;


select * from employees
order by salary;

select * from employees
order by salary desc;

select * from employees
order by first_name, last_name;