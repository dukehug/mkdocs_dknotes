
#  Module  - 8  Database Objects -  Part 2 - Sequences  

2026-04-07 15:32

Tags: #ADV_DBMS 

Author:  Duke Hsu

---

Update : 2026-04-08 12:33
## Concepts

**Sequences** 

- Can automatically generate unique numbers
- Is a shareable object
- Can be used to create a primary key value
- Speeds up the efficiency of accessing sequence values when cached in memory 

**Objects types table** 

| Object   | Description                                                    |
| -------- | -------------------------------------------------------------- |
| Table    | Basic unit of storage, composed of rows.                       |
| View     | Logically represents students of data from one of more tables. |
| Sequence | Generates numeric values                                       |
| Index    | Improves the performance of some queries                       |
| Synonym  | Give alternative names to objects.                             |

**CACHE**  

CACHE means SQL Server prepares and saves a batch of sequence numbers in memory beforehand to make things faster. When you use `NO CACHE`, SQL Server doesn't save numbers in advance. Instead, it generates each number directly from the disk every single time.

 **CACHE vs NO CACHE: The Difference**

|Situation|CACHE (Default)|NO CACHE|
|---|---|---|
|Speed of generating numbers|Fast — reads numbers that are already prepared in memory|Slow — has to generate each number from disk every time|
|Memory usage|Uses extra memory to store pre-prepared numbers|Doesn't use extra memory|
|After database restarts|Pre-prepared numbers might get lost, so the next number jumps ahead|Numbers stay in order with no gaps|
|Performance|High performance|Lower performance, but more accurate|

 **CYCLE**

CYCLE means whether the sequence numbers should start over from the minimum value after reaching the maximum value. When you use `NO CYCLE`, the sequence stops when it reaches the maximum and won't create new numbers anymore.

### CYCLE vs NO CYCLE: The Difference

|Situation|CYCLE|NO CYCLE (Default)|
|---|---|---|
|When max value is reached|Automatically starts over from the minimum value|Stops and throws an error|
|Infinite numbers|Can keep producing numbers forever (but they repeat)|Has a limit — stops working at max value|
|Data uniqueness|Risk — might create duplicate numbers|Safe — numbers never repeat|
|When to use|Very rare (usually you don't want repeats)|Most situations use this|


## CREATE  SEQUENCE Statement 

Define a sequence to generate sequential numbers automatically:

Syntax:

```sql
CREATE SEQUENCE sequence
	[INCREMENT BY n]
	[START WITH n]
	[{MAXVALUE n | NO MAXVALUE}]
	[{MINVALUE n | NO MINVALUE}]
	[{CYCLE   | NO CYCLE}]
	[{CACHE CacheSize  | NO CACHE}];
	
```


Example:

```sql
-- create a squence for departments
CREATE SEQUENCE dept_deptid_seq
	INCREMENT BY 10
	START WITH 160
	MAXVALUE 1100
	NO CACHE
	NO CYCLE;
```

## Using a Sequence 


```sql
--using a sequence 
--insert a new department named "Support" in  location ID: 2500
INSERT INTO departments(department_id,department_name, 	location_id)
VALUES(
	NEXT VALUE FOR dept_deptid_seq, --generates next departmentID
	'Support', --department name
	2500 --location ID
);

```

## Modifying A Sequence 

Guideline for modifying a sequence

 - You mush be the owner or have the ALTER privilege for the sequence
 - Only future sequence numbers are affected.
 - The sequence must be dropped and re-created to restart the sequence at a different number. 
 - Some validation is performed .
- Change the increment value , maximum value, minimum value, cycle option   or cache option 

!!! waring "Be careful ‘START’"
	When you use ALTER SEQUENCE, make sure to remove the START WITH option.

```sql
--modifying a sequence 
ALTER SEQUENCE dept_deptid_seq
	INCREMENT BY 20 --incerment value 
	MAXVALUE 2100 
	CACHE 50 --create 50 numbers for departmentID
	NO CYCLE; -- no repeat
```


!!! warning "Caching Sequence Values "
	Gaps in sequence values can occur when:
		- A rollback occurs
		- The system crashes
		- A sequence is used in another table


##  DROP SEQUENCE 

```sql
DROP SEQUENCE dept_deptid_seq;

```



----
## References

MODULE - 8 PPT
