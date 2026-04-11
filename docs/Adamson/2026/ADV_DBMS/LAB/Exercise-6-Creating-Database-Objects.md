
# Exercise 6 Creating Database Objects

2026-04-09 10:31

Tags: #ADV_DBMS 

Author:  Duke Hsu

---

## Question 1

The staff in the HR department wants to hide some of the data in the EMPLOYEES table. They want a view called EMPLOYEES_VU based on the employee numbers, employee names, and department numbers from the EMPLOYEES table. They want the heading for the employee’s name to be EMPLOYEE.

```sql
-- create view 
CREATE VIEW employee_vu AS
SELECT employee_id, last_name AS employee, department_id
FROM employees;
```


## Question 2

Confirm that the view works. Display the contents of the EMPLOYEES_VU view

```sql
--using view
SELECT * FROM employee_vu;
```


## Question 3
Using your EMPLOYEES_VU view, write a query for the HR department to display all employee names and department numbers.

```sql

```

## Question 4

Department 50 needs access to its employee data. Create a view named DEPT50 that contains the employee numbers, employee last names, and department numbers for all employees in department 50. You have been asked to label the view columns EMPNO, EMPLOYEE, and DEPTNO. For security purposes, do not allow an employee to be reassigned to another department through the view.

!!! note  "Tips"
	For security purposes, do not allow an employee to be reassigned to another department through the view. -- We need add `WITH CHECK OPTION`

```sql
-- create view with (WITH CHECK OPTION)
CREATE VIEW dept50 AS
SELECT employee_id AS empno, last_name AS employee, department_id AS deptno
FROM employees
WHERE department_id = 50
WITH CHECK OPTION;
```


## Question 5

Test your view. Attempt to reassign Matos to department 80.

```sql
--question 5  update value by view
UPDATE dept50
SET deptno = 80
WHERE employee = 'Matos';
```

Error messages:

```
Msg 550, Level 16, State 1, Line 23

The attempted insert or update failed because the target view either specifies WITH CHECK OPTION or spans a view that specifies WITH CHECK OPTION and one or more rows resulting from the operation did not qualify under the CHECK OPTION constraint.

The statement has been terminated.


Completion time: 2026-04-11T12:58:40.7719235+08:00
```

## Question 6

You need a sequence that can be used with the PRIMARY KEY column of the DEPARTMENTS table. The sequence should start at 280 and have a maximum value of 1,000. Have your sequence increment by 10. Name the sequence DEPT_ID_SEQ.

```sql
-- question 6 create sequence
CREATE SEQUENCE dept_id_seq
	INCREMENT BY 10
	START WITH 280
	MAXVALUE 1000
	NO CACHE
	NO CYCLE
-- This sequence is for departments table primary key 
```



## Question 7 

To test your sequence, write a query to insert two rows in the DEPARTMENTS table. Be sure to use the sequence that you created for the ID column. Add two departments: Education and Administration.

```sql
-- question 7  using sequence "dept_id_seq"
-- insert a new department named "Education" and "Administration" 
INSERT INTO departments(department_id, department_name,location_id)
VALUES(
	NEXT VALUE FOR dept_id_seq, -- generates next department_id start with 280
	'Education',
	2500),
	(
	NEXT VALUE FOR dept_id_seq, -- generates next department_id 290
	'Administration',
	2500);
```


## Question 8 

Confirm insert data

```sql
-- confirm insert data
SELECT *  FROM departments;
```


## Question 9 

Create a non-unique index on the NAME column in the DEPARTMENTS table.

!!! note "Tips"
	 In some tables, column values may be duplicated, so we use a `non-unique` index. By default, indexes are `non-unique`.


```sql
--question 9 create non-unique index on departments(department_name)
CREATE INDEX idx_dept_name
ON departments(department_name);
```

## Question 10

!!! note "Tips"
	 A synonym cannot be altered. You need to create a new synonym first before dropping the old one.


Create a synonym for your EMPLOYEES table. Call it EMP.

```sql
--question 10 create synonym 
CREATE SYNONYM emp
FOR employees;
```


Using SYNONYM 

```sql
SELECT * FROM emp
WHERE department_id = 50;
```





----
## References

Exercise #6 