2026-02-08 11:14

Tags: #ADV_DBMS 
Author:  Duke Hsu

---
Module 3 - Data Manipulation Language - Part 1  INSTER

## Module Intended Learning Outcome 
- Make use of `INSERT` ,`UPDATE`, and `DELETE` instructions for the data
- Construct single queries using SQL  `SELECT` command

## Concept 

### SQL  Data Manipulation Language (DML)

- **DML** statement is executed when you :
	- Add new rows to a table 
	- Modify existing rows in a table
	- Remove existing rows from a table 
	- note: 所有操作都是針對rows的

### INSERT Statement Syntax

The `INSERT INTO` statement is used to insert new records in a table

**Specify column insert and for all the columns of the table.**

Syntax:
```sql
-- specify columns
INSERT INTO table_name (column1,column2,column3)
	VALUES(value1,value2,value3);
	

--adding vaues for all the columns of the table 
INSERT INTO table_name 
	VALUES(value1,value2,value3,value4,value5);
```


Example:
```sql
--adding values for all the columns of the table
INSERT INTO regions
	VALUES(1,"Asia");
	

--specify both the column names and the values to be inserted 
INSERT INTO departments(DEPARTMENT_ID,DEPARTMENT_NAME,LOCATION_ID) --manager_id can be null
	VALUES(160,"Customers",2100);
```

**Copy all columns from one table to another table**

Syntax:
```sql
INSERT INTO target_table
	SELECT * FROM source_table
		WHERE condition;
```

Example:
```sql
INSERT INTO CaCustomer_Table --traget table
	SELECT * FROM Customer_Table --source table
		WHERE CustomerState = 'Ca'; -- condition
```

### Insert Multiple Rows

To insert multiple rows of data, we use the same `INSERT INTO` statement, but with multiple values:

Example
```sql
--specify both the column names and the values to be inserted 
INSERT INTO departments(DEPARTMENT_ID,DEPARTMENT_NAME,LOCATION_ID) --manager_id can be null
	VALUES(160,"Customers",2100),
		  (170,"Trading",2200),
		  (180,"Purch",2300);
```

**note**: Make sure you separate each set of values with a comma `,` .


### The SQL UPDATE Statement
The `UPDATE`  statement is used to modify the existing records in a table.

Syntax:
```sql
UPDATE table_name
	SET column_name = cl_values, column_name2 = cl2_values....
	WHERE  condition;--very important
```

Example:
```sql
UPDATE Customers
	SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
	WHERE CustomerID = 10012; --customerID 10012 will be updated
```


!!!
**note**: The `WHERE`  clause specifies which records that should be updated , if you omit the `WHERE` clause, all records in the table will be updated !! 

### The SQL DELETE Statement 

The `DELETE` statement is used to delete existing records in a table

**Delete with condition**

The `DELETE`  clause specifies which records that should be updated , if you omit the `DELETE` clause, all records in the table will be deleted!! 


Syntax:
```sql
DELETE FROM table_name
	WHERE condition; --very improtant
```

Example:
```sql
DELETE FROM Customers
	WHERE CustomerID = 10012;
```

**Delete with out condition**

It is possible to delete all rows in a table without deleting the table  This means that the table structure, attributes, and indexes will be intact;

Syntax:
```sql
DELETE FROM table_name;
```

Example:
```sql
DELETE FROM Customer;
```

## Summary

1. The `INSERT INTO ` statement is used to insert new records in a table.
2. The `UPDATE` statement is used to modify the existing records in a table
3. The `DELETE` statement is used to delete existing records in a table.

----
### References: 

ADMBS_MODULE-3.PPTX