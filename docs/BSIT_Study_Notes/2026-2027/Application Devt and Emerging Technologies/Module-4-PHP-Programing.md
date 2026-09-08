
# Module - 4   PHP  Programing

2026-09-08 11:53

Tags: #ADET 

Author:  Duke Hsu

---

## Topic 

1. PHP 
2. PHP Syntax
3. PHP Frameworks

## 1. PHP 

PHP is a server-side scripting language , commonly used to create dynamic and interactive websites. 

![php-server-side.png](https://img.dukehsu.com/study_note/20260908120833350.webp)

- Hypertext Preprocessor 
- Runs mainly on the web server
- Generates dynamic HTML Content 
- Works well with databases such as MySQL
- Open source server-side scripting language 
- File extension `.php`


### 1.1 What Can PHP Do?

- PHP can generate dynamic page content
- PHP can create, open, read, write, delete, and close files on the server
- PHP can collect form data
- PHP can send and receive cookies
- PHP can add, delete, modify data in your database
- PHP can be used to control user-access
- PHP can encrypt data

With PHP you are not limited to output HTML. You can output images or PDF files. You can also output any text, such as XHTML and XML.


## 2. PHP Syntax 

A PHP script start with `<?php` and ends with `?>`

```php
<?php
	//php code goes here 
?>
```

### 2.1. Comments in PHP 

Single-line comments 

```php
<?php
	//this is a single-line comment
	#this is also a single-line comment
	echo 'Hello World!';
	/*
		this is a multi-line comment
	*/
?>
```

### 2.2 Variables

- Variables are "containers" for storing information 

- A variable can have a short name (like `$x` and `$y`)  or a more descriptive name (`$age` , `$name`)

**Rules  for PHP variables :**

- must start with the `$` sign 
- must start with a letter or the underscore character
- variable name cannot start with a number
- variable name can only contain alpha-numeric characters and underscores (A-z, 0-9, and _ )
- case-sensitive (`$age`and `$AGE` are two different variables)

```php
<?php

//variable
$name = "Duke";

echo 'Hello, $name'; #output 
?>
```


### 2.3 Data Types 

Variables can store data of different types, and different data types can do different things. 

PHP supports the following data types:

- string(text value)
- int(whole numbers)
- float(decimal numbers)
- bool(true of false)
- array(multiple values)
- object(stores data as objects)
- null(empty variable)
- resource(reference external resources)

```php
<?php
// check data types
$x = 5;

var_dump($x); //dump int(5)


$y = "duke";

var_dump($y); //dump  string(4)


?>
```

### 2.4 Operators 

Operators are special symbols used to perform operations on variables and values. 

#### PHP Arithmetic Operators

The arithmetic operators are used with numeric values to perform common mathematical operations, such as addition, subtraction, multiplication etc.

| Operator | Name           | Example  | Result                                  |
| -------- | -------------- | -------- | --------------------------------------- |
| +        | Addition       | $x + $y  | Sum of $x and $y                        |
| -        | Subtraction    | $x - $y  | Difference of $x and $y                 |
| *        | Multiplication | $x * $y  | Product of $x and $y                    |
| /        | Division       | $x / $y  | Quotient of $x and $y                   |
| %        | Modulus        | $x % $y  | Remainder of $x divided by $y           |
| **       | Exponentiation | $x ** $y | Result of raising $x to the $y'th power |
#### PHP Assignment Operators

The assignment operators are used with numeric values to assign values to variables.

| Assignment | Same as...   | Description                                                                  |
| ---------- | ------------ | ---------------------------------------------------------------------------- |
| $x = $y    | $x = $y      | Assign (the left operand is set to the value of the expression on the right) |
| $x += $y   | $x = $x + $y | Add and assign                                                               |
| $x -= $y   | $x = $x - $y | Subtract and assign                                                          |
| $x *= $y   | $x = $x * $y | Multiply and assign                                                          |
| $x /= $y   | $x = $x / $y | Divide and assign                                                            |
| $x %= $y   | $x = $x % $y | Modulus and assign                                                           |


#### PHP Comparison Operators

The comparison operators are used to compare two values (number or string) and return a boolean result.

| Operator | Name                     | Example   | Result                                                                                                                                            |
| -------- | ------------------------ | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| ==       | Equal                    | $x == $y  | Returns true if $x is equal to $y                                                                                                                 |
| ===      | Identical                | $x === $y | Returns true if $x is equal to $y, and they are of the same type                                                                                  |
| !=       | Not equal                | $x != $y  | Returns true if $x is not equal to $y                                                                                                             |
| <>       | Not equal                | $x <> $y  | Returns true if $x is not equal to $y                                                                                                             |
| !==      | Not identical            | $x !== $y | Returns true if $x is not equal to $y, or they are not of the same type                                                                           |
| >        | Greater than             | $x > $y   | Returns true if $x is greater than $y                                                                                                             |
| <        | Less than                | $x < $y   | Returns true if $x is less than $y                                                                                                                |
| >=       | Greater than or equal to | $x >= $y  | Returns true if $x is greater than or equal to $y                                                                                                 |
| <=       | Less than or equal to    | $x <= $y  | Returns true if $x is less than or equal to $y                                                                                                    |
| <=>      | Spaceship                | $x <=> $y | Returns an integer less than, equal to, or greater than zero, depending on if $x is less than, equal to, or greater than $y. Introduced in PHP 7. |

#### PHP Increment / Decrement Operators

The increment/decrement operators are used to increment or decrement a variable's value by one.

| Operator | Same as...     | Description                           |
| -------- | -------------- | ------------------------------------- |
| ++$x     | Pre-increment  | Increments $x by one, then returns $x |
| $x++     | Post-increment | Returns $x, then increments $x by one |
| --$x     | Pre-decrement  | Decrements $x by one, then returns $x |
| $x--     | Post-decrement | Returns $x, then decrements $x by one |

#### PHP Logical Operators

The logical operators are used to combine conditional statements and return a boolean result.

| Operator | Name | Example   | Result                                        |
| -------- | ---- | --------- | --------------------------------------------- |
| and      | And  | $x and $y | True if both $x and $y are true               |
| or       | Or   | $x or $y  | True if either $x or $y is true               |
| xor      | Xor  | $x xor $y | True if either $x or $y is true, but not both |
| &&       | And  | $x && $y  | True if both $x and $y are true               |
| \|       | Or   | $x \| $y  | True if either $x or $y is true               |
| !        | Not  | !$x       | True if $x is not true                        |


more : [https://www.w3schools.com/php/php_operators.asp](https://www.w3schools.com/php/php_operators.asp)

### 2.5. Condition `if / else`

The `if / else` statement executes some code if a condition is true and another code if that condition is false. 

Syntax 1 

```php
<?php

$x = 5;

	if ($x > "1"){
		echo "I love you !";
	}else{
		echo "You are a good person";
	}

?>
```

Syntax 2  `if / elseif / else`

```php
<?php
$t = date("H");

	if ($t < "10") {
	  echo "Have a good morning!";
	} elseif ($t < "20") {
	  echo "Have a good day!";
	} else {
	  echo "Have a good night!";
	}
?>
```

### 2.6  Switch  

The [switch](https://www.w3schools.com/php/keyword_switch.asp) statement is used to perform different actions based on different conditions.

Use the `switch` statement to **select one of many blocks of code to be executed**

```php
<?php
$favcolor = "red";

	switch ($favcolor) {
	  case "red":
	    echo "Your favorite color is red!";
	    break;
	  case "blue":
	    echo "Your favorite color is blue!";
	    break;
	  case "green":
	    echo "Your favorite color is green!";
	    break;
	  default:
	    echo "Your favorite color is neither red, blue, nor green!";
	}
?>
```

This is how it works:

- The _expression_ is evaluated once
- The value of the expression is compared with the values of each case
- If there is a match, the associated block of code is executed
- The [break](https://www.w3schools.com/php/keyword_break.asp) keyword breaks out of the switch block
- The [default](https://www.w3schools.com/php/keyword_default.asp) code block is executed if there is no match

### 2.7 Loops

PHP loops are used to execute the same block of code again and again, as long as a certain condition is true.

In PHP, we have the following loop types:

- [while](https://www.w3schools.com/php/php_looping_while.asp) - loops through a block of code as long as the specified condition is true
- [do...while](https://www.w3schools.com/php/php_looping_do_while.asp) - loops through a block of code once, and then repeats the loop as long as the specified condition is true
- [for](https://www.w3schools.com/php/php_looping_for.asp) - loops through a block of code a specified number of times
- [foreach](https://www.w3schools.com/php/php_looping_foreach.asp) - loops through a block of code for each element in an array

### 2.8 Functions 

- Reusable blocks of code
- Can receive parameters
- Can return a value
- Improve organization and reduce repetition 

```php
function functionName($parameter1, $parameter2) {
  // code to be executed
  return $value; // optional
}
```

Parameters

```php
function familyName($fname) {
  echo "$fname Refsnes.<br>";
}

familyName("Jani");
familyName("Hege");
familyName("Stale");
familyName("Kai Jim");
familyName("Borge");
```

### 2.9 Error Handling 

Error handling in PHP is simple. An error message with filename, line number and a message describing the error is sent to the browser.

```php
<?php  
//error handler function  
function customError($errno, $errstr) {  
  echo "<b>Error:</b> [$errno] $errstr";  
}  
  
//set error handler  
set_error_handler("customError");  
  
//trigger error  
echo($test);  
?>
```

Output 
`Error: [8] Undefined variable: test`

### 2.10 PHP Form Handling

The PHP superglobals `$_GET` and `$_POST` are used to collect form-data


HTML file
```html
<html>
<body>

<form action="welcome.php" method="post">
Name: <input type="text" name="name"><br>
E-mail: <input type="text" name="email"><br>
<input type="submit">
</form>

</body>
</html>
```

PHP file 

```php
<html>
<body>

Welcome <?php echo $_POST["name"]; ?><br>
Your email address is: <?php echo $_POST["email"]; ?>

</body>
</html>
```

## 3.0 PHP  Frameworks 

PHP frameworks are pre-built collections of libraries, components, and tools that help developers build web applications more quickly , securely, and efficiently.

Most major PHP frameworks rely on the Model-View-Controller(MVC) architecture, which separates your application's data(Model), user interface(View), and background logic(Controller) to keep code clean and organized

### 3.1  PHP with HTML Form Workflow

- User fills out form 
- Browser submits data
- PHP receives input
- PHP validates data
- PHP process data
- Database stores data
- HTML / Browser returns a result 

### 3.2 PHP Framework 

The Top PHP Frameworks

| Framework          | Best For                                          | Market Share / Standing    | Core Strengths                                                                                                      |
| ------------------ | ------------------------------------------------- | -------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Laravel**        | Rapid development, startups, and general web apps | **~44.6%** (Market Leader) | Extremely developer-friendly, huge ecosystem (Laracasts), elegant syntax, and automated tooling (Artisan CLI).      |
| **Symfony**        | Large-scale, complex enterprise applications      | **~10%**                   | High performance, deeply modular, reusable components used by other software like Drupal and Composer.              |
| **CodeIgniter**    | Beginners and lightweight, fast deployment        | **~6%**                    | Remarkably small footprint (~2MB installation), minimal configuration required, and excellent speed out of the box. |
| **Yii (Yii2)**     | High-performance and secure data-heavy apps       | **~14.1%**                 | Built-in Gii code generator, strong security features (RBAC), and excellent caching tools.                          |
| **Laminas (Zend)** | Enterprise-level and object-oriented systems      | **~12.4%**                 | Strict adherence to PHP standards (PHP-FIG), corporate-friendly, highly secure, and deeply customizable.            |

----
## References

[https://www.plus2net.com/php_tutorial/php_introduction.php](https://www.plus2net.com/php_tutorial/php_introduction.php)

[https://www.w3schools.com/php/default.asp](https://www.w3schools.com/php/default.asp)
