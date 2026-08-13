
# Module - 8  Database Objects - Part 3 - Index and Synonym

2026-04-08 13:21

Tags:  #ADV_DBMS 

Author:  Duke Hsu

---

##  1.0 Key Concepts 

### 1.1 Index

- Indexes in SQL are special database structures that speed up data retrieval by allowing quick access to records instead of scanning the entire table 
- They act like a lookup system and play an important role in improving query performance and database efficiency.

- It speed up queries(SELECT, JOIN, WHERE , ORDER BY)
- Reduce disk I/O and improve efficiency in large tables. 
- Ensure data integrity with unique indexes

### 1.2 Index Created Automatically and Manually

- Automatically: A unique index is created automatically when you define a PRIMARY KEY or UNIQUE constraint in a table definition. 
- Manually: Users can create non-unique indexes on columns to speed up access to the rows. 
### 1.3 Types of Index

1. Single column Indexes
	A single-column index is created on just one column. It's the most basic type of index and helps speed up queries when you frequently search, filter or sort by that column .
2. Clustered Index and Non-Clustered Index
	
3. Unique Index 
## 2.0 Index Operate 

### 2.1.0  Create a Single Column Index

Syntax:

```sql
CREATE INDEX index_name ON TABLE column;
```

### 2.1.1 Create a Clustered Index

Example:

```sql
CREATE CLUSTERED INDEX index_dept_ID
ON departments(department_id);
```

### 2.1.2 Create a non-clustered Index

```sql
CREATE NONCLUSTERED INDEX index_location_id
ON departments(locations_id);
```

### 2.1.3 Create a Unique Index

```sql
CREATE UNIQUE INDEX idx_deptname
ON departments(department_name);
```

### 2.2.0 Renaming an Index

```sqle
EXEC sp_rename 'old_index_name', 'new_index_name', 'INDEX';
```

### 2.3.0 Removing index

```sql
DROP INDEX index_name;
```

## 3.0 Synonym 

### 3.1.0 Synonym concepts

- Synonym is simplify access to objects by creating a synonym(another name for an object)
- With synonyms, you can :
- Create an easier reference to table that is owned by another user 
- Shorten lengthy object names. 

### 3.1.1 Creating and Removing a Synonym 

Syntax:

```sql
--creating
CREATE SYNONYM synonym_name
FOR  object_name;

--removing 
DROP SYNONYM synonym_name;
```


----
## References

Module - 8  PPT
