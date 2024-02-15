-- -------------------------------------
-- Numerical functions
-- -------------------------------------

select 25+7, 25-7, 25*7,25/7 ;

select 25 mode7, 25 div 7;

SELECT COS(0) As Cos;


SELECT COS(1) As Cos;

-- Ceil, floor
select ceil(57.0001), ceil(57.898) ;
select floor(57.0001), floor(57.898) ;


-- round/trunc

select round(57.4982,2), round(57.898,2) ;
select truncate(57.4982,2), truncate(57.898,2) ;


-- least greatest
select least(10,20,30) from dual;
select greatest(10,20,30) from dual;

select least(20,5,30);

select greatest(20,5,30);

select * from employees;

select salary, salary * .1 as Bonus from employees;

select sqrt(121) from dual;
select power(3,2) from dual;

select abs(-324) from dual;
select sign(-76), sign( 76), sign(0) from dual;