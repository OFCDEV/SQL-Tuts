-- Stored PROCEDURES

use parks_and_recreation;

CREATE PROCEDURE large_salaries()
select salary
from employee_salary
where salary > 60000;

call large_salaries();

-- Another example
-- DELIMITER is the ending symbol; In general it is the ";"

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	select *
    from employee_salary
    where salary>50000;
    select *
    from employee_salary
    where salary>10000;
END $$
DELIMITER ;
-- It is a good practise to change the delimiter back to the default one

call large_salaries2();