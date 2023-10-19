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

--Q1. Retrieve the full names of students who are enrolled in more than one course in the "Front-end" department.


 select s.Student_FirstName,s.Student_LastName,d.Dept_Name,count(e.courseId)as Course_Count
 from tbl_Enrollments as e
 inner join tbl_Courses as c on e.CourseID=c.Pk_Course_Id
 inner join tbl_Departments as d on d.Pk_DepartmentID=c.DepartmentID
 inner join tbl_Students as s on s.Student_id=e.StudentID
 where d.Dept_Name='front-end'
 group by s.Student_FirstName,s.Student_LastName,d.Dept_Name
 having count(e.courseid)>1

 --Q2 List the names of courses that have at least one student enrolled but have not yet started.

     select distinct c.CourseName
	 from tbl_Courses as c 
	 inner join tbl_Enrollments as e on c.Pk_Course_Id=e.CourseID
	 where e.EnrollmentDate>c.Course_Starting_Date


--Q3. Find the students who are enrolled in courses from more than one department.

select s.Student_FirstName,S.Student_LastName,count(distinct c.departmentID) as Department_Count
from tbl_Enrollments as e
inner join tbl_Courses as c on e.CourseID = c.Pk_Course_Id
inner join tbl_Students as s on s.Student_id=e.StudentID
group by s.Student_FirstName,S.Student_LastName
having count(distinct c.departmentId)>1


--Q4.Retrieve the names of students who are enrolled in all courses offered by the "Engineering" department.

select s.Student_FirstName,s.Student_LastName,count(e.courseID) as Course_count
from tbl_Departments as d
inner join tbl_Courses as c on d.Pk_DepartmentID = c.DepartmentID
inner join tbl_Enrollments as e on e.CourseID=c.Pk_Course_Id
inner join tbl_Students as s on s.Student_id=e.StudentID
where d.Dept_Name='front-end'
group by s.Student_FirstName,s.Student_LastName
having count(e.courseId)=2



--Q5. Calculate the total number of students enrolled in each department for each course.

select distinct c.DepartmentID,d.Dept_Name,c.CourseName,count(e.studentid)
from tbl_Enrollments as e
inner join tbl_Courses as c on e.CourseID=c.Pk_Course_Id
inner join tbl_Departments as d on d.Pk_DepartmentID=c.DepartmentID
group by c.DepartmentID,c.CourseName,d.Dept_Name
order by DepartmentID asc


--Q6. List the students who have the same first name as the department they are enrolled in.

	select s.Student_FirstName,s.Student_LastName
	from tbl_Enrollments as e
	inner join tbl_Courses as c on e.CourseID=c.Pk_Course_Id
	inner join tbl_Students as s on e.StudentID=s.Student_id
	inner join tbl_Departments as d on d.Pk_DepartmentID=c.DepartmentID
	where s.Student_FirstName=d.Dept_Name


--Q7 Find the department with the highest average number of students enrolled per course.

select  top 1 d.Dept_Name,count(e.CourseID) as Student_count
from tbl_Enrollments as e
inner join tbl_Courses as c on e.CourseID=c.Pk_Course_Id
inner join tbl_Departments as d on d.Pk_DepartmentID= c.DepartmentID
group by d.Dept_Name
order by Student_count desc


--Q8.Retrieve the students who have not enrolled in any courses offered by the "back-end" department.
	select * 
	from tbl_Students
	where student_id Not in
	(
		select  e.StudentID
		from tbl_Enrollments as e 
		inner join tbl_Courses as c on e.CourseID=c.Pk_Course_Id
		inner join tbl_Departments as d on d.Pk_DepartmentID=c.DepartmentID
		where d.Dept_Name='back-end'
	)



--Q9. List the courses with the most recent enrolment date for each department.

select distinct D.Dept_Name,c.CourseName,max(e.EnrollmentDate) as Latest_Enrollment_date
from tbl_Enrollments as e
inner join tbl_Courses as c on e.CourseID=c.Pk_Course_Id
inner join tbl_Departments as d on c.DepartmentID = d.Pk_DepartmentID
group by D.Dept_Name,c.CourseName
order by d.Dept_Name


--Q10. Calculate the total number of students in the "Engineering" department who have enrolled in more courses than the average number of courses per student in that department.



SELECT * FROM tbl_Departments
select * from tbl_Students
select * from tbl_courses
select * from tbl_Enrollments










