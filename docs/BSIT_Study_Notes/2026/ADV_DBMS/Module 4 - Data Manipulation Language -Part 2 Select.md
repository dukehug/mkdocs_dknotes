
#Module 4 - Data Manipulation Language -Part 2 

---

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

SQL operators are symbols or keywords used to perform operations on data in SQL queries 

#### Arithmetic Operators

Arithmetic Operators in SQL are used to perform mathematical operations on numeric data types in  SQL queries.

| symbol | meaning        | example |
| ------ | -------------- | ------- |
| +      | Addition       |         |
| -      | Subtraction    |         |
| *      | Multiplication |         |
| /      | Division       |         |
| %      | Modulus        |         |


Example:


```sql
SELECT EmployeeName, Salary, Bonus,
	Salary + Bonus AS Total_Income, --Addition
	Salary - Bonus AS After_Bonus_Deduction, --subtraction
	Salary * 0.10 AS Ten_Percent_Tax, --multiplication
	Salary / 30 AS Dayly_Salary, --division
	Salary % 10000 AS Salary_Remainder --modulus
FROM Employees;
```

---

#### Comparison Operators

Comparison Operators in SQL are used to compare on expression's value to other expressions. 



| symbol | meaning                  | example |     |     |
| ------ | ------------------------ | ------- | --- | --- |
| =      | Equal                    |         |     |     |
| !=     | Not Equal                |         |     |     |
| <>     | less than and great than |         |     |     |
| <      | Less than                |         |     |     |
| >      | Great than               |         |     |     |
| >=     | Great than or Equal      |         |     |     |
| <=     | Less than or Equal       |         |     |     |



```sql
SELECT *
	FROM Students
	WHERE Score >=70;
	

SELECT *
	FROM Students
	WHERE Score <=50;
```

```sql
SELECT *
	FROM Students
	WHERE Age <> 18;
```



#### Logical Operators 

Logical Operators in SQL are used to combine or manipulate conditions in SQL queries to retrieve or manipulate data based on specified criteria. 


| symbol | meaning               | example |     |
| ------ | --------------------- | ------- | --- |
| AND    | result should be True |         |     |
| OR     | True or False         |         |     |
| NOT    | False                 |         |     |


Example:


```sql

--AND
SELECT *  
	FROM Students 
		WHERE Score >=70 AND Age >=18; --both conditions must be true 


--OR
SELECT * 
	FROM Students
		WHERE Score <60 OR Age <18; --either conditioncan be true

--NOT
SELECT *
	FROM Students
		WHERE NOT Score >=50;


```





#### Bitwise Operators

Compound operators combine an operation with assignment. These operators modify the  value of a column and store the result in the same column in a single step


| symbol | meaning    | example |     |
| ------ | ---------- | ------- | --- |
| &      | AND        |         |     |
| \|     | OR         |         |     |
| ^      | XOR        |         |     |
| ~      | NOT        |         |     |
| <<     | Left move  |         |     |
| >>     | Right move |         |     |


8 bit

$2^7 - 2^6- 2^5- 2^4- 2^3- 2^2- 2^1- 2^0$
$128-64-32-16-8-4-2-1$

---


| **Bit position (from left to right)** | **1**  | **2**  | **3**  | **4**  | **5**      | **6**  | **7**      | **8**  |
| ------------------------------------- | ------ | ------ | ------ | ------ | ---------- | ------ | ---------- | ------ |
| **Binary number 170**                 | 1      | 0      | 1      | 0      | 1          | 0      | 1          | 0      |
| **Binary number 75**                  | 0      | 1      | 0      | 0      | 1          | 0      | 1          | 1      |
| **Compare**                           | $1\&0$ | $0\&1$ | $1\&0$ | $0\&0$ | **$1\&1$** | $0\&0$ | **$1\&1$** | $0\&1$ |
| **AND Result**                        | **0**  | **0**  | **0**  | **0**  | **1**      | **0**  | **1**      | **0**  |

