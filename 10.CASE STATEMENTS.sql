-- CASE

select first_name,last_name,
CASE
	WHEN age<=35 THEN 'YOUNG'
    WHEN age BETWEEN 36 AND 46 THEN 'MIDDLE-AGED'
    WHEN age>=50 THEN "On Death's Door"
END AS age_bracket
from employee_demographics;

-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% Bonus

select first_name,last_name,salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
	WHEN salary > 50000 THEN salary + (salary * 0.07)
END AS increment,
CASE
	WHEN dept_id = 6 THEN salary*.10
END AS Bonus
from employee_salary;