-- Triggers
-- Triggers take place when an event is occured and event takes place when the time interval is reached.
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics(employee_id,first_name,last_name)
    VALUES(NEW.employee_id,NEW.first_name,NEW.last_name);
END $$

DELIMITER ;

INSERT INTO employee_salary(employee_id,first_name,last_name,occupation,salary,dept_id)
VALUES(69,'Vyke','LORD','GOD',6900000,14);
select * from employee_salary;

-- Now check the employee_demographics table
select * from employee_demographics;

-- EVENT
DELIMITER $$
CREATE EVENT delete_retires
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    where age>=60;
END $$

DELIMITER ;

select * from employee_demographics;