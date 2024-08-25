SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name,last_name,gender FROM employee_demographics;

#PAMDAS --> Order of Arithmatic Equations

SELECT DISTINCT first_name,age,(age+10)*10 FROM employee_demographics;
#DISTINCT gives only unique values