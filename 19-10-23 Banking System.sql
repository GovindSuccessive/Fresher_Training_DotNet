
create database db_BankingSystem

use db_bankingSystem

create table tbl_Branch(
Pk_Branch_id int identity(1001,1) primary key,
Branch_Name varchar(50),
Branch_Code int,
Branch_Address varchar(50),
Branch_PhNo bigint
)


create table tbl_Customer(
Pk_Cust_ID int identity(1,1) primary key,
Cust_Name varchar(50),
Cust_Address varchar(50),
Cust_PhoneNo bigint,
Fk_Branch_Id int,
Foreign key(Fk_Branch_Id) references tbl_Branch(Pk_Branch_Id)
)


create table tbl_employee(
Pk_Emp_Id int identity(1,1) primary key,
Emp_Name varchar(50),
Emp_Address varchar(50),
Emp_PhoneNo bigint,
Fk_Branch_id int,
foreign key (Fk_Branch_id) references tbl_Branch(Pk_Branch_Id)
)

select * from tbl_Branch

create table tbl_accounts(
Pk_Acc_Id int identity(1,1) primary key,
Acc_Number bigint,
Acc_Type varchar(50),
Current_Balance int,
Date_Of_Opening date,
Date_Of_Closing date,
Acc_Status varchar(50),
FK_Cust_id int,
Fk_Branch_Id int,
Foreign key (FK_Cust_id) references tbl_Customer(Pk_Cust_Id),
Foreign key(Fk_Branch_Id) references tbl_Branch(Pk_Branch_Id)
)

create table Transactions(
Pk_Trans_Id int identity(1,1) primary key,
Trans_Type varchar(50),
Amount int,
Trans_Date date,
FK_Sender_Acc_ID int,
FK_Receiver_Acc_ID int,
Foreign key (FK_Sender_Acc_ID) references tbl_Accounts(Pk_Acc_ID),
Foreign key (FK_Receiver_Acc_ID) references tbl_Accounts(Pk_Acc_ID),
)


create table tbl_Loan_Details(
Pk_Loan_id int identity(1,1) primary key,
Loan_Type varchar(50),
Loan_Amount int,
InterestRate float,
Duration_In_Month int,
Starting_Date date,
Ending_Date date,
Fk_Cust_id int,
Foreign key(FK_Cust_id) references tbl_Customer(Pk_Cust_id)
)









