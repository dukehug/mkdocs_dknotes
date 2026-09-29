
# Module-5-Database-Design-MySQL

2026-09-08 13:08

Tags: #ADET 

Author:  Duke Hsu

---
## Topic 

1. Database Concepts
2. ERD
3. Normalization
4. PHP-MySQL Connection
5. CRUD


## 1. Database

A database is an organized collection of data that can be easily accessed , managed, and updated. It allows applications to store and retrieve information efficiently.

- Organized Data
	- Stores data in tables with rows and columns
- Centralized
	- One place to manage all application data
- Efficient Access
	- Fast search, insert, update, and delete




## 2. Important Database Concepts

- Table
- Row
- Column
- Primary Key
- Foreign Key 
- SQL 



## 3. MySQL

- Free and Open Source
- Reliable
- Fast Performance
- Works with PHP



## 4. ERD (Entity Relationship Diagram)

An ERD is a visual representation of how data is structured. It shows entities (tables) their attributes(columns), and the relationships between them. 

- Entity 
- Attribute
- Relationship
- Primary Key
- Foreign Key
- Composite Key

## 5. Normalization 

Process of organizing data in a database to reduce  redundancy and improve data integrity. It divides large tables into smaller, related tables. 

- 1NF: Eliminate repeating groups. Each cell should have a single
- 2NF: Remove partial dependencies. All non-key columns depend on the whole primary  
key
- 3NF: Remove transitive dependencies. Non-key columns should not depend on other non-  
key columns

### 5.1 Benefits of Normalization 

- Reduces Data Redundancy
- Easier Maintenance
- Saves Storage Space
- Improves Data Integrity
- Better Organization
- Supports Scalability 



## 6. PHP-MySQL Connection

PHP supports two main extensions for working with MySQL databases

- MySQLi(MySQL Improved)
- PDO(PHP Data Objects)

### 6.1 Example - MySQLi Object-Oriented

```php
<?php  
$servername = "localhost";  
$username = "username";  
$password = "password";  
$dbname = "mydb";  
  
// Create connection  
$conn = new mysqli($servername, $username, $password, $dbname);  
  
// Check connection  
if ($conn->connect_error) {  
  die("Connection failed: " . $conn->connect_error);  
}  
echo "Connected successfully";  
?>
```


### 6.2 Example - MySQLi Procedural 

```php
<?php  
$servername = "localhost";  
$username = "username";  
$password = "password";  
$dbname = "mydb";  
  
// Create connection  
$conn = mysqli_connect($servername, $username, $password, $dbname);  
  
// Check connection  
if (!$conn) {  
  die("Connection failed: " . mysqli_connect_error());  
}  
echo "Connected successfully";  
?>
```


### 6.3 Example - PDO

```php
<?php  
$servername = "localhost";  
$username = "username";  
$password = "password";  
$dbname = "mydb";  
  
try {  
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);  
  // set the PDO error mode to exception  
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  
  echo "Connected successfully";  
} catch(PDOException $e) {  
  echo "Connection failed: " . $e->getMessage();  
}  
?>
```


----
## References

[https://www.w3schools.com/php/php_mysql_connect.asp](https://www.w3schools.com/php/php_mysql_connect.asp)

