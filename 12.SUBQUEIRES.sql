-- SUBQUERIES
-- subqueries are basically queries within another query

select *
from employee_demographics
WHERE employee_id IN(
		select employee_id
        from employee_salary
        where dept_id = 1
);

select * from employee_demographics;
select * from employee_salary;

select first_name,salary,
(SELECT AVG(salary)
	FROM employee_salary)
from employee_salary;