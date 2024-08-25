#WHERE Clause

SELECT first_name,age,gender FROM employee_demographics WHERE first_name='Leslie';

SELECT * FROM employee_demographics WHERE first_name='Leslie';

select * from employee_salary where salary > 60000;

select * from employee_demographics where gender = 'male';

select * from employee_demographics where gender != 'male';

select * from employee_demographics where birth_date > '1985-01-01';

#Logical Operators --> AND OR NOT

select * from employee_demographics where birth_date > '1985-01-01' AND gender = 'male';

select * from employee_demographics where (first_name = 'Leslie' AND age = 44) OR age>55;

#Like Statement is used to find for specific patterns in a table
-- % it means any value and _ means a specific values

select * from employee_demographics where first_name LIKE 'Jer%';
#This means any first_name starts from Jer

select * from employee_demographics where first_name LIKE '%er%';
#This means anything comes before and anything comes after "er"

select * from employee_demographics where first_name LIKE 'a__';
#This means there is a name starts from 'a' and has specifically two characters after that

select * from employee_demographics where first_name LIKE 'a__%';
#Any name starts with a and specifiaclly two characters and so on

