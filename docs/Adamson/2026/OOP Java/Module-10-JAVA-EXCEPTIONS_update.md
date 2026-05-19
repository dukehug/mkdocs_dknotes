

# Module -10 Exceptions and File Handling

2026-05-07 13:00

Update: 05/18/2026 

Tags:  #java 

Author:  Duke Hsu

---

## 1.0 Exceptions / Error Handling  

Exception handling lets you catch and handle errors during runtime, so your program doesn't crash. 

Error management  / Error handling

## 1.1 `try `   and    `catch`

The `try` statement allows you to define a block of code to be tested for errors while it is being executed . 

The `catch` statement allows you to define a block of code to be executed, if an error occurs in the try block .

Therefor , `try`  and `catch`  keywords come in pairs.

**Syntax:**

```java
try{
	//block of code to try 
	

}catch(Exception e){
	//block of code to handle errors

}
```

**Example code:** 

```java
 public static void main(String[] args) {
        // TODO code application logic here
        try{
            int[] myNumbers = {1,2,3,4,5};
        
            int num_leng = myNumbers.length;

            System.out.println(myNumbers[num_leng -1]);

            System.out.println(myNumbers[10]);
        }
        catch (Exception e){
            System.out.println("Something error!!: " + e); //output: 
        
        }
        //5
		//Something error!!: 
		//java.lang.ArrayIndexOutOfBoundsException: Index 10 out of  bounds for length 5
```

## 1.2 `finally` Keyword

The `finally`  statement lets you execute code, after `try.....catch`,  regardless of the result 

The finally block code always will executed after `try.....catch`

```java
    public static void main(String[] args) {
        // TODO code application logic here
        try{
            int[] myNumbers = {1,2,3,4,5};
        
            int num_leng = myNumbers.length;

            System.out.println(myNumbers[num_leng -1]);

            System.out.println(myNumbers[10]);
        }
        catch (Exception e){
            System.out.println("Something error!!: \n" + e);
        
        }finally{
            System.out.println("The try catch is finished!");
        }
        
    }
    
```


## 1.3 `throw`  Keyword

The `throw` statement allows you create a customer error.

The `throw` statement is used together with an **exception type** . 

**Code Example:** 

```java
public class Main {

    static void checkAge(int age){
       if(age < 18){
        throw new ArithmeticException("You are not allowed- You musth be 18 years old!!");
       }
       else{
           System.out.println("Haha , welcome !!");
       }
    }
    
    public static void main(String[] args){
        
        checkAge(15);
    
    }

}
```


**Output:**

```

Exception in thread "main" java.lang.  

ArithmeticException: You are not allowed- You musth be 18 years old!! 


	at prjexceptions.PrjExceptions.checkAge(PrjExceptions.java:15)
	at prjexceptions.PrjExceptions.main(PrjExceptions.java:24)
/home/dukehsu/snap/netbeans/common/142/executor-snippets/run.xml:111: The following error occurred while executing this line:
/home/dukehsu/snap/netbeans/common/142/executor-snippets/run.xml:68: Java returned: 1
BUILD FAILED (total time: 0 seconds)
```


## 1.4 `throws` Keyword

It warns callers that they must prepare for specific checked exceptions.

Its primary use is for checked exceptions, which the java complier requires you to either handle with `try-catch` or declare with `throws`

### Code Example

```java
public void writeToFile() throws IOException{
    //logica that might cause an IOException
    FileWriter file = new FileWriter("data.txt");
}

public static void main(String[] args){
    try{
        writeToFile(); //caller musth handle the exception
    }catch (IOException e){
        System.out.println("Handled file error: " + e.getMessage());
    }
}
```



### throw vs throws



| Feature | throw                                    | throws                                               |
| ------- | ---------------------------------------- | ---------------------------------------------------- |
| Purpose | Used to explicityly trigger an exception | Used to declare that a method might throw exceptions |
| Locaton | Inside the method body                   | In the method signature                              |
| Quanity | Followed by a single instance            | Follorwed by a comma-separated list of classes.      |



