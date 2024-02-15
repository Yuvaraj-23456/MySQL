use week4;
select * from `department_ details`;
select * from `employee_ details`;

#5. Extract employee_id, first_name, last_name,salary, phone_number, email of the AC_ACCOUNTANTs who earn a salary more than all the AD_VPs.(2 Rows)
select employee_id,first_name,last_name,salary,email,phone_number,job_id from `employee_ details` where job_id='AC_ACCOUNTANT';

#6. Write a Query to display the employee_id, first_name, last_name,department_id of the employees who have been recruited after the middle(avg) hire_date. (10 Rows)
select employee_id,first_name,last_name,department_id,hire_date from `employee_ details` where avg(hire_date);

#7. Extract employee_id, first_name, last_name, phone_number, salary and job_id of the employees belonging to the 'Contracting' department (3 Rows)
select first_name,last_name,phone_number,salary,job_id,department_name from `employee_ details`,`department_ details`where department_name='Contracting';

#8. Extract employee_id, first_name, last_name, phone_number, salary and job_id of the employees who does not belong to 'Contracting' department(18 Rows)
select first_name,last_name,phone_number,salary,job_id,department_name from `employee_ details`,`department_ details`where department_name not like'%Contracting%';
#9. Display the employee_id, first_name, last_name, job_id and department_id of the employees who were recruited first in the department(7 Rows)

#10. Display the employee_id, first_name, last_name, salary and job_id of the employees who earn maximum salary for every job.( 7Rows)