
# Exercise 3 SQL Join

2026-03-09 09:59

Tags: #ADV_DBMS 

Author:  Duke Hsu

---


1. The HR manager wants to generate a report of all company locations in the United States of  
	America that are specifically located in the state of California. Display Location ID, Street  
	Address, City, State/Province and Country Name.  
	
```sql
SELECT l.LOCATION_ID,l.STREET_ADDRESS,l.CITY,STATE_PROVINCE,c.COUNTRY_NAME
	FROM locations l 
	INNER JOIN countries c  --need match
	ON l.COUNTRY_ID = c.COUNTRY_ID 
WHERE l.CITY = 'California'; --condition
```


2.  The HR Department wants to know how many company locations exist per country. Display  
	Country Name and Total Number of Locations

```sql
SELECT c.COUNTRY_NAME,COUNT(l.LOCATION_ID ) AS TotalLocations
	FROM locations l
	LEFT JOIN countries c
	ON l.COUNTRY_ID = c.COUNTRY_ID 

GROUP BY c.COUNTRY_ID ,c.COUNTRY_NAME 
ORDER BY TotalLocations DESC; --large to small

```


3. The HR Department wants to generate a report listing all employees together with the department where they are assigned. Display Employee last name, Department number and Department name

```sql
SELECT e.LAST_NAME,e.DEPARTMENT_ID, d.DEPARTMENT_NAME

	FROM employees e
	LEFT JOIN departments d
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID

ORDER BY e.LAST_NAME ASC;
	
```






----
### References
