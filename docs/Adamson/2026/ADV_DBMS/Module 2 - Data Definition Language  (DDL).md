01/22/2026
#ADV_DBMS

---

## Data Definition Language (DDL)
- CREATE  - Create a table
- ALTER - Modify table name , columns name 
- DROP - Delete 
- RENAME - Rename
- TRUNCATE - Empty  rows data
- CONMMENT - SQL comment 
Table - Basic unit of storage, composed of rows

## Naming Rules for Table and Column Names
1. Must begin with a letter
2. Must be 1 - 30 characters long
3. Must contain only A-Z, a-z, 0-9, _, '$'  and '#'
4. Must not duplicate the name of another object owned by the same user
5. Must not be a server - reserved word

## Steps in Table Creation 
1. Identify data types for attributes 
2. Identify columns that can and cannot be null
3. Identify columns that must be unique(candidate keys)
4. Determine default values
5. Identify constraints on columns(Domain specification)
6. Create the table

## Including Constraints 
- Constraints enforce rules at the table level.
- Constraints prevent the deletion of a table if there are dependencies
- The following constraints are commonly used in SQL:
	1. NOT NULL  - Ensures that a column cannot have a NULL value
	2. UNIQUE -  Ensures that all values in a column are different
	3. PRIMARY KEY - A combination of a NOT NULL and UNIQUE . Uniquely identifies each row in a table
	4. FOREIGN KEY - Prevent actions that would destroy links between tables
	5. CHECK - Ensure that the values in a column satisfies a specific condition 
	6. DEFAULT - Sets a default value for a column if no values is specified
	7. CREATE INDEX - Used to create and retrieve data from the database very quickly


## Constraints Guidelines
 1. You can name a constraint, or the MS SQL Server generates a name 
 2. Create a constraint at either of the following times:
	 - At the same time as the creation of the table
	 - After the creation of the table
3. Define a constraint at the column or table level
4. View a constraint in the data dictionary 

## DDL Statements 
The following SQL statement  is DDL 

```sql

--CREATE DATABASE Statement is used to create a new SQL database.
CREATE DATABASE ProjectDB;

--DROP DATABSE Statement is used to drop an existing SQL database.
DROP DATABASE ProjectDB;

--CREATE TABLE Statement is used to create a new table in a database.
CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
	LastName VARCHAR(255),
	FristName VARCHAR(255),
	Address VARCHAR(255),
	City VARCHAR(255)
);
```


## SQL Constraints 
MSSQL Constraints are rules applied to table columns or tables to enforce data integrity in a SQL Server database. 
- Accuracy 
- Consistency
- Integrity
- Rules

Constraints can be specified when the table is created with the CREATE TABLE statement, or after the table is created with the ALTER TABLE statement.

- Table Level / Column Level
### Table Level Constraints  (資料表 層級)
- Define Primary key / Foreign Key / Unique / Check 
- 通常Constraints 寫在 欄位定義的最後
- 多欄位，需要命名，方便維護與刪除 ，容易理解

```sql
-- Table Level Constraints
CREATE TABLE Students(
	StudentID INT,
	Email VARCHAR(100),
	Age INT,
	-- CONSTAINT {constraint name} {constraint_TYPE} {column},
	CONSTRAINT PK_Stidents PRIMARY KEY (StudentID),
	CONSTRAINT UQ_Student_Email UNIQUE (Email),
	CONSTRAINT CK_Student_Age CHECK (Age >= 18)，
	
	
	CONSTRAINT FK_Student_Class
		FOREIGN KEY(ClassID)
		REFERENCES Classes(ClassID)
		--REFERENCES {table_name}({ref_table_column})
);
```
### Column Level Constraints (欄位 層級)
- PRIMARY KEY , UNIQUE , CHECK is identify when creating table 
- The constraint name generate by MS SQL Server

```sql

CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
	Email VARCHAR(100) UNIQUE,
	Age INT CHECK (Age >=18),
	CreateDate DATE NOT NULL
);

```

### ALTER TABLE  adding  Constraints 
- 資料表已經存在 Table existed
- 資料庫維護或者後期設計調整
 
```sql

--PK
ALTER TABLE Students
ADD CONSTRAINT PK_Students PRIMARY KEY (StudentID);

--Unique
ALTER TABLE Students
ADD CONSTRAINT UQ_Student_Email UNIQUE (Email);

--Check
ALTER TABLE Students
ADD CONSTRAINT CK_Student_Age CHECK(Age >=18);

--FK 
ALTER TABLE Students 
ADD CONSTRAINT FK_Students_Class
	FOREIGN KEY (ClassID)
	REFERENCES Classes(ClassID);

--Modify Column 
ALTER TABLE regions
	ALTER COLUMN REGION_ID NUMERIC(4) NOT NULL;

```


---- 
