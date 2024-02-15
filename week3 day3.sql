use hr;

#1.List the employee id,first name,last name,job title and the minimum and maximum salary for that job_id
select * from employees,jobs;
select * from jobs;
select employee_id,first_name,last_name,job_title,min_salary,max_salary from employees e inner join jobs j on e.job_id=j.job_id;

#2.display the department name and number of employees in each department.if there is no employee in a department display 0.
select * from departments,employees; 
select department_name,count(distinct employee_id) as no_of_employees from departments d left outer join employees e on d.department_id=e.department_id group by 1; 

#3.How many departments are based out of the city seattle(departments,location)
select * from locations,departments;
select count(distinct department_name) as departments from departments d inner join locations l on d.location_id=l.location_id where city='Seattle';

#4.list all the employees who have more than 1 record in job_history(employee,job_history)
select * from employees,job_history;
SELECT 
    e.employee_id, first_name, last_name
FROM
    employees e
        INNER JOIN
    job_history jh ON e.employee_id = jh.employee_id
GROUP BY 1
HAVING COUNT(e.employee_id) > 1;


#5.List the department name and average salary of all employee in the deaprtment.If an employee does not have an department,show depatment name known as unknown.
   #If a department does not have employee show avg_salary as 0
   
   select * from departments;
   select * from employees;
   select coalesce(department_name,'unknown') from department;
   select coalesce(department_id,'unknown') from employees e  ;