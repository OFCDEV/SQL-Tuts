#LIMIT

select * from employee_demographics HAVING gender = 'female' order by age  DESC LIMIT 3 ;

select * from employee_demographics where gender = 'male' order by age  DESC LIMIT 3 ;

#ALIASING -- It is just a method to change the name of the column.keyword 'AS'

select gender,AVG(age) AS avg_age from employee_demographics group by gender HAVING avg_age > 40;