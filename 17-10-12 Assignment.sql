
------------Assignment----------------

create database db_Employee1;
use db_Employee1

create table tb_Employee(
PK_Emp_Id int identity(1,1) primary key,
emp_FirstName varchar(50),
emp_LastName varchar(50),
DepartmentID int,
Foreign key (DepartmentId) references tb_Department(Dept_ID)
)


create table tb_Department(
Dept_ID int primary key identity(1,1),
Dept_Name varchar(50)
)

create table tb_Orders(
Order_ID int identity(1,1),
Customer_ID int,
OrderDate date
)


create table tb_OrderDetails(
OrderDetailsID int identity(1,1) Primary key,
OrderId int,
ProductID int,
Quantity int,
Foreign key (OrderId) references tb_Orders(Order_ID)
)

create table tb_Products(
Product_ID int identity(1,1) primary key,
Product_Name varchar(50),
UnitPrice int
)


---Insertition data into Employee table

select * from tb_Employee
Insert into tb_Employee (emp_FirstName,emp_LastName,DepartmentID)
values ('Govind','Sharma',1),('Prince','Kumar',2),
('Ajay','Bohra',3),('UTkarsh','Srivastav',4),
('Yash','Bhel',5),('Akshat','Kumar',2),('Govind','Rathod',1)


select * from tb_Department
Insert into tb_Department (Dept_Name)
values ('DotNet'),('React'),('NodeJs'),('HR'),('PHP')


select * from tb_orders
insert into tb_Orders (customer_id,OrderDate)  values (3,'12-04-23'),
(5,'22-07-22'),(1,'11-01-23'),(8,'08-02-23')



select * from tb_Products
insert into tb_Products (Product_Name,UnitPrice)
values ('Keyboard',550),('Mouse',200),('Laptop',45000),
('Water_bottle',150)

select * from tb_OrderDetails
insert into tb_OrderDetails (OrderId,ProductID,Quantity)
values (3,3,2),(2,1,5),(4,4,12)



---Q1. 1.Retrieve the first and last names of all employees.

select emp_FirstName,emp_LastName
from tb_Employee

--Q2. 2.Find the total number of employees in each department.

select D.Dept_Name,count(E.PK_Emp_Id)
from tb_Employee as E
inner join tb_Department as D
on D.Dept_ID=E.DepartmentID
group by D.Dept_Name

---Q3. List the names of departments that have no employees.
select Dept_name
from tb_Department
where Dept_Name Not in(
		 select D.Dept_Name
		 from tb_Employee as E
		 inner join tb_Department as D
		 on D.Dept_ID=E.DepartmentID
		 group by D.Dept_Name
 )

 --Q4.Retrieve the details of the employee with the highest `EmployeeID`.

 select * 
 from tb_Employee
 where PK_Emp_Id=(select max(PK_emp_id) from tb_Employee)

 --Q5.Calculate the average quantity of products ordered in the `OrderDetails` table.

 select AVG(Quantity)
 from tb_OrderDetails
 
 --Q6.List the names of employees who have placed orders.

 select E.emp_FirstName,E.emp_LastName
from tb_Employee as E
inner join tb_Orders as O
on O.Customer_ID=E.PK_Emp_Id

--Q7. Find the total number of orders placed in each year.

select year(orderDate),Count(Order_Id)
from tb_orders
group by year(OrderDate)

--Q8. Retrieve the product names that have never been ordered.

select Product_Name
from tb_products 
where Product_ID NOT IN (select ProductID from tb_OrderDetails)

--Q9. List the employees who have the same first name as their department.

	select T1.emp_FirstName,T1.emp_LastName,T1.DepartmentID
	from tb_Employee as T1
	join tb_employee as T2
	on t1.emp_FirstName=t2.emp_FirstName and t1.DepartmentID=t2.DepartmentId and t1.PK_Emp_Id!=t2.PK_Emp_Id

	select * from tb_Employee where emp_FirstName IN (select Dept_Name  from tb_Department )
	
--10. Calculate the total price of products sold in each order.

	select P.Product_Name,P.UnitPrice,OD.Quantity,P.UnitPrice*OD.Quantity As TOTAL
	from tb_Products as P
	inner join tb_OrderDetails as OD
	on P.Product_ID=OD.ProductID

--11. Find the customer who placed the largest total value of orders.(4 table uses)

   
   
    select OD.OrderId,P.Product_Name,P.UnitPrice,OD.Quantity,P.UnitPrice*OD.Quantity As TOTAL
	from tb_Products as P
	inner join tb_OrderDetails as OD
	on P.Product_ID=OD.ProductID


--12. Retrieve the employee with the highest total quantity of products ordered.
	
	select * 
	from tb_Employee
	where PK_Emp_Id in( 
	select customer_id,max(quantity) from tb_Orders where	quantity
	select * from tb_OrderDetails as OD inner join tb_orders as O on OD.OrderId=O.Order_ID


--13. List the departments with more than five employees.

	select D.Dept_Name,Count(E.PK_Emp_Id) as NO_OF_EMP
	from tb_Department as D
	inner join tb_Employee as E
	On D.Dept_ID=E.DepartmentID
	group by D.Dept_Name
	having (NO_OF_EMP)>=5
	





	select * from tb_Products
	select * from tb_OrderDetails
	select * from tb_orders










