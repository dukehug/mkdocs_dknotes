2026-02-07 21:03

Tags: #ADV_DBMS 
Author:  Duke Hsu

---

Module 4 - Data Manipulation Language -Part 2 

## Module Intended Learning Outcome 
- Construct single table queries using SQL SELECT command
- Make use of different aggregated functions to customize output 



## Topic  / Concept

### Capabilities of SQL Select statement

![image1](../../../assets/images/capabilities_of_sql_seletct.png) 


**Projection  (投影)**

Use `SELECT` to select specific columns in a table.
使用 `SELECT` 選定table 中特定的某一些column . 

Example:
```sql
SELECT FIRST_NAME, EMAIL  --column first name and email only 
	FROM employees; --from employees table
	
```

![image5](../../../assets/images/projection_results.png)


**Selection (選擇)**

Filter data (rows) based on specific condition.
通過特定的條件來篩選符合要求的數據（rows）

Example:
```sql

SELECT * FROM employees WHERE SALARY > 8000;
--select  all  from {table_name} where {condition}; 
```

![image2](../../../assets/images/selection_results.png)


**Join (連接)**

Two different tables are linked together based on a common field/column (such as ID) and merged into a single set of data.
將兩張不同的表，基於某個共同的欄位（如 ID）關聯起來，合併成一組數據。

Example:
```sql

SELECT employees.DEPARTMENT_ID, departments.DEPARTMENT_NAME
	FROM employees
		JOIN departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID;
```

![image3](../../../assets/images/joint_relusts.png)

其它還有
1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
4. FULL OUTER JOIN

請參閱文檔: [[JOIN TABLE]]

### Select Statement 
- Used for queries on single or multiple tables
- Clauses of the SELECT statement

```sql
SELECT JOB_ID, AVG(SALARY) AS average_salary
	FROM employees
	WHERE SALARY > 3000
	GROUP BY JOB_ID
	HAVING AVG(SALARY) > 5000
	ORDER BY average_salary ASC; --DESC 是從大到小


```

![image4](../../../assets/images/select_results.png)

### SQL Operators 







----

### References: 

MSSQL Group Functions - https://learn.microsoft.com/zh-cn/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-ver17


