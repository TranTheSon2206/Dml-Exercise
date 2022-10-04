create database StudentsAndCourse
go
use StudentsAndCourse
go
--Tao bang Student
create table Student(
	SID int primary key not null ,
	S_FName varchar(20) not null,
	S_LName varchar(30) not null,
)
--Tao bang Course
create table Course(
	CID int primary key not null,
	C_Name varchar(30),
)
--Tao bang Course_Grades
create table Course_Grades(
	CGID int primary key not null,
	semester char(4) not null,
 CID_CG INT NOT NULL,
 SID_CG INT NOT NULL,
 Grade CHAR(2) NOT NULL,CONSTRAINT CID_CG_FK FOREIGN KEY (CID_CG)REFERENCES Course(CID)ON DELETE CASCADE,
 CONSTRAINT SID_CG_FK FOREIGN KEY (SID_CG) REFERENCES Student(SID) ON DELETE CASCADE
);

--INSERT data

INSERT INTO Student (SID, S_FName, S_LName) VALUES (12345, 'Quan','Le');
INSERT INTO Student (SID, S_FName, S_LName) VALUES (23456, 'Nhung', 'Hong');
INSERT INTO Student (SID, S_FName, S_LName) VALUES (34567, 'Dat', 'Thanh');
INSERT INTO Student (SID, S_FName, S_LName) VALUES (45678, 'Trung', 'Nguyen');
INSERT INTO Student (SID, S_FName, S_LName) VALUES (56789, 'Vinh', 'Duong');

INSERT INTO Course (CID, C_Name) VALUES (101001, 'Intro to Computers');
INSERT INTO Course (CID, C_Name) VALUES (101002, 'Programming');
INSERT INTO Course (CID, C_Name) VALUES (101003, 'Databases');
INSERT INTO Course (CID, C_Name) VALUES (101004, 'Websites');
INSERT INTO Course (CID, C_Name) VALUES (101005, 'IS Management');


INSERT INTO Course_Grades(CGID, Semester, CID_CG, SID_CG, Grade)
VALUES(20221004,'SEM1',101003,34567,'A+')

SELECT * FROM Student
SELECT * FROM Course
SELECT * FROM Course_Grades

-- 3. In the Student table, change the maximum length for Student first names to be 30, characters long.
alter table Student alter column S_FName varchar(30)
exec sp_help Student
-- 4. In the Course table, add a column called “Faculty_LName” where the Faculty last name
--can vary up to 30 characters long. This column cannot be null and the default value should be “TBD”.
alter table Course
add Faculty_LName varchar(30) NOT NULL default('TBD')
-- 5. In the Course table, update CID 101001 where will be Faculty_LName is “Potter” and
--C_Name is “Intro to Wizardry”.
UPDATE Course SET Faculty_LName = 'Potter', C_Name = 'Intro to Wizardry' where CID = 101001
-- 6. In the Course table, change the column name “C_Name” to be “Course_Name”.
execute sp_rename N'Course.C_Name', N'Course_Name', 'COLUMN' 
exec sp_help Course
exec sp_rename 'Course.[Course_Name]' , 'C_Name', 'COLUMN'
-- 7. Delete the “Websites” class from the Course table.
UPDATE Course set C_Name = '' where CID = 101004
-- 8. Remove the Student table from the database.
drop table Student
-- 9. Remove all the data from the Course table, but retain the table structure.
delete from Course
-- 10. Remove the foreign key constraints from CID and SID columns in the Course_Grades table.
alter table Course_Grades
drop constraint CID_CG_FK,SID_CG_FK
