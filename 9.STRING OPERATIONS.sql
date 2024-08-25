-- String Functions

SELECT LENGTH('Skyfall');

select first_name,LENGTH(first_name)
from employee_demographics
ORDER BY 2;

-- UPPER and LOWER
select UPPER('sky');
select LOWER('SKY');

select first_name,UPPER(first_name)
from employee_demographics;

-- TRIM--> Removes the whitespaces
select TRIM('	sky	');
select LTRIM('	sky	');
select RTRIM('	sky	');

-- SUBSTRING --> LEFT or RIGHT
-- SUBSTRING takes 3 parameters; column_name,start index and index value for next char
-- LEFT/RIGHT takes 2 parameters
select first_name,
LEFT(first_name,3),
RIGHT(first_name,4),
SUBSTRING(first_name,3,2),
birth_date,
SUBSTRING(birth_date,6,2) AS birth_month
from employee_demographics;

-- REPLACE
select first_name, REPLACE(first_name,'A','Z')
from employee_demographics;

-- LOCATE
select LOCATE('x','Alexander');

select first_name,LOCATE('An',first_name) from employee_demographics;

-- CONCAT

select first_name,last_name,
CONCAT(first_name,' ',last_name) AS full_name
from employee_demographics;