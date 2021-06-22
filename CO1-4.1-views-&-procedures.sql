#Create a database Organization
create database organization;
use Organization;

#Create two tables department,employee
create table department(dept_no int primary key,dept_name varchar(20),location varchar(30));
create table employee(emp_no int primary key,emp_name varchar(20) not null,DOB date,address varchar(30),date_of_join date,mobile_no bigint,dept_no int,foreign key(dept_no) references department(dept_no),designation varchar(20),salary float);

#(i)Add 5 rows in the employee and department tables
#(ii)Display all the records from the above tables
insert into department values(101,"A","first floor");
insert into department values(102,"B","second floor");
insert into department values(103,"C","third floor");
insert into department values(104,"D","first floor");
insert into department values(105,"E","second floor");
select * from department;

insert into employee values(1,"romero",'1996-04-20',"roman house",'2020-07-10',9785439910,101,"Manager",20000);
insert into employee values(2,"Rashford",'1996-06-20',"Rash",'2020-01-10',9785437914,102,"analyst",10000);
insert into employee values(3,"forlan",'1994-04-20',"forlan villa",'2019-04-10',9775438910,103,"analyst",15000);
insert into employee values(4,"Neur",'1996-11-26',"Downtown",'2021-06-24',8890028340,104,"Clerk",10000);
insert into employee values(5,"marcus",'1997-10-19',"marcus arena",'2021-03-20',7090117891,105,"Salesman",7000);
select * from employee;

#VIEW
#create view
create view Manager as select emp_no,emp_name,dept_name, salary,location from employee, department;
select  distinct e.emp_name from employee e ,Manager m where e.salary >m.salary;


#update view
update Manager set salary = 1.1 * salary where location ="first floor";
select * from Manager;

#drop view
drop view Manager;

#PROCEDURE
create table deptsalary as select dept_no , 0 as totalsalary from department;
select * from deptsalary;
delimiter //
create procedure updatesalaryy (IN Param2 int)
begin
update deptsalary
set totalsalary= (select sum(salary)from employee  where dept_no=Param2)
where dept_no =param2;
end; //
 delimiter;
call updatesalaryy(101);
call updatesalaryy(102);
call updatesalaryy(103);
call updatesalaryy(104);
call updatesalaryy(105);
select * from deptsalary;

show procedure status;
drop procedure updatesalaryy;

#STORED PROCEDURES
delimiter //
create procedure Details()
begin
select * from employee;
end //
delimiter;
call Details();