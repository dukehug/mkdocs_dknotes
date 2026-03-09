
# Exercise 3 SQL Join

2026-03-09 09:59

Tags: #ADV_DBMS 

Author:  Duke Hsu

---

## SQL 語句的正確順序

記住這個順序很重要：

1. `SELECT` - Selected columns
2. `FROM` - Selected table
3. `JOIN` - Connect other table
4. `WHERE` - Filtering first table data
5. `GROUP BY` - Group column
6. `HAVING` - Filtering Group result  
7. `ORDER BY` - Sort








---

1.  The HR manager wants to generate a report of all company locations in the United States of  
	America that are specifically located in the state of California. Display Location ID, Street  
	Address, City, State/Province and Country Name.  


```sql
SELECT l.LOCATION_ID,l.STREET_ADDRESS,l.CITY,l.STATE_PROVINCE,c.COUNTRY_NAME
	FROM locations l 
INNER JOIN countries c  --need match
	ON l.COUNTRY_ID = c.COUNTRY_ID 
WHERE l.STATE_PROVINCE = 'California'; --condition
```




2.  The HR Department wants to know how many company locations exist per country. Display  Country Name and Total Number of Locations

```sql
SELECT c.COUNTRY_NAME,COUNT(l.LOCATION_ID ) AS TotalLocations
	FROM locations l --Select table
LEFT JOIN countries c
	ON l.COUNTRY_ID = c.COUNTRY_ID  --Join table
GROUP BY c.COUNTRY_ID ,c.COUNTRY_NAME  -- Group columns
ORDER BY TotalLocations DESC; --large to small

```


3. The HR Department wants to generate a report listing all employees together with the department where they are assigned. Display Employee last name, Department number and Department name

```sql
SELECT e.LAST_NAME,e.DEPARTMENT_ID, d.DEPARTMENT_NAME
	FROM employees e
INNER JOIN departments d
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
ORDER BY e.LAST_NAME ASC;
```


4. HR wants to display all employees, even those without a depart 



```sql
SELECT e.LAST_NAME,e.HIRE_DATE,e.JOB_ID,d.DEPARTMENT_NAME
	FROM employees e
LEFT JOIN departments d
	ON d.DEPARTMENT_ID = e.DEPARTMENT_ID;
```


5. HR wants to know the total number of employees per department.

```sql
SELECT d.DEPARTMENT_NAME , COUNT(e.EMPLOYEE_ID) AS TotalEmployees --count all employees
	FROM employees e
LEFT JOIN departments d
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME
ORDER BY TotalEmployees DESC; --large to smallest
```


6. The HR Department wants to display the departments that have more than 5 employees.  Display Department Name and Total Number of Employees. Sort the Total Number of  Employees in descending order


```sql
SELECT d.DEPARTMENT_NAME , COUNT(e.EMPLOYEE_ID) AS TotalEmployees
	FROM employees e
LEFT JOIN departments d
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME
HAVING(COUNT(e.EMPLOYEE_ID)>5) --having should be after Group by, where is before Group by
ORDER BY TotalEmployees DESC;
```


7. The HR Department wants to know how many employees were hired after January 1, 2005, in  each department. 

```sql
SELECT d.DEPARTMENT_NAME, --SELECT column
COUNT(e.EMPLOYEE_ID) AS TotalEmployees 
	FROM employees e  -- SELECT Table
LEFT JOIN departments d  --Join to other table
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE e.HIRE_DATE > '2005-01-01' --filtering first table data
GROUP BY d.DEPARTMENT_NAME -- set group 
ORDER BY TotalEmployees DESC;  -- sort
```

8. Display Department Name and Total Number of Employees Hired After 2005.  Only include departments with at least 2 such employees.

```sql
SELECT d.DEPARTMENT_NAME, --SELECT column  
	COUNT(e.EMPLOYEE_ID) AS TotalEmployees  
FROM employees e  -- SELECT Table  

LEFT JOIN departments d  --Join to other table  
		ON e.DEPARTMENT_ID = d.DEPARTMENT_ID  
WHERE e.HIRE_DATE > '2005-01-01'  --filtering first table data  
GROUP BY d.DEPARTMENT_NAME -- set group  
HAVING COUNT(e.EMPLOYEE_ID)>2  
ORDER BY TotalEmployees DESC;  -- sort
```



9. The HR Department wants a summary report showing:
- How many employees work in each department
- Only include departments located in Seattle or New York
- Display department number, department name, location city, and total employees

```sql
SELECT d.DEPARTMENT_ID,d.DEPARTMENT_NAME,l.CITY, --SELECT column
	COUNT(e.EMPLOYEE_ID) AS [Total Employees] --use [] 
FROM employees e  -- SELECT Table

LEFT JOIN departments d  --Join to other table
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
LEFT JOIN locations l
	ON d.LOCATION_ID = l.LOCATION_ID

WHERE l.CITY = 'Seattle' or l.CITY = 'New York'
GROUP BY d.DEPARTMENT_ID,d.DEPARTMENT_NAME, l.CITY -- set group 
ORDER BY [Total Employees] DESC;  -- sort

```



10. The HR department needs a report of employees in Toronto. Display the Last name, Job title, Department number, and the Department name for all employees who work in Toronto.

```sql
SELECT e.LAST_NAME,j.JOB_TITLE,d.DEPARTMENT_ID,d.DEPARTMENT_NAME,l.CITY --SELECT column 

FROM employees e  -- SELECT Table

LEFT JOIN departments d  --Join to other table
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
LEFT JOIN locations l
	ON d.LOCATION_ID = l.LOCATION_ID
LEFT JOIN jobs j
	ON e.JOB_ID = j.JOB_ID

WHERE l.CITY = 'Toronto';
```


11. The HR Department wants a list of all departments. For each department, show Employee last name, Employee ID, Job title and Department name. Some departments may have no employees, but they should still appear in the report.

```sql
SELECT e.LAST_NAME,e.EMPLOYEE_ID,j.JOB_TITLE, d.DEPARTMENT_NAME 
	FROM departments d
LEFT JOIN employees e
	ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
LEFT JOIN jobs j
	ON e.JOB_ID = j.JOB_ID;
```


12. The HR Department wants a list showing all employees and all departments.

- Include departments even if they have no employees.
- Include employees even if they have no department assigned.  

```sql
SELECT d.DEPARTMENT_NAME, e.LAST_NAME
	FROM departments d
FULL OUTER JOIN employees e
	ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME,e.LAST_NAME
ORDER BY d.DEPARTMENT_NAME DESC;
```


13. Create a report to display employees’ last name and employee number along with  their manager’s last name and manager number. Label the columns Employee,  Emp#, Manager, and Mgr#, respectively.

```sql
SELECT 
    e.LAST_NAME AS "Employee", 
    e.EMPLOYEE_ID AS "Emp#", 
    m.LAST_NAME AS "Manager", 
    m.EMPLOYEE_ID AS "Mgr#"

FROM 
    employees e
JOIN 
    employees m ON (e.MANAGER_ID = m.EMPLOYEE_ID);
    
```





----
### References
