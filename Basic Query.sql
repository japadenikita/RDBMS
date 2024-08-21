/*Assignment1
1.Create a table STUDENT with under mentioned structure by using SQL Statement:
 StdID Number Primary Key 
StdName Character (30) NOT NULL 
Gender Character(6) Male or Female Percentage Number 
SClass Number
 Sec Character
Stream Character(10) Science or Commerce
 DOB Date Date of Birth...*/
 create table student(
StdID int Primary Key ,
StdName varchar (300) NOT NULL, 
Gender varchar(100) ,
Percentage int,
StudClass int,
Section char(10),
stud_Stream varchar(10),
 DOB Date );


#2.Insert below mentioned values into it.

insert into student values(1001, 'Akshra Agrawal','FEMALE', 70, 11, 'A','science', '1996-11-10');
insert into student values(1002, 'Anjali Sharma','FEMALE', 75, 11, 'A','Commerce', '1996-09-18');
insert into student values(1003, 'Anshul Saxena','MALE', 78, 11, 'A','Commerce', '1996-11-19');
insert into student values(1004, 'Aishwarya Singh','FEMALE', 79, 11, 'A','Commerce', '1996-11-1');
insert into student values(1005, 'Akriti Saxena','FEMALE', 76, 11, 'A','Commerce', '1996-09-20');
insert into student values(1006, 'Khushi Agrawal','FEMALE', 77, 11, 'A','Commerce', '2003-09-14');
insert into student values(1007, 'Maahi Agrawal', 'FEMALE',74, 11, 'A','science', '1997-04-21');
insert into student values(1008, 'Mitali Gupta','FEMALE', 78, 12, 'A','science', '1997-11-26');
insert into student values(1009, 'Nikunj Agrawal','MALE', 58, 12, 'A','science', '1997-07-12');
insert into student values(1010, 'Parkhi ','FEMALE', 59, 12, 'A','Commerce', '1997-12-20');

#3.To display all the records form STUDENT table. 
select * from student;

#4. To display only name and date of birth from the table STUDENT. 
select StdID, date_format(dob, '%d-%m-%y' )as Birth_date from student;

#5. To display all students record where percentage is greater of equal to 80 FROM student table. 
select * from student where Percentage>= 80;

#6. To display student name, stream and percentage where percentage of student is more than 80 
select StdName,stud_Stream ,Percentage from student where Percentage >80;

#7. To display all records of science students whose percentage is more than 75 form student table. 
select * from student where stud_Stream = 'science' And Percentage>75;

#8.To display the STUDENT table structure.
describe student;

#9. To add a column (FIELD)in the STUDENT table,for example TeacherID as VARCHAR(20);
alter table student add TeacherID varchar(20);

#10. To modify the TeacherID data type form character to integer.
alter table student modify TeacherId int;

#11. To Drop (Delete) a field form a table. For e.g you wantto delete TeacherID field.
 alter table student drop column TeacherID;
 
 #12. Display the name of all students whose stream is not Science 
 select * FROM student where stud_Stream != 'science';
 
#13. Display all name and percentage where percentage is between 60 and 80
select  StdName, Percentage from student where Percentage  between 60 and  80;

#14. To delete the records form student table where StdId is 1016. 
delete  from student where StdId = 1016;

#15. Type the following SQL statement and note the output. 
SELECT * FROM student WHERE StdName LIKE 'G_' ; 

SELECT * FROM student WHERE StdName='G';
 SELECT * FROM student WHERE StdName LIKE 'G%' ; 
SELECT * from student WHERE StdName='%G%' ;

#16. Display all the streams in student table.
select stud_Stream from student;

#17.To change student name from Swati Mishra to Swati Verma whose STDID is 1014 and also change percentage to 86.
update  student  set StdName = 'Swati Verma' , Percentage = 86 where StdId = 1010


