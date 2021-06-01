\\VIEWS


mysql> create view manager as SELECT emp_name,DOB,salary,location from employee,department;
Query OK, 0 rows affected (0.05 sec)

mysql> select distinct e.emp_name from employee e,manager m where e.salary >m.salary;
+----------+
| emp_name |
+----------+
| LOKESH   |
+----------+
1 row in set (0.04 sec)

mysql> DROP VIEW MANAGER;
Query OK, 0 rows affected (0.04 sec)



\\UPDATING VIEWS

mysql> create table deptsal as select dept_no, 0 as totalsalary from department;
Query OK, 5 rows affected (0.07 sec)
Records: 5  Duplicates: 0  Warnings: 0



mysql> update manager set salary = 1.1 * salary where location ="NY";
Query OK, 4 rows affected (0.40sec)
Rows matched: 4  Changed: 4  Warnings: 0


\\PROCEDURE


mysql> delimiter //
mysql> create procedure updatesal(IN Param1 int)
    -> begin
    -> update deptsal
    -> set totalsalary= (select sum(salary)from employee  where dept_no=Param1)
    -> where dept_no =param1;
    -> end; //

mysql> delimiter ;

mysql> call updatesal(101);

mysql> call updatesal(133);

mysql> call updatesal(212);




mysql> select * from deptsal;



show procedure status;
mysql> drop procedure updatesal;



\\STORED PROCEDURES


mysql> DELIMITER//
    -> CREATE PROCEDURE Getdet()
    -> BEGIN
    -> select * from employee;
    -> END //


mysql> DELIMITER ;
mysql> CALL Getdetails();
