
# Module  9 SQL  Stored Procedure

2026-04-09 00:34

Tags: #ADV_DBMS 

Author:  Duke Hsu

---
## 1.0 Key Concepts

### 1.1.0 Stored Procedure 

-  A stored procedure is a prepared SQL code that you can save , so the code can be reused over and over again . 
- A stored procedure is similar to a function or method in a programming language. It can accept parameters, execute a set of operations, and return results.

### 1.1.1 Keywords in Stored Procedure

#### A. Definition and Creation 

- **CREATE PROCEDURE / ALTER PROCEDURE** 
-  The primary command used to define a new procedure in the database

- **AS**
- Separates the procedure header(name and parameters) from its body.

- **BEGIN ......END**
- Delimits the block of SQL statements that make up the procedures logic.

- **DROP PROCEDURE**
- Removing procedure

#### B. Execution and Control 

- **EXEC(or EXECUTE)**
- Used to run a stored procedure in SQL Server.

- **OUTPUT**
- Indicates that a parameter is used to return a value back to the caller. 

## 2.0  Stored Procedure and Example

### 2.1.0   Stored Procedure Syntax (SQL Server)

**Creating a Stored Procedure** 

Syntax: 

```sql
CREATE PROCEDURE procedure_name
[parameter1 datatype, parameter2 datatype,.......]
AS
BEGIN
	-- SQL_statements to be executed
	SELECT column1, column2 ...
	FROM table_name
	WHERE  columnN = @parameter;
END;
```

**Execute a Stored Procedure**

Syntax:

```sql
EXEC procedure_name  @param1 = 'value1', @param2 = 'value2';
```


**Drop a Stored Procedure**

Syntax:

With out `IF EXISTS`

```sql
DROP PROCEDURE procedure_name;
```

With `IF EXISTS`

```sql
DROP PROCEDURE IF EXISTS procedure_name;
```

!!! note "IF EXISTS"
	To ensure that` DROP PROCEDURE` does not return an error, if the procedure is missing, add the `IF EXISTS` clause.



### 2.1.1 Stored Procedure Example

Create a Stored Procedure that displays the annual salary of an employee.

```sql
CREATE PROCEDURE sp_CaculateAnnualSalary --procedure name
	@employee_id INT --parameter
AS
BEGIN
	-- declare a variable
	DECLARE @AnnualSalary DECIMAL(10,2);
	
	--using SQL statement caculate the annual salary  
	SELECT @AnnualSalary = Salary * 12
	FROM employees
	WHERE employee_id = @employee_id;
	
	--print result (or use output)
	PRINT'Annual salary for employee ID: ' + CAST(@employee_id AS VARCHAR) +':' + CAST(@AnnualSalary AS VARCHAR);

END; --end
```


**Using SQL Stored Procedure**

```sql
EXECUTE sp_CaculateAnnualSalary @employee_id = 12345;
```

----
## References

Module 9 PPT
