-- TWO ways to create a temp table
-- first

CREATE TEMPORARY TABLE temp_table(
employee_id INT NOT NULL,
first_name VARCHAR(20),
last_name VARCHAR(10)
);

insert into temp_table(employee_id,first_name,last_name) values (101,'haha','hehe');

select * from temp_table;

-- Second Method

create temporary table salary_over_60k
SELECT * from employee_salary
where salary > 60000;

select * from salary_over_60k;