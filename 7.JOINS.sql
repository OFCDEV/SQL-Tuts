#JOINS
-- By default JOIN represents INNER JOIN;After that we have to specify which columns we are going to check from both the tables using 'ON' keyword.
-- To avoid ambiougity we should mention specific table name.column_name

select * from employee_demographics;
select * from employee_salary;

select * 
from employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
select dem.employee_id,age,occupation from employee_demographics AS dem INNER JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id;
-- To avoid ambiougity we should mention specific table name.column_name

-- OUTER JOIN
-- It has two parts; Left Outer Join and Right Outer Join
-- Left outer join takes everything from the left table and retrun only matches with the right one;

select * 
from employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	on dem.employee_id = sal.employee_id;
    
select * 
from employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	on dem.employee_id = sal.employee_id;
    
-- SELF JOIN

select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name,
emp2.first_name as first_name_emp2,
emp2.last_name as last_name_emp2
from employee_salary as emp1
join employee_salary as emp2
	on emp1.employee_id+1 = emp2.employee_id;
    
    
-- Joining multiple tables together
select * 
from employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments as pd
	ON sal.dept_id = pd.department_id
;
select * from parks_departments;