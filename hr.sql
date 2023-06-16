DESC employees;

INFORMATION employees;

INFO+ employees;

select * 
from employees;

/

select * from departments;


select first_name as name, last_name as surname, email from employees;


select first_name as "My name", email from employees;

Select employee_id, salary + nvl(salary*commission_pct,0) + 1000 AS new_salary, salary FROM employees;

--Dual table is a table unique to Oracle
select * from dual;


--Quote operator
select  'My Name is Adam' as "Output" from dual;

select  q'[My Name is Adam and I don't like apples]' as "Quote Operator" from dual;


select job_id from employees;


-- Unique and distinct is the same, the distinct keyword is the best is an operator 
-- Row based operator, only one distinct operator can be used 

select distinct job_id from employees;

select first_name from employees;

select distinct first_name from employees;

--When used with two or more columns the distinct operator returns the unique combination of those columns
select distinct job_id, department_id, first_name from employees;

--The distinct keyword is always written after the select statement


--String concatenation
select 'My name is ' || first_name from employees;

select first_name || ' ' || last_name as "Full Name" from employees;

--Testing null concatenation
--The null concatenation returns the concatenation
select 'The comission percentage is ' || comission_pct as concatenation, commision_pct from employees;


--Using aliases
select street_address || ',' || city || ',' || postal_code || ',' || state_province || ',' || country_id as "Full Address"from locations;


--Using arithmetic operator
SELECT employee_id, salary, (salary+100)*12 as annual_salary FROM employees;

SELECT sysdate+4 FROM dual;

SELECT employee_id, hire_date, hire_date+365 as "Next anniversary" FROM employees;

--Arithmetic operations with null return null
SELECT salary, salary*commission_pct, commission_pct FROM employees;
