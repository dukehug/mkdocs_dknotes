
# Module 7 Data Control Language

2026-03-12 19:20

Tags: #ADV_DBMS 

Author:  Duke Hsu

---


## Key Concept

**Controlling Users Access**



**Privileges in the database**
- System privileges: Performing a particular action within the database 
- Object privileges: Manipulating the content of the database objects 




**System Privileges**
 - More than 100 privileges are available .
 - The database administrator has high-level system privileges for tasks such as:
	 - Creating news users
	 - Removing users
	 - Removing tables
	 - Backing up tables



**Object Privileges**
- Object privileges vary from object to object. 
- An owner has all the privileges on the object. 
- An owner can give specific privileges on that owner's object.

##  Create users of Database 

```sql
-- create a user with password
CREATE LOGIN duke WITH PASSWORD = 'P-LG9XTLqhtH';
```


## Create a User in a Specific Database 

```sql
USE HR;
CREATE USER newDuke FOR LOGIN newDuke;
```




## Grant  privileges on tables

```sql
--syntax 
GRANT SELECT, UPDATE ON tables_name  TO user1,user2,user3;


-- GRANT privileges - employees table
GRANT SELECT, UPDATE ON employees TO duke; 
```


## Creating and Granting Privileges to a Role

```sql
--Create a role:
CREATE ROLE manager;

-- Grant privileges to a role
GRANT CREATE TABLE, CREATE VIEW  TO manager;

--Grant a role to users
GRANT manager TO duke, jamila;

```


`CREATE TABLE`  - Permission to create new tables in the database. 

`CREATE VIEW`  - Permission to create new views in the database .

`CREATE SEQUENCE` - 

`CREATE PROCEDUER` - 



## Changing User Password

- The DBA creates your user account and initializes your password.
- You can change your password by using the **ALTER USER** statement.

```sql
ALTER USER HR
IDENTIFIED BY duke;
```


```sql
ALTER LOGIN duke WITH PASSWORD = 'P@ssw0rd!#2024';
```






## Object Privileges 

| Object Privileges | Table | View | Sequence |
| ----------------- | ----- | ---- | -------- |
| ALTER             | ☑     |      | ☑        |
| DELETE            | ☑     | ☑    |          |
| INDEX             | ☑     |      |          |
| INSERT            | ☑     | ☑    |          |
| REFERENCE         | ☑     |      |          |
| SELECT            | ☑     | ☑    | ☑        |
| UPDATE            | ☑     | ☑    |          |

Syntax

```sql
GRANT   -- object_priv [(columns)]
ON  -- object
TO  --{user| role | public}

[WITH GRANT OPTION];
```

Example: 

Grant query privileges on the `employees` table;

```sql
GRANT SELECT
ON    employees
TO    duke;
```


```sql
GRANT  UPDATE (department_name, location_id)
ON     departments
TO     jayvee, manager;
```

## Passing On Your Privileges

Give a user authority to pass along privileges:

```sql
GRANT SELECT, INSERT 
ON  departments
TO  jayvee
WITH   GRANT OPTION;
```


Allow all users on the system to query data from `Alice's DEPARTMENT` Table

```sql
GRANT SELECT
ON alice.departments
TO PUBLIC;
```


## Revoking Object Privileges

- You use the `REVOKE `statement to revoke privileges granted to other users.
- Privileges granted to others through the `WITH GRANT OPTION` clause are also revoked 

```sql
REVOKE {privilege [,privilege..]all}
ON    OBJECT
FROM   {user [,user...] | role | PUBLIC}

[CASCADE CONSTRAINTS];
```


Example: 
Revoke the `SELECT `and `INSERT `privileges given to the` jayvee` user on the `DEPARTMENTS` table

```sql
REVOKE  SELECT, INSERT
ON      departments
FROM    jayvee;
```




----
### References

Module 7 - Data Control Language PPT