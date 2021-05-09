CREATE DATABASE DBMS;
USE DBMS;
CREATE TABLE employee(emp_no int primary key,emp_name varchar(20) not null,DOB date);
CREATE TABLE department(dept_no int primary key,dept_name varchar(20),emp_no int,foreign key(emp_no)references employee(emp_no));
insert into employee values(101,"abhi",'1998-01-05');
insert into employee values(102,"walter",'1989-07-09');
insert into employee values(103,"theon",'1992-05-03');
insert into employee values(104,"saul",'1996-05-09');
insert into employee values(105,"jon",'1996-04-06');

insert into department values(67,"COMMERCE",101);
insert into department values(29,"maths",102);
 insert into department values(01,"CS",103);
 insert into department values(06,"MECH",104);
 insert into department values(45,"CHEM",105);

 SELECT * FROM employee;

emp_no	emp_name	DOB
101	abhi	05-01-1998
102	walter	09-07-1989
103	theon	03-05-1992
104	saul	09-05-1996
105	jon	06-04-1996


  SELECT * FROM department;

dept_no	dept_name	emp_no
1	CS	103
6	MECH	104
29	maths	102
45	CHEM	105
67	COMMERCE	101

  alter table employee add column salary float;

  alter table department add column location char;

  alter table employee drop column DOB;
  drop table employee,department;
  drop database DBMS;
 
