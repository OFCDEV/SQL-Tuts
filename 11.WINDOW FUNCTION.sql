-- Usage of Window function:

select gender,AVG(salary) AS avg_salary
from employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
group by gender;

-- In the above query , the output shows only two rows based on genders but what if we want that for each indivisuals; If we add first_name,last_name in SELECT clause it gave an error
-- So in that case we have to use WINDOW FUNCTIONS

select dem.first_name,dem.last_name, gender,salary,AVG(salary) OVER() AS avg_salary
from employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

select dem.first_name,dem.last_name, gender,salary,SUM(salary) OVER(partition by gender order by dem.employee_id) AS Rolling_Total
from employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- Another Example
select dem.first_name,dem.last_name,gender,salary,
ROW_NUMBER() OVER() as no_rows
from employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
select dem.first_name,dem.last_name,gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender) as no_rows
from employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
select dem.first_name,dem.last_name,gender,salary,
ROW_NUMBER() OVER(partition by gender ORDER BY salary DESC) row_num,
RANK() OVER(partition by gender ORDER BY salary DESC) rank_num
from employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;