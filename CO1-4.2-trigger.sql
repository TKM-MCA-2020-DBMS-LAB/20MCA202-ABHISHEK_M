create database Work;
use Work;

create table Employee(Name varchar(20) NOT NULL,Occupation varchar(20) NOT NULL,Working_date date,Working_hours varchar(10));
insert into Employee values('rash','Scientist','2020-04-05',10),
					('rahul','Engineer','2019-01-09',12),
					('mathews','Producer','2020-11-04',14),
                    ('amar','Doctor','2018-03-11',9),
                    ('aneesh','Teacher','2020-08-07',12);
select * from Employee;
delimiter //
create Trigger before_insert_empworkinghours
BEFORE INSERT ON Employee FOR EACH ROW
BEGIN
IF NEW.Working_hours<0 THEN SET NEW.Working_hours=0;
END IF;
END //
insert into Employee values('libin','engineer','2020-05-10',-12);
insert into Employee values('Abhinav','Branch_Manager','2021-03-10',14);
select * from Employee;
