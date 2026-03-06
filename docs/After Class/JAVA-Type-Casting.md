
# JAVA Type Casting - (Data type convert)

2026-03-04 09:46

Tags: #java  

Author:  Duke Hsu

---

## Key Concept 

Type casting means converting one data type into another. For example, turning an `int `into a `double` .

In Java, there are two main types of casting:

- Widening Casting(automatic) - Converting a smaller type to a larger type size 
	`byte` -> `short` -> `char` -> `int` -> `long` -> `float` -> `double`

- Narrowing Casting(manual) - Converting a larger type to a smaller type size
	`double` -> `float` -> `long` -> `int` -> `char` -> `short` -> `byte`


## Code Example

Widening Casting - Smaller to Larger- Automatic 

```java

int myInt = 9;

double myDouble = myInt; // smaller type to a larger type: int to double

System.out.println(myInt); //outputs 9


//small to lartge, automatic 
System.out.println(myDouble); //outputs 9.0

```

Narrowing Casting - Larger to Smaller - Manual 

```java

double myDouble = 9.78d;
int myInt = (int) myDouble; // manual casting: double to int , larger to smaller 

System.out.println(myDouble); //ouputs 9.78

System.out.println(myInt); // outputs 9
```


`float` and ` double `data type

- The double data type has higher precision than the float data type .

!!!note
	In Java, the double data type provides higher precision than float.


```java

double myDouble = 3.14159265358d;
float myFloat = 3.14159265358f;

System.out.prinln(myDouble); //outputs 3.14159265358
System.out.println(myFloat); //outputs 3.1415927

```



## Real-Life Example

Gross profit margin 

```java

int salesIncome = 5500;
int salesCosts = 3500;


// large data type to small
double grossProfit = (double)salesIncome / salesCosts * 100.0d

System.out.println("The Gross profit margin is : "+ grossProfit); //The Gross profit margin is : 157.14285714285714

```







----
### References

 Java Type Casting - [https://www.w3schools.com/java/java_type_casting.asp](https://www.w3schools.com/java/java_type_casting.asp)