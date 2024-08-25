#Having VS. Where
-- When we use aggregated functions and at the same time we use where,it gives us error because the rows for aggregated function with where condition hasn't been created yet.
-- Only use HAVING clause if group by function in in use.

select gender , AVG(age) from employee_demographics where AVG(age) >40 group by gender ;
#This is invalid.
select gender , AVG(age) from employee_demographics where gender = 'male' group by gender ;
#This is valid.

select gender , AVG(age) from employee_demographics group by gender HAVING AVG(age)>40;

select occupation,AVG(salary) from employee_salary where occupation LIKE '%manager%' group by occupation;

select occupation,AVG(salary) from employee_salary where occupation LIKE '%manager%' group by occupation HAVING AVG(salary)>60000;