00001010 =  2+ 8 = 10
 
---


| **Bit position (from left to right)** | **1** | **2** | **3** | **4** | **5** | **6** | **7** | **8** |
| ------------------------------------- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| **Binary number 170**                 | 1     | 0     | 1     | 0     | 1     | 0     | 1     | 0     |
| **Binary number 75**                  | 0     | 1     | 0     | 0     | 1     | 0     | 1     | 1     |
| **Compare**                           | 1\|0  | 0\|1  | 1\|0  | 0\|0  | 1\|1  | 0\|0  | 1\|1  | 0\|1  |
| **OR Result**                         | **1** | **1** | **1** | **0** | **1** | **0** | **1** | **1** |
|                                       |       |       |       |       |       |       |       |       |

11101011 = 128+ 64+32+8+2+1 = 235


#### Compound Operator

複合運算符
Compound operators combine an operation with assignment. These operators  modify the value of a column and store the result in the same column in a single step. 

| symbol | meaning | example |     |
| ------ | ------- | ------- | --- |
| +=     |         |         |     |
| -=     |         |         |     |
| *=     |         |         |     |
| /=     |         |         |     |
| %=     |         |         |     |


Example:

```sql
UPDATE stdudent
	SET score += 10
		WHERE studentID = 1;


UPDATE student
	SET score -= 10
		WHERE studentID = 2;

UPDATE student
	SET score /=2
		WHERE studentID = 3;

UPDATE student
	SET score *=2
		WHERE studentID =4;
		
```


#### Special Operators

- `BETWEEN .....AND .....`
- `IN(....)`
- `LIKE`
- `IS NULL`
- `EXISTS`


#### The SQL IN Operator

- The `IN` operator allows you to specify multiple values in a `WHERE` clause.
- The `IN` operator  is a shorthand for multiple `OR` conditions.

**Syntax:**

```sql
SELECT column_name(s) FROM table_name
	WHERE column_name IN (value1,value2,.....);
```

**Example:** 

```sql
--rerturn all customes from `Germany`, `France` or 'UK'

SELECT * FROM Customers
	WHERE Country IN ('Germany','France','UK');
```


**Nature language :**

從 Customers 表中選擇所有記錄，條件是這些記錄的 Country 欄位是德國、法國或英國。

Select all records from the `Customers` table where the `Country` column is include `Germany, France,UK.`



#### The SQL `BETWEEN` Operator

- The `BETWEEN` operator selects values within a given range. The values can be numbers, text, or dates.
- The `BETWEEN` operator is inclusive: begin and end values are included.(起始值和結束值都包含在內)

**Syntax:**

```sql
SELECT column_name(s) FROM table_name
	WHERE column_name BETWEEN values1 AND values2;
```

**Example:**

```sql
-- selects all products with a price between 10 and 20

SELECT * FROM Products
	WHERE Price BETWEEN 10 and 20;
```





####  The SQL `LIKE` Operator

- `LIKE` 運算子用於在 `WHERE` 子句中搜尋資料行中的**指定模式 (Pattern)**。
    
- 通常與**萬用字元 (Wildcards)** 搭配使用：
    
    - `%`：代表零個、一個或多個字元。
        
    - `_`：代表單一個字元。
        

**Syntax:**

SQL

```sql
SELECT column_name(s) FROM table_name
	WHERE column_name LIKE pattern;
```

**Example:**

SQL

```sql
-- return all customers whose name starts with 'a'
SELECT * FROM Customers
	WHERE CustomerName LIKE 'a%';
```

**Natural Language:**

從 `Customers` 表中選擇所有記錄，條件是 `CustomerName` 欄位的值是以 "a" 開頭。

Select all records from the `Customers` table where the `CustomerName` column starts with the letter "a".



#### The SQL `IS NULL` Operator

- `IS NULL` 運算子用於測試**空值 (NULL values)**。
    

!!! warning
	不能使用比較運算子（如 `=` 或 `!=`）來測試 NULL，必須使用 `IS NULL` 或 `IS NOT NULL`。

