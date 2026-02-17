2026-02-11 16:01

Tags: #ADV_DBMS  
Author:  Duke Hsu

---
Exercise 2 – SELECT statement with  Aggregate Functions (Transact-SQL)

1. Write a query to find all employees whose Annual Salary (Salary * 12) is greater than $100,000 AND they work in Department 60 or 100, OR they have a commission.

```sql
SELECT * FROM employees
	WHERE (SALARY *12 > 100000 AND DEPARTMENT_ID IN (60,100))
		OR COMMISSION_PCT IS NOT NULL;	
```

2.  Write a query to find the unique Department IDs where employees have 'Clerk' in their Job ID, earn more than $2,500 after a $200 bonus is added, and report to Manager 114."

```sql
SELECT DISTINCT DEPARTMENT_ID FROM employees
	WHERE JOB_ID LIKE '%Clerk'
		AND(SALARY + 200) > 2500
		AND MANAGER_ID =114;
```

3.  Write a query to display the last name and salary for any employee whose salary is not in the range of $5,000 to $12,000
```sql
SELECT LAST_NAME, SALARY  
    FROM employees  
        WHERE SALARY >5000 AND SALARY <12000;
```

4. Write a query to display the last name and salary of employees who earn between $5,000 and $12,000, and are in department 20 or 50. Label the columns Employee and Monthly Salary
```sql
SELECT LAST_NAME AS "Employee", SALARY AS "Monthly Salary"  
    FROM employees  
        WHERE SALARY >5000 AND SALARY <12000  
        AND DEPARTMENT_ID IN(20,50);
```

  
5.  Write a query to Display the last name, job ID, and hire date of employees who belong to departments 10, 20, and 30, and sort the results in ascending order by hire date.
```sql
SELECT LAST_NAME,JOB_ID,HIRE_DATE  
    FROM employees  
        WHERE DEPARTMENT_ID IN (10,20,30)  
        ORDER BY HIRE_DATE ASC;
```


6. Write a query to Display the total number of employees whose last name has “a” as the third character.
```sql
SELECT COUNT(*) AS "Total Employees"  
    FROM employees  
        WHERE LAST_NAME LIKE '__a%';
```

7. Write a query to display the average salary per department.
```sql
--use join table ,display the department name 
SELECT d.DEPARTMENT_NAME, AVG(SALARY) AS "Average Salary"  
    FROM employees e  
    JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID  
        GROUP BY d.DEPARTMENT_NAME;
        
        
 --department id 
 SELECT DEPARTMENT_ID, AVG(SALARY) AS "Average Salary"
	 FROM employees
	 GROUP BY DEPARTMENT_ID;
 
```

8. Write a query to display the earliest hire date and the most recent hire date of all employees.
```sql
SELECT MIN(HIRE_DATE) AS "EarliestHireDate", MAX(HIRE_DATE) AS "RecentHireDate"  
    FROM employees;
    
    
--group by last name 
SELECT LAST_NAME AS "Employee" , HIRE_DATE AS "Hire Date"
	FROM employees
		GROUP BY LAST_NAME
			ORDER BY HIRE_DATE;
```

!!! note
	when `SELECT` with `MIN()` , they can't add other  field 
	在使用 **MIN()** 和 **MAX()** 這類聚合函數時，不能直接選擇其他列（如 **LAST_NAME**）的值

9. Write a query to display the total salary paid for each Job ID.
```sql
SELECT JOB_ID, SUM(SALARY) AS "Total Salary"
	FROM employees
		GROUP BY JOB_ID;
```

10. Write a query to display the departments that have more than 5 employees whose first name has “e” as the second character.
```sql
SELECT DEPARTMENT_ID 
	FROM employees
		WHERE FIRST_NAME LIKE '_e%'
			GROUP BY DEPARTMENT_ID
				HAVING(*) > 5;

```

11. Write a query to display departments where the average salary is greater than 50,000.
```sql
SELECT DEPARTMENT_ID
	FROM employees
		GROUP BY DEPARTMENT_ID
			HAVING AVG(SALARY) > 5000;
			
			
			
--display department name 
SELECT d.DEPARTMENT_NAME 
    FROM employees e  
    JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID  
        GROUP BY d.DEPARTMENT_NAME
	        HAVING AVG(SALARY) > 10000;
```


12. Write a query to display departments where the most recent hire date is after January 1, 1990.

```sql
SELECT DEPARTMENT_ID 
	FROM employees
		GROUP BY DEPARTMENT_ID
			HAVING MAX(HIRE_DATE) > '1990-01-01';
			
```



13. Write a query to display the department and the number of employees who have both “a” and “e” in their last name and either their JobID is 'IT_PROG' or their HireDate is before January 5, 1997, grouped by department and sorted in ascending order by last name.


```sql
SELECT DEPARTMENT_ID, COUNT(*) AS EmployeeCount
	FROM Employees
		WHERE (LAST_NAME LIKE '%a%' AND LAST_NAME LIKE '%e%')
		  AND (JOB_ID = 'IT_PROG' OR HIRE_DATE < '1997-01-05')
		GROUP BY DEPARTMENT_ID
		ORDER BY EmployeeCount ASC;   

```

14. Write a query that describes the structure of the employees table.

```sql
EXEC sp_help 'employees'
```



15. Modify the employees table to add foreign key constraint on department_id with ON DELETE CASCADE and ON UPDATE CASCADE.

```sql
ALTER TABLE employees
	ADD CONSTRAINT Fk_department
		FOREIGN KEY (DEPARTMENT_ID)
		REFERENCES departments(DEPARTMENT_ID)
ON DELETE CASCADE
ON UPDATE CASCADE;
```


----
### References: 

Exercise #2 – SELECT statement with AGGRAGATE FUNCTIONS.docx
SQLQuery1.sql
