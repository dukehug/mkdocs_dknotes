
# Module - 8  Database Objects - Part 1 - View

2026-03-31 17:25

Tags: #ADV_DBMS 

Author:  Duke Hsu

---

## Key Concepts 

### Objectives 

- Table  
	 - Basic unit of storage; composed of rows 
- View
	 - Logically represents subsets of data from one or more tables.
	
- Sequence
	 - Generates numeric values
- Index
	 - Improves the performance of data retrieval queries 
- Synonym
	-  Gives alternative names to objects


### View 

- An SQL view is a virtual table based on the result-set of an SQL statement. 
- An SQL view contains rows and columns, just like a real table .
- The fields in the view are fields from one or more real tables in the database.

#### Two tables of Views


| Feature                       | Simple Views | Complex Views |
| ----------------------------- | ------------ | ------------- |
| Number of tables              | One          | One or more   |
| Contain functions             | No           | Yes           |
| Contain groups of data        | No           | Yes           |
| DML Operations through a view | Yes          | Not always    |
## Create a View From One Table 

Syntax:

```sql
CREATE VIEW view_name AS 
SELECT 
	column1, column2, .....
FROM
	table_name 
WHERE 
	condition; 
```

Example: 

Create a View named `empuv80` from the table `employees`.


```sql
CREATE VIEW empuv80 AS
SELECT 
	employee_id, last_name , salary
FROM 
	employees
WHERE 
	department_id = 80;
```

Retrieving Data from a View

```SQL
-- same output 
SELECT *
FROM 
	empuv80;
	
```

Output

employee_id                             last_name                 salary
--------------------------------------- ------------------------- ---------------------------------------
202                                     Mitchell                  8500.00
203                                     Johnson                   8200.00
207                                     Brown                     8000.00




Creating a View by using column aliases in the subquery 

```sql
CREATE VIEW salvu50
AS SELECT employee_id ID_NUMBER,
  last_name LNAME,
  salary*12 ANN_SALARY
FROM employees
WHERE department_id = 50;
```

Retrieving Data from a View

```sql
SELECT *
FROM 
	salvu50;
```

Output

ID_NUMBER                     LNAME          ANN_SALARY              
--------------------------------------- ------------------------- ---------------------------------------
120                                     Weiss                     96000.00                               
121                                     Fripp                     98400.00                                
122                                     Kaufling                  94800.00                                
123                                     Vollman                   78000.00                              
124                                     Mourgos                   69600.00                            



### Create a View From Multiple Tables

- To create a view from multiple tables we can simply include multiple tables in the SELECT statement. 

Syntax:

```sql
CREATE VIEW view_name AS
SELECT table1.column1, table1.column2, table2.column1, table2.column2.....
FROM table_1, table_2
WHERE table_1.column1 = table_2.column1; 
```

Example:

```sql
CREATE VIEW multiple_table AS
SELECT countries.REGION_ID, countries.COUNTRY_NAME,  regions.REGION_NAME
FROM countries, regions
WHERE countries.REGION_ID = regions.REGION_ID;
```

Retrieving Data from a View

```sql
SELECT *
FROM 
	multiple_table;
```

Output  

REGION_ID                               COUNTRY_NAME                             REGION_NAME
--------------------------------------- ---------------------------------------- -------------------------
2                                       Argentina                                Americas
3                                       Australia                                Asia
1                                       Belgium                                  Europe



### ALTER view Statement (SQL Server)

- In SQL server , a view can be updated with the ALTER VIEW statement. 

Syntax:

```sql
ALTER VIEW view_name AS
SELECT column1, column2, column3.....
FROM table_name
WHERE condition;
```

Example:

The following  SQL adds the `job_id` column to the `salvu50` view.

```sql
ALTER VIEW salvu50 
AS SELECT employee_id ID_NUMBER,
  last_name LNAME,
  salary*12 ANN_SALARY,
  job_id JOB_TITLE
FROM employees
WHERE department_id = 50;
```

Output

ID_NUMBER                               LNAME                     ANN_SALARY              JOB_TITLE
--------------------------------------- ------------------------- --------------------------------------- ----------
120                                     Weiss                     96000.00                                ST_MAN
121                                     Fripp                     98400.00                                ST_MAN
122                                     Kaufling                  94800.00                                ST_MAN
123                                     Vollman                   78000.00                                ST_MAN
124                                     Mourgos                   69600.00                                ST_MAN


### Creating a Complex View

!!! warning 
	 Complex views are mostly ready-only . Can include: INNER JOIN, LEFT JOIN, GROUP BY, HAVING , Subqueries.


- Complex view - A saved SELECT statement that combines multiple tables and performs calculations. 

Syntax:

```sql
CREATE view_name
AS
SELECT column1,column2,column3.....
FROM table1
JOIN table2 ON condition
WHERE condition
GROUP BY column1;
```


Example:

 Create a complex view that contains group functions to display values from two tables.

```sql
CREATE VIEW vw_DepartmentSummary
AS
SELECT
	d.department_id,
	d.department_name,
COUNT(e.employee_id) AS TotalEmployees,
AVG(e.salary) AS AvgSalary
FROM departments d
INNER JOIN employees e
	ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_ID, d.DEPARTMENT_NAME;

```

Retrieving Data from a View

```sql
SELECT * FROM
	 vw_DepartmentSummary
```

output