**Syntax:**

SQL

```sql
SELECT column_name(s) FROM table_name
	WHERE column_name IS NULL;
```

**Example:**

SQL

```sql
-- return all customers that do not have an address listed
SELECT * FROM Customers
	WHERE Address IS NULL;
```

**Natural Language:**

從 `Customers` 表中選擇所有記錄，條件是 `Address` 欄位沒有數值（為空值）。

Select all records from the `Customers` table where the `Address` column has a NULL value.



#### The SQL `EXISTS` Operator

- `EXISTS` 運算子用於測試**子查詢 (Subquery)** 是否傳回任何記錄。
    
- 如果子查詢傳回一筆或多筆記錄，則傳回 `TRUE`。
    

**Syntax:**

SQL

```sql
SELECT column_name(s) FROM table_name
WHERE EXISTS (SELECT column_name FROM table_name WHERE condition);
```

**Example:**

SQL

```sql
-- return suppliers with a product price less than 20
SELECT SupplierName FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products 
              WHERE Products.SupplierID = Suppliers.supplierID 
              AND Price < 20);
```

**Natural Language:**

從 `Suppliers` 表中選擇供應商名稱，條件是該供應商在 `Products` 表中有至少一項產品價格低於 20。

Select the `SupplierName` from the `Suppliers` table if the subquery returns any records (i.e., if there is at least one product with a price less than 20 for that supplier).


---
!!!note
	SQL 聚合函數（Aggregate Functions）用於對一組值執行計算，並傳回**單一值**。除了 `COUNT(*)` 之外，聚合函數都會忽略空值 (NULL)。


!!!warning
	 Operand data type varchar is invalid for sum operator.


####  The SQL `COUNT()` Function

- `COUNT()` 函數傳回符合指定條件的**資料列數目**。
    

**Syntax:**


```sql
SELECT COUNT(column_name) FROM table_name
	WHERE condition;
```

**Example:** 

```sql
-- return the total number of products
SELECT COUNT(ProductID) FROM Products;
	WHERE Price > 20;
```

####  The SQL `SUM()` Function 

- The `SUM()`  returns the total sum of a numerical column


**Syntax** :
```sql
SELECT SUM(column_name) FROM table_name 
	WHERE condition;
```

**Example**:
```sql
SELECT SUM(LAST_NAME) FROM employees
	WHERE DEPARTMENT_ID = 100;
```


#### The SQL `MIN()` and `MAX()` Function

- The  `MIN()`  returns the smallest value within the selected column
- The `MAX()`  returns the largest value within the selected column

**Example**:

```sql
--MAX
SELECT MAX(SALARY)
	FROM employees;


--MIN
SELECT MIN(SALARY)
	FROM employees;
```

#### The SQL `AVG()`  Function 

- The `AVG()` function returns the average value of a numerical column

**Example:**

```sql
SELECT AVG(SALARY)
	FROM employees;
```

---

#### Using Aliases With a Space Character 
- If you want your alias to contain one or more spaces, like "My Great Products", surround your alias with square brackets or double quotes. 

**Example** 

Using` [square brackets]` for aliases with space characters: 

```sql
SELECT ProductName AS [My Great Products] 
	FROM Products;  
```

Using "double quotes" for aliases with space characters: 

```sql
SELECT ProductName AS "My Great Products" 
	FROM Products;
```


#### SQL `SELECT DISTINCT` Statement 

- The `SELECT DISTINCT `statement is used to return only distinct (different) values. 
- **SELECT DISTINCT** 语句的确是用来返回某个列中不重复的值。它确保返回的结果集中没有重复项。

**Syntax:** 

```sql
SELECT DISTINCT column1, column2, ... 
	FROM table_name;
```

**Example:** 

- Select all the different countries from the "Customers" table:

```sql
SELECT DISTINCT Country 
	FROM Customers; 
```











----

### References: 

MSSQL Group Functions - https://learn.microsoft.com/zh-cn/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-ver17


