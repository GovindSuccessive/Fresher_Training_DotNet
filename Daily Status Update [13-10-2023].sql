
---13/08/23------
-------Key in Database-----------

--Primary key
--Foreign key
--candidate key
--super key
--unique key
--alternative key
--Composite key

create table tb_Management(
mng_id int identity(1,1) primary key,
mng_name varchar(50),
mng_address varchar(50),
mng_phoneNo bigint,
emp_id int,
foreign key (emp_id) references tb_employee (emp_id)
)


INSERT INTO tb_Management(MNG_NAME,MNG_ADDRESS,MNG_PHONENO,EMP_ID) VALUES ('RANI','DWARKA',534533423,1),('ROHIT','ROHINI',345377434,2),('RAVI','HAUS KHAS',923533423,2)


----INNER JOIN--

SELECT MNG_NAME,EMP_NAME
FROM TB_EMPLOYEE
INNER JOIN tb_Management
ON TB_EMPLOYEE.EMP_ID=tb_Management.EMP_ID

---LEFT OUTER JOIN--

SELECT *
FROM TB_EMPLOYEE
LEFT JOIN tb_Management
ON TB_EMPLOYEE.EMP_ID=tb_Management.EMP_ID

--RIGHT OUTER JOIN--

SELECT *
FROM TB_EMPLOYEE
RIGHT JOIN tb_Management
ON TB_EMPLOYEE.EMP_ID=tb_Management.EMP_ID

--FULL OUTER JOIN---

SELECT *
FROM TB_EMPLOYEE
FULL JOIN tb_Management
ON TB_EMPLOYEE.EMP_ID=tb_Management.EMP_ID

--SELF JOIN--

SELECT *
FROM tb_Management AS T1
JOIN TB_MANAGEMENT AS T2
ON T1.MNG_ID = T2.EMP_ID

--cross join--

select *
from tb_Management 
cross  join TB_EMPLOYEE 









SELECT * FROM TB_EMPLOYEE
select * from tb_Management
