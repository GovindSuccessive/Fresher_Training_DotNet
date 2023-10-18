----------Assignment 2 Student DB----------

create database DB_Student_DB_Managment

use DB_Student_DB_Managment

create table tbl_Students(
Student_id int identity(1,1) primary key,
Student_FirstName varchar(50),
Student_LastName varchar(50)
)

create table tbl_Courses(
Pk_Course_Id int identity(1,1) primary key,
CourseName varchar(50),
DepartmentID int,
Foreign key (DepartmentID) references tbl_Departments(PK_DepartmentID)
)

alter table tbl_Courses
add  Course_Starting_Date date;

create table tbl_Departments(
Pk_DepartmentID int identity(1,1) primary key,
Dept_Name varchar(50)
)



create table tbl_Enrollments(
PK_Enroll_ID int identity(1,1) primary key,
StudentID int,
CourseID int,
EnrollmentDate date,
foreign key (StudentID) references tbl_Students(Student_ID),
foreign key (CourseID) references tbl_Courses(Pk_Course_Id)
)

--Q1. Retrieve the full names of students who are enrolled in more than one course in the "Computer Science" department.

select s.student_firstName,s.student_lastname,count(e.pk_enroll_id)
from tbl_Students as s
inner join tbl_Enrollments as E on s.student_id = e.StudentID
inner join tbl_Courses as C on E.CourseID=C.Pk_Course_id
group by s.student_firstName,s.student_lastname
having count( c.departmentid)>1



--Q3. 








--Q4.Retrieve the names of students who are enrolled in all courses offered by the "Engineering" department.

select S.student_firstName,S.Student_lastname
from tbl_Enrollments as E
inner join tbl_Courses as C on e.CourseID=c.Pk_course_id
inner join tbl_Students as S on S.Student_id=E.StudentID
inner join tbl_Departments as D on D.Pk_DepartmentID=C.DepartmentID
where D.Dept_Name='Front-end'

--Q5
SELECT d.deptName, c.courseName, COUNT(DISTINCT s.StudentID) AS TotalStudents
FROM tblDepartments d
INNER JOIN tblCourses c ON d.deptID = c.deptID
INNER JOIN tblEnrollments e ON c.courseID = e.courseID
INNER JOIN tblStudents s ON e.studentID = s.studentID
GROUP BY d.deptName, c.courseName ORDER By TotalStudents;


--Q6
SELECT s.FirstName, s.LastName
FROM tblStudents s
INNER JOIN tblEnrollments e ON s.StudentID = e.StudentID
INNER JOIN tblCourses c ON e.CourseID = c.CourseID
INNER JOIN tblDepartments d ON c.deptID = d.deptID
WHERE s.FirstName = d.deptName;


--Q7



--Q8
SELECT s.FirstName, s.LastName
FROM tblStudents s
WHERE s.StudentID
NOT IN 
(SELECT e.StudentID FROM tblEnrollments e 
INNER JOIN tblCourses c ON e.CourseID = c.CourseID 
INNER JOIN tblDepartments d ON c.deptID = d.deptID
WHERE d.deptName = 'computer');


--Q9
SELECT  top 1 d.deptName, c.CourseName, MAX(e.enrollDate) AS MostRecentEnrollmentDate
FROM tblDepartments d
INNER JOIN tblCourses c ON d.deptID = c.deptID
INNER JOIN tblEnrollments e ON c.CourseID = e.CourseID
GROUP BY d.deptName, c.CourseName;











SELECT * FROM tbl_Departments
select * from tbl_Students
select * from tbl_courses
select * from tbl_Enrollments


