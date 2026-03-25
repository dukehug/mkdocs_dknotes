
# Module 6 Arrays and Strings - Part 1

2026-03-25 20:34

Tags: #java 

Author:  Duke Hsu

---

## Arrays

Arrays are used to store multiple values in a single variable, instead of declaring separate variables for each value.

- One dimensional Array (one row of data )
- Multidimensional Array( multidimensional of data)
- In Java , arrays are designed to be homogeneous, meaning they can only store values of a single, consistent data type. 
- To declare an array, define the variable type with square brackets `[ ]`
- `{}` store elements
- `[]` declare array or array size
- `[][]` multidimensional array
- `,` use commas to separate the elements

## Three way to declaring Arrays 

### Declaring and Allocating Memory (Fixed Size)

- You can declare an array variable and then allocate memory for a specific, fixed number of elements using the `new` keyword.
- Elements are automatically initialized to default values 
- 0 for `int`, `null` for objects, `false` for boolean

!!! warning "Important Note"
	**In Java, once an array is defined, its size cannot be changed.**


Example: 

```java
//declaration; type[] arrayName;
int[] myNumbers;
//allocation: new type[size]
myNumbers = new int[5];
//combine declaration and cllocation in one line
String[] friends = new String[5];

//assign values to individual elements using their index (which starts at 0)
friends[0]="Alice";
friends[1]="Trump";
friends[2]="Elon";
friends[3]="KimChiu";
friends[4]="DukeHsu";
```


### Using an Array Initializer (Shortcut Syntax)

- You can use a shortcut syntax with curly braces`{}` .
- The size is automatically determined by the number of values provided .

Example:

```java
//the most comon and concise way
int[] grades = {90,80,75,66,85,92}; //array of length 6 or size

String[] seasons = {"Winter","Spring","Summer","Autumn"};// size 4


//u can also use the new keyword with the initializer list
double[] money = new double[] {55.4,63.2,100.0,25.5};

```

## Creating Multidimensional Arrays 

- Use multiple sets of square brackets `[] []`

Example: 

```java
//declare and allocate a 2D array (3rows, 4columns)
int[][] martix = new int [3][4];

//assign values to martix
martix[0][0] = 1;
martix[0][1] = 2;
martix[0][2] = 3;
martix[0][3] = 4;
martix[1][0] = 5;
martix[1][1] = 6;
martix[1][2] = 7;
martix[1][3] = 8;
martix[2][0] = 9;
martix[2][1] = 10;
martix[2][2] = 11;
martix[2][3] = 12;

//use for loop acces elements
  for(int i=0; i<martix.length; i ++){  //first loop is rows
    for(int j=0; j<martix[i].length; j++){
        System.out.println(martix[i][j]); //second loop is columns
    }
        
}//output 1-12



//Initialize a 2D array with velus
int[][] twoDarrays ={
	{1,2,3,4}, //use commas to separate the elements.
	{5,6,7,8},
	{9,10,11,12}
};

System.out.println(twoDarrays[0][2]); //output 3

```


Array table

| Columns | indx | 0   | 1   | 2   | 3   |
| ------- | ---- | --- | --- | --- | --- |
| Rows    | 0    | 1   | 2   | 3   | 4   |
|         | 1    | 5   | 6   | 7   | 8   |
|         | 2    | 9   | 10  | 11  | 12  |

## Create a Array of Object

Steps and Example:

**Step 1:** 

```java

//Student class
class Student{
	
	//attribute
	public String name;
	public int id;
	
	//constructor to initialize object attributes
	public Student(int id, String name){
		this.id = id;
		this.name = name;
	}
}
```

**Step 2 - 4:**

```java
public class ArrayOfObjectExample{
	public static void main(String[] args){
		//step 2 , declare and instantiate the array of object references
		//all set to null initially
		Student[] students = new Student[3] //4 is array students size 
		
		//step 3 , Initialize each element with an actual object
		students[0]=new Student(1,"DukeHsu"); //int id, String name
		students[1]=new Student(2,"Steven");
		students[2]=new Student(3,"Jayvee");
		
		// step 4, access and use the objects - for loop
		for(Student student: students){
			System.out.println("Student ID: "+student.id+ ", Student Name: " +student.name+" .")
		
		}
	}
	
}
```





----
### References
