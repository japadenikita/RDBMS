create database Assignment1;
use Assignment1;
create table emp(empno int ,
empname varchar(200),
Deptno int,
salary int,
commission int);

create table Depart(Deptno int,
Deptname varchar(200),
location varchar(200));

insert into emp values(101, 'John Smith', 10, 50000.00, 1000.00);
insert into emp values(102, 'Jane Doe', 20, 60000.00,  null);
insert into emp values(103, 'Jim Brown', 30, 55000.00, 1500.00);
insert into emp values(104, 'Jack White', 20, 65000.00, 500.00);
insert into emp values(105, 'Jill Green', null, 45000.00, null);
insert into emp values(106, 'Joe Black', 30, 70000.00, 2000.00);
insert into emp values(null, null, null, null, null);
select * from emp;


insert into Depart values(10, 'Accounting', 'New York');
insert into Depart values(20, 'Research', 'Dallas');
insert into Depart values(30, 'sales', 'Chicago');
insert into Depart values(40, 'operations', 'Boston');
insert into Depart values(null, null, null);



#1.Query retrieve the employee number,employee name and department number and 
# department name for all employee who belong to a department
select 
e.empno,
e.empname,
d.Deptno,
d.Deptname
FROM
emp e
JOIN 
Depart d on e.Deptno = d.Deptno;

select * from Depart;
#2.query includes all employees, even if they don't belong to any department listed in the Dept table.
select empno, empname
from emp e
Left join 
Depart d on  e.Deptno = d.Deptno;


#3.query includes all departments, even if there are no employees assigned to them in the Emp table.
select  d.Deptno, d.Deptname 
from Depart d
left join 
emp e on d.Deptno = e.Deptno;

#4.query includes all employees and all departments, with NULLs in places where there is no match.
select e.empno, e.empname, d.Deptno,
d.Deptname
from emp e
inner  join
Depart d on e.Deptno= d.Deptno;


#5. query calculates the total salary for each department.
select  d.Deptno, d.Deptname, 
sum(salary) as total_salary 
from emp e
inner join
Depart d on e.Deptno= d.Deptno
group by
d.deptno,
d.Deptname ;

#6. query counts the total number of departments in each location.
select location, count(Deptno) as total_departments from Depart group by location;

#7. query finds the lowest commission in each department, excluding employees who do not receive a commission.
select 	d.Deptno,
		d.Deptname,
		min(commission) as lowest_commission
from 
		emp e
inner join
		Depart d on  e.Deptno= d.Deptno
where 
		e.commission IS NOT NULL AND e.commission > 0
group by 
		d.Deptno,
        d.Deptname;

#8. query finds the highest salary across all employees.
select
	empno,
	empname,
    max(salary)
from emp;
    
#9. query calculates the average salary for each department.
select 
	Deptno,
	avg(salary)
from 
	emp
group by
	Deptno;
#11. Create an index on the empname column in the Emp table:
 create index emp_index on emp(empname); 

show index from emp;


#12.drop  the index created.
drop index emp_index on emp;

#13. Find the names of all employees who earn more than the average salary in their respective departments.
select 
	e.empno,
   e.Deptno,
	e.empname,
    e.salary
from emp e
join(
		select Deptno,
				avg(salary)as Avg_salary
                from emp 
                group by 
					 Deptno) d on e.Deptno = d.Deptno

where
		e.salary> d.Avg_salary ;
        
#14. Find the name of the employee who has the highest salary in the company.
 select 
		empname,
        empno,
        salary
from emp		
where 
	salary = (select max(salary) from emp);