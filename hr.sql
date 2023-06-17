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

select  q'[My Name is Adam and I dont like apples]' as "Quote Operator" from dual;


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

-- WHERE clause
SELECT * FROM employees WHERE salary > 10000;

SELECT * FROM employees WHERE job_id = 'IT_PROG';

-- WHERE clause comparison operators

SELECT * FROM employees WHERE hire_date = '21-MAY-07';

--USE BETWEEN AND
SELECT * FROM employees WHERE salary BETWEEN 10000 AND 14000;

SELECT * FROM employees WHERE hire_date BETWEEN '17-AUG-02' AND '05-JAN-05';

-- IN OPERATOR
SELECT * FROM employees
WHERE employee_id IN (50, 100, 65, 210, 150);

SELECT * FROM employees
WHERE employee_id IN ('Steven','Peter', 'Adam');

SELECT * FROM employees
WHERE hire_date IN ('08-MAR-08','30-JAN-05');

-- USING THE LIKE OPERATOR
SELECT * FROM employees WHERE job_id LIKE 'SA%';

-- All the names that start with the letter A
SELECT * FROM employees WHERE first_name LIKE 'A%';

-- All the names that end with the letter a
SELECT * FROM employees WHERE first_name LIKE '%a';

-- Any of the names that have a letter a
SELECT * FROM employees WHERE first_name LIKE '%a%';

-- Matches any character _, the returning first name must start with any character but it must be followed by the r
SELECT * FROM employees WHERE first_name LIKE '_r%';

-- IS NULL operator
SELECT * FROM employees WHERE commission_pct IS NULL;

SELECT * FROM employees WHERE commission_pct IS NOT NULL;

-- Using AND OR NOT
SELECT * FROM employees WHERE job_id = 'SA_REP'
AND salary > 10000 AND first_name = 'Lisa';

SELECT * FROM employees WHERE job_id = 'SA_REP'
OR salary > 10000 ;

SELECT * FROM employees WHERE salary > 10000 
AND job_id NOT IN ('SA_MAN', 'SA_REP');

-- Operator precedence
SELECT first_name, last_name, job_id, salary FROM employees
WHERE job_id = 'IT_PROG' OR job_id = 'ST_CLERK' AND salary > 5000;

SELECT first_name, last_name, job_id, salary FROM employees
WHERE (job_id = 'IT_PROG' OR job_id = 'ST_CLERK') AND salary > 5000;

SELECT first_name, last_name, department_id, salary
FROM employees
WHERE salary > 10000 AND department_id = 20 OR department_id = 30;

SELECT first_name, last_name, department_id, salary
FROM employees
WHERE salary > 10000 AND (department_id = 20 OR department_id = 30);


-- Exercise 1 solution
SELECT DISTINCT product_status FROM products;

-- Exercise 2 solution
SELECT employee_id, salary, (salary*1.20)+1000 AS new_salary FROM employees;

--  Exercise 3 solution
SELECT employee_id, first_name, last_name FROM employees WHERE job_id = "SA_MAN";

-- Exercise 4 solution
SELECT employee_id, first_name, last_name, job_id 
FROM employees 
    WHERE job_id IN('SA_MAN', 'SA_REP');

-- Exercise 5 solution
    SELECT employee_id, first_name, last_name, job_id 
FROM employees 
 WHERE job_id LIKE '%MAN';

-- Exercise 6 solution
 SELECT employee_id, first_name, last_name, salary 
FROM employees
    WHERE salary < 10000 AND job_id LIKE '%MAN';

-- Exercise 7 solution 
SELECT employee_id, department_id, job_id, salary 
FROM employees
WHERE department_id = 50 OR job_id = "SA_REP" AND salary BETWEEN 5000 AND 10000;