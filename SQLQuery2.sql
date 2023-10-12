
-->SQL PRACTICE<--

---------CREATE COMMANDS--------------

--> 1)TO CREATE DATABASE 
CREATE DATABASE EMPLOYEES

--> 2)TO SHOW LIST OF DATABASES

SELECT NAME
FROM SYS.DATABASES

--> 3)TO USE DATABASE
USE EMPLOYEES

--> 4)TO CREATE TABLE
CREATE TABLE tb_Employee(
emp_id int identity(1,1),
emp_name varchar(50),
emp_address varchar(50),
emp_phoneNo bigint,
emp_age int
)

--> 5) TO INSERT DATA INTO THE TABLE

insert into tb_Employee values ('Govind','Delhi',2342342432);
insert into tb_Employee values ('Rahul','Noida',35345345353);
insert into tb_Employee values ('Ramesh','Delhi',23423424324);
insert into tb_Employee values ('Suresh','Noida',33575353);
insert into tb_Employee values ('Ajay','Noida',56746345345);

--> ANOTHER WAY TO INSERT WHOLE DATA IS THAT 
insert into tb_Employee (emp_name,emp_address,emp_phoneNo,emp_age) values ('Govind','Delhi',2342342432,43),('Rahul','Noida',35345345353,53),('Ramesh','Delhi',23423424324,21),('Suresh','Noida',33575353,45),('Ajay','Noida',56746345345,55)

--------------ALTER COMMANDS-------------------------------

ALTER TABLE tb_employee  --(ADD NEW COLUMN)--
add  emp_salary int;

ALTER TABLE TB_EMPLOYEE --(CHANGE DATATYPE OF A COLUMN)--
ALTER COLUMN EMP_SALARY TINYINT;

ALTER TABLE TB_EMPLOYEE --(DROP COLUMN)--
DROP COLUMN EMP_SALARY

EXEC SP_RENAME 'TB_EMPLOYEE.EMP_AGE','AGE'; --(RENAME OF TEH COLUMN)--

EXEC SP_RENAME 'TB-EMPLOYEE1','TB_EMPLOYEE'; --(RENAME OF THE TABLE)--

--------------TRUNCATE TABLE----------

truncate table tb_employee

---------------UPDATE COMMANDS-------------

UPDATE TB_EMPLOYEE
SET AGE=65
WHERE EMP_ID=1

------------Select Commands--------------

select * from tb_Employee --(SELECT ALL RECORED)

select emp_name           --(SELECT PARTICULAR RECORED)
from tb_Employee 
where emp_address = 'Noida'

--------------DELETE COMMANDS--------------

--(ITS DELETING ENTIRE ROW)----
DELETE 
FROM TB_EMPLOYEE  
WHERE EMP_ID=3

--(You cannot delete data from just a field in SQL Server, but you can update the field to null (if it's nullable))--



-------------(opreation in sql )------

select emp_name,age
from TB_EMPLOYEE
where age>30;

select emp_name,age
from TB_EMPLOYEE
where age!=45;


---------------(Limit clause)---------

select emp_name from TB_EMPLOYEE limit 2; --(NOT WORKING)

select top 2 emp_name from tb_employee --(alternative to limit)

-------------(string funtion)-----


select upper(emp_name)
from TB_EMPLOYEE

select lower(emp_name)
from TB_EMPLOYEE

select upper(emp_name)
from TB_EMPLOYEE



select sum(age) from TB_EMPLOYEE 

select avg(age) from TB_EMPLOYEE 

select max(age) from TB_EMPLOYEE 

-------------(group by)--------

select emp_address,count(emp_address) 
from TB_EMPLOYEE
group by emp_address

--------------(order by)--------
select *
from TB_EMPLOYEE
order by emp_name asc;

select *
from TB_EMPLOYEE
order by emp_name desc;

------------(Group by  with having)------

select emp_name,avg(age>30)
from TB_EMPLOYEE
group by emp_name







