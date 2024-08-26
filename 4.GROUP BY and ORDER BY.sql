#GROUP BY

select salary,AVG(salary) from employee_salary;
#Error Code: 1140. In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'parks_and_recreation.employee_salary.salary'; this is incompatible with sql_mode=only_full_group_by


select gender from employee_demographics group by gender;
#select first_name from employee_demographics group by gender; This gives error because we are not using agggregated functions(Like AVG) with first_name

select gender,AVG(age),MAX(age),MIN(age),COUNT(age) from employee_demographics group by gender;

select occupation from employee_salary group by occupation;

select occupation,salary from employee_salary group by occupation,salary;

#ORDER BY --> It sorts the rows by ascending or descending order

select * from employee_demographics order by first_name asc;
select * from employee_demographics order by first_name desc;


select * from employee_demographics order by gender,age DESC;