-- Union in MySQL
-- Union allows to combine rows together(same table or different also)
-- By default UNION is DISTINCT, so it only takes unique values.

select first_name,last_name
from employee_demographics
UNION
select first_name,last_name
from employee_salary;

-- If we want all the values(not only unique), we can use UNION ALL.
select first_name,last_name
from employee_demographics
UNION ALL
select first_name,last_name
from employee_salary;

select first_name,last_name,'Old' as Label
from employee_demographics
where age>50
UNION
select first_name,last_name,'Highly Paid' as Label
from employee_salary
where salary>70000;