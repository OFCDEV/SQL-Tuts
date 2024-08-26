-- CTEs stand for Common Table Expression

WITH CTE_Example as
(
SELECT gender,AVG(salary) as avg_sal,MAX(salary),MIN(salary),COUNT(salary)
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender)
select AVG(avg_sal) from CTE_Example;

WITH CTE_example2 AS
(
	select employee_id,gender,birth_date
    from employee_demographics
    where birth_date > '1985-01-01'
),
CTE_another AS
(
	select employee_id,salary
    from employee_salary
    where salary>50000
)
select *
from CTE_example2
JOIN CTE_another
	ON CTE_example2.employee_id = CTE_another.employee_id