## 1.5 Checked Exceptions and Unchecked Exceptions

### Checked Exceptions

How to handle: You must either catch it with a `try-catch` block it in the method signature using the `throws` keyword

- IOException
- FileNotFoundException
- SQLException
- ClassNotFoundException

### Unchecked Exceptions 

Also known as **Runtime Exceptions**

How to Handle: While not mandatory, you can still catch them. However, the best pracitce is to fix the underlying code logic to prevent them from occurring. 

- ArrayIndexOutOfBoundsException
- NumberFormatException
- ArithmetucException
- OutOfMemoryError

| Feature      | Checked Exception                                     | Unchecked Exception                         |
| ------------ | ----------------------------------------------------- | ------------------------------------------- |
| Check Time   | Compile-time                                          | Runtime                                     |
| Handling     | Mandatory: Must use `try-catch` or `throws`           | Optional: Not required by complier          |
| Hierarchy    | Subclasses of `Exception` (except `RuntimeException`) | Subclasses of `RuntimeException` or `error` |
| Common Cause | External factors (network, file system, DB)           | Programing errors (logical, nulls, math)    |

## 1.6  Custom Exception

A user-defined custom exception is an exception class created by the programmer to represent application-specific or business-specific error scenarios. 

**Examples of User-defined Exception:**
- Invalid bank transaction 
- Insufficient balance
- Age not eligible for registration
- Invalid login attempt

### Code Example

**Problem without custom exceptions**

```java
public class GFG{
	public static void main(String[] args){
		int age = 15;
		if(age < 18){
			System.out.println("Error");
		}
	}
}
//output: Error
```

Issues with this Approach:

- The error message is unclear
- No meaningful exception is thrown
- Difficult to debug in large applications.
- Business logic and error handling are mixed

**Create a User-Defined Custom Exception**

- Create a class extending Exception or RuntimeException
- Provide constructors with custom messages
- Optional: Add extra fields or methods

Checked Custom Exception 

- Create a class extending Exception

```java
//custom checked exception
class InvalidAgeException extends Exception {
	public InvalidAgeException(String m){
		super(m);
	
	}
}
```

- Using the custom exception 

```java
public class Geeks{
	public static void validate(int age)
		throws InvalidAgeException{
			if(age <18){
				throws new InvalidAgeException("Age must be 18 or above.");
			}
			System.out.println("Valid age: " + age);	
	}
}
```

```java
public static void main(String[] args){
	try{
		validate(12);
		
	}catch(InvalidAgeException e){
		System.out.println("Caught Exception: " + e.getMessage());
	}
}
```


## 2.0 Errors and Exception Types

The table below shows a list of common `Error` and `Exception` types in Java;

### Exceptions Table

| Error/Exception                 | Description                                                                    |
| ------------------------------- | ------------------------------------------------------------------------------ |
| ArithmeticError                 | Occurs when a numeric calculation goes wrong                                   |
| ArrayIndexOutOfBoundsException  | Occurs when trying to access an index number that does not exist in an array   |
| ClassNotFoundException          | Occurs when trying to access a class that does not exist                       |
| FileNotFoundException           | Occurs when a file cannot be accessed                                          |
| InputMissmatchException         | Occurs when entering wrong input(e.g. text in a numerical input)               |
| IOException                     | Occurs when an input or output operation fails                                 |
| NullPointerException            | Occurs when trying to access an object refrece that is null                    |
| NumberFormatException           | Occurs when it is not possible to convert a specified string to a numeric type |
| StringIndexOutOfBoundsException | Occurs when trying to access a character in a String that does not exist       |


## 3.0  Java File Handling

The `File`  class from the `java.io` package, allows us to work with files.
To use the `File` class, create an object of the class, and specify the filename or directory name. 

