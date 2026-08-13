

# Module 5 Control  Structures Loop Statement

2026-03-17 14:22

Tags: #java 

Author:  Duke Hsu

---

## Key Concepts

- Looping Statements 
	- A looping statements is a control structure that allows a block of code to be executed repeatedly as long as a condition is true, or until a certain limit is reached. 
	- Loops are useful when :
		- Displaying numbers in sequence
		- Computing totals
		- Processing multiple records
		- Repeating menu options
		- Iterating through arrays 
		- Applying operations to multiple objects

 - Three types of Loop Statement
	  - `for `loop statement
	  - `while` loop statement
	  - `do while` loop statement


## do while Loop Statement

Use a do while loop when:
- the program must run once before checking.
- repeating menu choices.
- prompting a user until valid input is given.

The ==do/while ==loop is a variant of the ==while== loop. This loop will execute the code block once, before checking if the condition is **true**. Then it will repeat the loop as long as the condition is **true**.

!!!note
	The semicolon `;` after the `while` condition is required!

**Syntax:** 
```java
do{
	//code block 
d
}while(condition); //don't forget ';'
```

Example:

```java
int = 0;

do{

	System.out.println(i);
	i++; //increasement
}while(i<5); //output 0,1,2,3,4
```


## while Loop Statement

- The while loop is used when the number of repetitions is not exactly know in advance. It continues as long as the condition remains true. 
- repetition depends on a condition 
- the number of repetitions is uncertain
- input validation or menu repetition is needed.

Syntax:

```java
while(condition){

	//code block 

}
```

Example:

```java
int countdown = 10;

while(countdown > 0){
	System.out.println(countdown);
	countdown--;
}

//when countdown < 0 , condition is false , then exit the while loop 
System.out.println("Happy New Year!!!");

```


## for Loop Statement

- The for loop is commonly used when the number of repetitions is already known.

- Initialization - sets the starting value   `i = 0;`
- Condition - checked before every repetition  `i<=5;`
- Update - changes the loop variable after each cycle(loop)`  i++ or i--`

In for loop, initialization only run once  , next loop is starts condition , if condition true, execute the code block . then update`(     increasement or decreasing  )` the loop variable

Syntax:

```java
for (initialization; condition; update){
	
	//code block

}
```


Example:

```java
for (int seat = 1; seat <=5; seat++){

	System.out.println("Seat number: " + seat);
}
```




----
### References

Module 5 - Control Structure - Loop statement.pptx 