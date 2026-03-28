
# Exercise 4  Subqueries

2026-03-19 21:21

Tags: #ADV_DBMS 

Author:  Duke Hsu

---

## Given Question 

1. Create a report that shows the employee number, last name, and salary of employees who earn more than the average salary. Display the results from lowest to highest salary.

```sql
SELECT 
	EMPLOYEE_ID, LAST_NAME, SALARY --outer query  
FROM
	employees  
WHERE
	SALARY > (SELECT AVG(SALARY) FROM employees) --sub query  
ORDER BY SALARY ASC; --order by salary**
```



2. Display the employee number and last name of employees who work in the same department as an employee whose last name contains the letter “u.”

```sql
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	d.DEPARTMENT_NAME   --select column
FROM
	employees e  
LEFT JOIN 
	departments d  
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID  --left join
WHERE
	LAST_NAME LIKE '%u%'; --condition
```


3. Display the last name and salary of employees who report to King.

**Inner Join**

```sql
SELECT 
	e.LAST_NAME AS Employee_Name,
	e.SALARY AS Employee_Salary,
	m.LAST_NAME AS ManagerName
FROM 
	employees e
INNER JOIN
	employees AS m 
ON e.MANAGER_ID = m.EMPLOYEE_ID
WHERE
	m.LAST_NAME LIKE '%King%';
```

**Subquery**

```sql
SELECT 
	e.LAST_NAME AS Employee_Name,
	e.SALARY AS Employee_Salary,--outer query 
	(SELECT m.LAST_NAME 
	FROM employees m 
	WHERE m.EMPLOYEE_ID = e.MANAGER_ID) AS ManagerName --subquery
FROM 
	employees e
WHERE e.MANAGER_ID IN (
	SELECT EMPLOYEE_ID
	FROM employees
	WHERE LAST_NAME LIKE '%King%' --subquery condition
);
```


4. Display the department number, last name, and job ID of employees who work in the Executive department.

**Inner Join**

```sql
SELECT 
	e.DEPARTMENT_ID,
	e.LAST_NAME,
	e.JOB_ID,
	d.DEPARTMENT_NAME  --select  column
FROM 
	employees e  --select table
INNER JOIN departments d  --inner join
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE
	d.DEPARTMENT_NAME LIKE '%Executive%';  --condition
```

**Subquery** 

```sql
SELECT 
	e.DEPARTMENT_ID,
	e.LAST_NAME,
	e.JOB_ID,
	(SELECT d.DEPARTMENT_NAME 
	FROM departments d 
	WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID) AS DEPARTMENT_NAME --subquery
FROM 
	employees e
WHERE
	e.DEPARTMENT_ID IN 
	(SELECT
	DEPARTMENT_ID
	FROM departments
	WHERE DEPARTMENT_NAME LIKE '%Executive%'); --subquery and condition
```


==5. Employees whose salary is higher than the manager’s salary==

**Self Join**

```sql
SELECT 
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	e.SALARY AS EmployeeSalary,
	m.LAST_NAME AS ManagerName,
	m.SALARY AS ManagerSalary  --select columns from table 
FROM 
	employees e
INNER JOIN employees m
ON e.MANAGER_ID = m.EMPLOYEE_ID --self join
WHERE 
	e.SALARY > m.SALARY  --condition
ORDER BY 
	e.SALARY ASC;  --oder
```


 **Subquery** 

```sql
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	e.SALARY AS EmployeeSalary,
	(SELECT m.LAST_NAME 
	FROM employees m
	WHERE m.EMPLOYEE_ID = e.MANAGER_ID) AS ManagerName,

	(SELECT m.SALARY 
	FROM employees m
	WHERE m.EMPLOYEE_ID = e.MANAGER_ID) AS ManagerSalary --subquery 

FROM 
	employees e
WHERE
	e.SALARY > (
	SELECT m.SALARY 
	FROM employees m
	WHERE m.EMPLOYEE_ID = e.MANAGER_ID
	) --subquery condition 

ORDER BY e.SALARY ASC; --order
```



 6. List employees working in departments located in ‘London’.


**Left Join**

```sql
SELECT
	e.LAST_NAME,
	d.DEPARTMENT_NAME,
	l.CITY --select columns
FROM
	employees e -- 1st table

LEFT JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID --2nd table

LEFT JOIN locations l
ON d.LOCATION_ID = l.LOCATION_ID  --3rd table

WHERE 
	CITY = 'London';  --condition
```


==7. Display employee number, last name, and salary of employees who earn more than their manager.==

```sql
SELECT 
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	e.SALARY AS EmployeeSalary,
	m.LAST_NAME AS ManagerName,
	m.SALARY AS ManagerSalary  --select columns from table 
FROM 
	employees e
INNER JOIN employees m
ON e.MANAGER_ID = m.EMPLOYEE_ID --self join
WHERE 
	e.SALARY > m.SALARY  --condition
ORDER BY 
	e.SALARY ASC;  --oder
```



8. Find the job ID of employees whose salary equals the average salary of the company.

```sql
SELECT
	e.LAST_NAME,
	e.JOB_ID,
	e.SALARY  --outer query 
FROM 
	employees e
WHERE
	e.SALARY = (SELECT AVG(SALARY) FROM employees);--subquery condition
```

9.  Display employee number, last name, and department ID of employees in the ‘Finance’ department.

Left join

```sql
SELECT 
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	e.DEPARTMENT_ID,
	d.DEPARTMENT_NAME --select columns
FROM 
	employees e
LEFT JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID --left join

WHERE
	d.DEPARTMENT_NAME = 'Finance'; --condition
```


**Subquery** 

```sql
SELECT 
    e.EMPLOYEE_ID,
    e.LAST_NAME,
    e.DEPARTMENT_ID,
    d.DEPARTMENT_NAME
FROM 
    employees e
LEFT JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE
    EXISTS (  --uses EXISTS more efficient
        SELECT 1
        FROM departments
        WHERE DEPARTMENT_NAME = 'Finance'
        AND DEPARTMENT_ID = e.DEPARTMENT_ID); -- subquery condition
```


10. Display the last name and salary of the employee who earns the lowest salary.

```sql
SELECT TOP 10  --select first 10 rows
    e.LAST_NAME,
    e.SALARY
FROM 
    employees e
ORDER BY e.SALARY ASC, e.LAST_NAME ASC; --ASC order
```





----
### References
