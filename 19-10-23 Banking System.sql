

create database db_BankingSystem

use db_bankingSystem

create table tbl_Customer(
Pk_Cust_ID int identity(1,1) primary key,
Cust_Name varchar(50),
Cust_Address varchar(50),
Cust_PhoneNo bigint
)

create table tbl_employee(
Pk_Emp_Id int identity(1,1) primary key,
Emp_Name varchar(50),
Emp_Address varchar(50),
Emp_PhoneNo bigint
)

create table tbl_accounts(
Pk_Acc_Id int identity(1,1) primary key,
Acc_Number bigint,
Acc_Type varchar(50),
Current_Balance int,
Date_Of_Opening date,
Date_Of_Closing date,
Acc_Status varchar(50),
FK_Cust_id int,
Foreign key (FK_Cust_id) references tbl_Customer(Pk_Cust_Id)
)

create table Transactions(
Pk_Trans_Id int identity(1,1) primary key,
Trans_Type varchar(50),
Amount int,
Trans_Date date,
Fk_Emp_Id int,
FK_Sender_Acc_ID int,
FK_Receiver_Acc_ID int,
Foreign key (FK_Sender_Acc_ID) references tbl_Accounts(Pk_Acc_ID),
Foreign key (FK_Receiver_Acc_ID) references tbl_Accounts(Pk_Acc_ID),
Foreign key (Fk_Emp_Id) references tbl_employee(Pk_Emp_Id)
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









