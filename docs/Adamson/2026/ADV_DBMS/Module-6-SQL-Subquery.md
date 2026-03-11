
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

Example:  What are the name and address of the customer who placed order number 1008??

**JOIN**

```sql
SELECT
	c.CustomerName,
	c.CustomerAddress, 
	c.CustomerCity, 
	c.CustomerPostalCode
FROM Customer_T c 
	JOIN Order_T o 
	ON c.CustomerID = o.CustomerID 
WHERE o.OrderID = 1008;
```


**Sub-query** 

```sql
SELECT CustomerName,CustomerAddress,  --Selected the column
	CustomerCity,CustomerPostalCode 
FROM Customer_T -- Selected the table (Customer Table)
	WHERE Customer_T.CustomerID = ( --Main query condition 
	SELECT Order_T.CustomerID  --this sub-query will return a customerID
		FROM Order_T -- From Order table 
		WHERE OrderID = 1008 -- condition is OrderID == 1008
	);
```

Explain :  The `subquery` returns the **`CustomerID`** for **`OrderID 1008`**. Then, we use that ID to **`look up`** the customer's name and address in the **`Customer table`**.

## Correlated vs. Non correlated Sub queries

**Correlated** 
-  A correlated subquery depends on the outer query.
- It runs once for every row of the outer query.
- The inner query uses a value from outer query.
- Can use the EXISTS operator

**Logical**
- It runs once for every row of the outer query.

Example:

```sql
SELECT e1.LAST_NAME, e1.SALARY
FROM employees e1
WHERE e1.SALARY > (
    SELECT AVG(e2.SALARY) 
    FROM employees e2 
    WHERE e2.DEPARTMENT_ID = e1.DEPARTMENT_ID -- 這裡引用了外層的 e1
);
```


**Non-Correlated Subquery**
- A non-conrrelated subquery is independent of the outer query .
- It runs only once.
- The result is used by the main query.

**Logical**
- The subquery runs first, then returns the result to the main query. It only executes once.

Example:

```sql
SELECT LAST_NAME
FROM employees
WHERE DEPARTMENT_ID = (  --sub-query start
	SELECT DEPARTMENT_ID
	FROM departments
	WHERE DEPARTMENT_NAME = 'IT' -- independent work
);
```


## Union Queries

- Combine the output(union of multiple queries) together into a single result table . 


**UNION**（聯集）是 SQL 中用來將多個查詢結果「**垂直堆疊**」在一起的語法。
如果說 **JOIN** 是將兩張表 **橫向(左右)** 合併，那麼 UNION 就是將兩張表 **縱向（上下）** 合併。

想像你有兩份名單：一份是「正式員工」，另一份是「約聘人員」。如果你想把這兩份名單拼成一張完整的「通訊錄」，你就會用到 `UNION`

Example: 

```sql
SELECT name, phone FROM FullTimeEmployees

UNION

SELECT name, phone FROM ContractEmployees;
```

### UNION vs UNION ALL

- **`UNION`**：會自動**去除重複**的資料。就像集合運算，如果兩張表都有同一個客戶，結果只會出現一次。
    
- **`UNION ALL`**：**不檢查重複**，直接把所有結果疊加。
    
    - **效能提示**：`UNION ALL` 的執行速度比 `UNION` 快很多，因為它不需要花時間去比對和剔除重複項。如果你確定資料不會重複，請優先選 `UNION ALL`。

### UNION Rules

要成功把兩組數據「疊」在一起，必須滿足以下兩個條件：

1. **欄位數量必須相同**：第一個 `SELECT` 查了 3 個欄位，第二個也必須是 3 個。
    
2. **資料類型必須相容**：第一個查詢的第一欄如果是「數字」，第二個查詢的第一欄也必須是「數字」（或能轉換成數字）。

## Tips for Developing Queries 

- Be familiar with the data model (entities and relationships)
- Understand the desired results
- Know the attributes desired in results
- Identify the entities that contain desired attributes
- Review ERD
- Construct a WHERE equality for each link
- Fine tune with GROUP BY and HAVING clauses if needed 
- Consider the effect on unusual data

## Query Efficiency Considerations

- Instead of SELECT  *   , identify the specific attributes in the SELECT cause; this helps reduce network traffic of result set.

- Limit the number of sub-queries; try to make everything done in a single query if possible 

- If data is to be used many times, make a separate query and store it as a view.




----
### References

Module 6 - SQL Subquery 

Gemini - UNION vs UNION ALL  and  UNION Rules