**Code Example: **

```java
import java.io.File;  //import the file class
File createTxt = new File("filename.txt"); //specify the file name
```

### 3.1  Create Files

In Java, you can create a new file with the `createNewFile()`  method from the `File` class.

This method returns:

- `true` - if the file was created successfully
- `false` - if the file already exists

!!! note "Tips"
	 Note that the method is enclosed in a `try....catch` block. This is necessary , because it throws an `IOException` if an error occurs (if the file cannot be created for some reason)

**Code Example:**

```java
import java.io.File; //import the file class
import java.io.IOException; // import IOException to handle error

public class CreateFile{
	public static void main(String[] args){
		try{
			File myObject = new File("java_file.txt");
			if(myObject.createNewFile()){
				System.out.println("File created : " + myObject.getName());
			}else{
				System.out.println("File already exists");
			}
		}catch(IOException e){
			System.out.println("An error occurred!!");
			e.printStactTrace();
		}
	}
}
```


The `createNewFile()`  method only create an empty file. it does not add any content inside. 

### 3.2 Write Files

In Java, you can use `FileWriter`  class  with its `write()` method to create and write some text into a file.

!!! warning "Warning"
	 When you are writer content done, you should close the writer with the `close()` method

**Code Example:**

```java
import java.io.FileWriter;
import java.io.IOException;

public class WriteToFile{
	try{
		FileWriter myWriter = new FileWriter("filename.txt");
		myWriter.write("File in Java might be tricky, but it isfun enough ");
		myWrite.close();// must close manualy
		System.out.println("Successfully wrote to the file");
	}catch (IOException e){
		System.out.println("An error occurred.");
		e.printStackTrace();
	}
}
```


### 3.3 Read Files

Open a file and get the data / content inside the file

#### Code Example:

```java
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class ReadFileExample{
	public static void main (String[] args){
		try{
			File file = new File("data.txt");
			
			Scanner reader = new Scanner(file);
			
			while(reader.hasNextLine()){
				
				String data = reader.nextLine();
				System.out.println(data);
			}
			reader.close();
		}catch(FileNotFoundException e){
			System.out.println("File not found!");
			e.printStackTrace();
		}
	}
}
```


Code Explanation:

- File > opens the file 
- Scanner > reads the content
- While(reader. hasNextLine()) > reads line by line
- close() > closes the reader



### 3.4 Delete Files

Remove a file permanently from the storage. 

#### Code Example:

```java
import java.io.File;

public class DeleteFileExample{
	public static void main(String[] args){
		File file = new File("data.txt");
		
		if(file.delete()){
			System.out.println("Deleted the file: " + file.getName());
		}else{
			System.out.println("Failed to delete the file.");
		}
	}
}
```




### 3.5 Get File Information

To get more information about a file, use any of the `File`  methods

**Code Example: **

```java
import java.io.File;

public class GetFileInfo{
	public static void main(String [] args){
		File myFile = new File ("filename.txt");
		if (myFile.exists()){
			System.out.println(myFile.getName()); //output file name
			System.out.println(myFile.getAbsolutePath()); //output file path
			System.out.println(myFile.canWrite()) //outpur true or false
			System.out.println(myFile.canRead()); //output true or false
			System.out.println(myFile.length()); //output file size int data type
		}
	
	}

}
```


----
## References

[https://www.w3schools.com/java/java_try_catch.asp](https://www.w3schools.com/java/java_try_catch.asp)

[https://www.w3schools.com/java/java_ref_errors.asp](https://www.w3schools.com/java/java_ref_errors.asp)

[https://www.w3schools.com/java/java_files.asp](https://www.w3schools.com/java/java_files.asp)

https://www.geeksforgeeks.org/java/user-defined-custom-exception-in-java/ 

[https://docs.oracle.com/javase/tutorial/essential/io/file.html](https://docs.oracle.com/javase/tutorial/essential/io/file.html)

