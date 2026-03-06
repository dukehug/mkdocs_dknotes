
# Module 4 Control Structures Conditional Statements

2026-03-05 14:13

Tags:  #java 

Author:  Duke Hsu

---

## Key concepts

- Conditional Statements
	
	Conditional statements allow a program to make decisions based on conditions. In Object-oriented programming , they are commonly used inside methods of a class to control object behavior 	


-  if Statement

	Executes a block of code if a condition is true 

-  if-else if-else statement
	
	Used when checking multiple condition (more than 2 ), conditions are checked from top to bottom, once one condition is true, the rest are skipped. 
		

-  Switch statement

	Best used when comparing one variable to multiple fixed values 
	- Variable can be: int, char, String, enum
	- break prevents fall-through
	- default is optional but recommended 

-  Nested if statement 

	A nested if statement is an if statement placed inside another if statement. 
	It is used when: 1. A second condition must be checked only if the first condition is true.
	2 . you need multiple levels of decision-making. 3. you are validating conditions step-by- step .

-  if -else statement

	Executes one block if true, another if false 


## Real-Life Example


```java

//if statement
boolean isRaining = true;

if (isRaining){
	
	System.out.println("Bring an umbrella!");

}


//if-else
int weather = 1; //1= sunny, 2 = raining, 3 = cloudy

if (weather == 1){
	
	System.out.println("We are going to park~!");

}else {

	System.out.println("We stay home");
}




//if-else if 
int grade = 70;
if(grade >= 90){
	
	System.out.println("You are super smart");

} else if(grade >=80) {
	
	System.out.println("Very Good");

}else if(grade >=70){

	System.out.println("You are good"):
}else{

	System.out.println("You are not bobo, but u need hard learning!");
}


//netsted if 

int age == 16;

boolean haveNationalID = true;


if(age >= 18){
	System.out.println("Old enough to work~");
	
	if(haveNationalID){
		
		System.out.println("And you have national ID, You can get a job");
	
	}else{
		
		System.out.prinln("You must get national ID first !~");
	
	}

}else{
	
	System.out.println("Hey, you should go back to your home ~!");
}

```

## Switch Statements 

Instead of writing many `if...else `statements, you can use the `switch` statement.

Think of it like ordering food in a restaurant : if you choose A, you get pizza, if you choose B  , you get a burger.  otherwise , you get nothing . 

The `switch `statement selects one of many code blocks to be executed. 


Syntax

```java
switch(expression){
	case x:
		//code block
		break;
	
	case y:
		//case y block
		break;
	
	default:
		//default code block 
}
```


Example: 

```java
int userChoose = 4;

switch (userChoose){
	case 1:
		System.out.println("Pizza~~");
		break;
	
	case 2:
		System.out.println("Burger");
		break;
	case 3:
		System.out.println("Coca cola");
		break;
	
	default:
		System.out.println("Service water");
}
```




----
### References


Module 4 PPT