department_id           department_name            TotalEmployees         AvgSalary
--------------------------------------- ------------------------------ -------------- ---------------------------------------
20                                      Marketing                     2                          9500.000000
30                                      Purchasing                   6                       4150.000000
40                                      Human Resources       1                       6800.000000
50                                      Shipping                       6                          6600.000000
60                                      IT                                   8                            5912.500000
80                                      Sales                             9                         10033.333333
90                                      Executive                      3                      19333.333333
100                                     Finance                        7                        8300.000000


###  Key Rules for DML on Views

- **Single Base Table**: The view must reference only one underlying table for simple inserts and updates.


- **No Aggregation or Grouping**: Views containing GROUP BY, HAVING, or DISTINCT are not updatable.


- **No Computed Columns**: You cannot update a column that is defined by an expression or a function (e.g., salary * 12).


- **NOT NULL Constraints**: If a NOT NULL column in the base table is omitted from the view, you cannot perform an INSERT.


- **WITH CHECK OPTION**: If defined with this clause, you cannot update or insert rows that do not satisfy the view’s WHERE clause.


- **Multi-Table Views**: Updates can sometimes be performed on a single table within a join, but inserting is typically prohibited unless it meets strict key-preserved table rules.


- **Read-Only Views**: Views created with the READ ONLY clause or using complex queries cannot be used for DML operations


### Using the WITH CHECK OPTION Clause 

- The WITH CEHCK OPTION is used when creating a view to enforce the view's condition during INSERT or UPDATE
- It ensures that any data modified through the view must still satisfy the WHERE condition of the view.


!!! note "WithOut CHECK OPTION"
	 You can insert data that is NOT visible in the view.


!!! note "With CHECK OPTION"
	 You can ONLY insert / update data that remains visible in the view.


### Adding vs Not Adding WITH CHECK OPTION

| Situation                  | with (WITH CHECK OPTION)                                                    | with Out (WITH CHECK OPTION)                                                                      |
| -------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| INSERT / UPDATE operations | Only allows you to insert or update data that matches the view's conditions | Lets you insert or update any data, even if it doesn't match the view's conditions                |
| Data disappearing          | Won't happen — your changes stay visible in the view                        | Can happen — your changes might not match the conditions anymore, so they disappear from the view |
| Error message              | Throws an error (Msg 550) if you try to break the rules                     | No checking — the operation just goes through                                                     |


Syntax:

```sql
CREATE VIEW view_name
AS
SELECT column1,column2....
FROM table_name
WHERE condition
WITH CHECK OPTION;
```

Example:

```sql
CREATE VIEW vw_ITEmployees
AS
SELECT employee_id,first_name, job_id
FROM employees
WHERE job_id = 'ST_MAN'
WITH CHECK OPTION;
```

Retrieving Data from a View

```sql
SELECT * FROM
	 vw_ITEmployees;
```

Output

employee_id                             first_name           job_id
--------------------------------------- -------------------- ----------
120                                     Matthew              ST_MAN
121                                     Adam                 ST_MAN
122                                     Payam                ST_MAN
123                                     Shanta               ST_MAN
124                                     Kevin                ST_MAN


#### Real Life Example for WITH CHECK OPTION


```sql
SELECT employee_id , last_name, salary FROM employees
WHERE salary > 10000;


--create a view with out WITH CHECK OPTION
CREATE VIEW HighSalaryEmployees AS
SELECT last_name, salary 
FROM employees 
WHERE salary > 10000;

--use ALTER modify view 
ALTER VIEW HighSalaryEmployees AS
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > 10000;


--create a view with WITH CHECK OPTION
CREATE VIEW HighSalaryEmployees_Checked AS
SELECT last_name, salary
FROM employees
WHERE salary > 10000
WITH CHECK OPTION;


--use ALTER modify view 
ALTER VIEW HighSalaryEmployees_Checked AS
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > 10000
WITH CHECK OPTION;



-- use view
SELECT * FROM 
	HighSalaryEmployees;

SELECT * FROM
	HighSalaryEmployees_Checked; --same result
	
--update employee salary in the with out check option view 
UPDATE HighSalaryEmployees
SET salary = 300000
WHERE employee_id = 225;  --since with out WITH CHECK OPTION, automatic sucess  


--update employee salary in the with check option view
UPDATE HighSalaryEmployees_Checked
SET salary = 26000;
WHERE employee_id = 201;  --return Error 
	

```



### Using the WITH READ ONLY Clause

|   |   |
|---|---|
|- **Feature**|- **MS SQL Support**|
|- WITH READ ONLY|- ❌ Not supported|
|- Complex View|- ✔ Automatically read-only|
|- Permission Control|- ✔ Recommended|
|- WITH CHECK OPTION|- ✔ Restricts data validity|

## Removing a View

Syntax:

```sql
DROP VIEW view_name;
```


Example:

```sql
DROP VIEW vw_ITEmployees;
```


Error msg:

```sql
SELECT * FROM
	 vw_ITEmployees;
```

```
Msg 208, Level 16, State 1, Line 1

Invalid object name 'vw_ITEmployees'.


Completion time: 2026-04-01T20:06:13.1493188+08:00
```


## When Should You Use WITH CHECK OPTION?

### Use it in these situations:

- Data accuracy matters a lot — Like in banking or inventory systems, where you can't have data suddenly vanish after an update
- Control what people can change — For example, a manager should only be able to edit employees in their own department, not accidentally touch other departments
- The view filters data in a specific way — Like showing only "active orders" or "non-expired coupons"
- You have views built on top of other views — This protects the whole chain of filters

### You don't really need it if:

- The view is just for looking at data — You never insert, update, or delete through it
- The view shows everything — It has no WHERE clause to filter anything
- You want to allow data beyond the view's conditions — You're okay with data disappearing from the view




----
### References
