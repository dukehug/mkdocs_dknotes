
# Module 6 SQL Subquery

2026-03-10 16:03

Tags: #ADV_DBMS 

Author:  Duke Hsu

---

## Key Concept

- Sub-query - placing an inner query (SELECT statement) inside an outer query 
- Sub-query can appear in :
	- SELECT 
	- FROM 
	- WHERE

- Sub-query   can be: 
	- Non-correlated executed once for the entire outer query 
	- Correlated executed once for each row returned by the outer query.


## Sub-query  in WHERE Clause 

Example:

Find employees who earn more than the average salary 

```sql
SELECT LAST_NAME, SALARY 
FROM employees 
	WHERE SALARY >  --condition
		(SELECT AVG(SALARY) FROM employees);  
```


## Sub-query with IN

Example: 

Find employees who belong to the HR Department.

```sql

SELECT LAST_NAME
FROM employees
	WHERE DEPARTMENT_ID IN
		(SELECT DEPARTMENT_ID FROM departments
		WHERE DEPARTMENT_NAME = 'Human Resources');
```

## Sub-query in SELECT 

Example:

Show employee salary and the average salary.

```sql
SELECT LAST_NAME, SALARY,
	(SELECT AVG(SALARY)
	FROM employees)  AS [Average Salary]
FROM employees;
```

## JOIN vs Sub-query 

- Some queries could be accomplished by either a join or a sub-query 

Example:









----
### References
