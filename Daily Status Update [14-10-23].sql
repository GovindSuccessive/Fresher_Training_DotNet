select *
from sys.databases

use EMPLOYEES

SELECT name,crdate
FROM SYSOBJECTS
WHERE xtype = 'U';

select * from tb_employee
select * from tb_Management

alter table tb_employee
add  emp_Position varchar(50)

-------------VIEW------------


create view vw_Higer_postions
as select * from TB_EMPLOYEE where emp_position!='Trainee Engineer'

select * from vw_Higer_postions


-----------readOnly_Views-----

REVOKE SELECT, INSERT, UPDATE, DELETE ON vw_Higer_postions from public

---checking the can i make changes or not---

update vw_Higer_postions
set emp_name='Govind Sharma'
where emp_id=1



--------------Stored Procedure-------------


create procedure info_Employee @id int
as select * from TB_EMPLOYEE where emp_id=@id

Exec info_Employee @id=1

--Q can i use view inside the procedure

 create procedure view_inside_procedure
 as vw_Higer_postions




-------------TRIGGER------------------


create table audit_logDetails(
log_id int identity(1,1),
log_action nvarchar(20),
log_emp_id int,
log_Date date
)


create trigger 
on tb_employee
after insert,update,delete
as 
begin
declare @action nvarchar(20)

if exists(select * from inserted)
begin
	If exists (Select * from inserted)
    begin
        If exists (Select * from deleted)
            Set @Action = 'UPDATE';
        else
            Set @Action = 'INSERT';
    end
    else
        Set @Action = 'DELETE';

    From inserted;
end;

Create Trigger changes_in_tb_emp
ON tb_employee
After INSERT, UPDATE, DELETE
as 
begin
    Declare @Action nvarchar(50)

    If exists (Select * from inserted)
    begin
        If exists (Select * from deleted)
            Set @Action = 'UPDATE';
        else
            Set @Action = 'INSERT';
    end
    else
        Set @Action = 'DELETE';

    Insert Into audit_logDetails(log_action,log_emp_id,log_date)
    select @Action, emp_id, GETDATE()
    From inserted;
end;

update TB_EMPLOYEE
set emp_name='Govind'
where emp_id=1

delete from TB_EMPLOYEE
where emp_id=5

select * from TB_EMPLOYEE	
select * from audit_logDetails


