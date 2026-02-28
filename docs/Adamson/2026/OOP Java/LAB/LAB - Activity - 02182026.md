2026-02-18 17:03

Tags: #java 

Author:  Duke Hsu

---
## LAB - Activity - 02182026

### Types of Functions

1. Method with No parameters & No return values
2. Method with parameters & No return values
3. Method with return values & No parameters
4. Method with return values & parameters

### Concepts

- parameters
**Use parameters when you define a method.**


- arguments
**Use arguments when your object calls a method with parameters.**  
**Get the argument from input or return it.**

- return 
**The return value is not the same as printing out results.**  
**When you want the return values to be printed out, you should assign a variable to this object's methods.**


- constructor 
**When you create a new object, the class method will construct it.**

- object
**An object is an entity.**

- instantiate
**To instantiate means to create a new object.**

- rename class (refactor)
**Use refactoring to rename the class.**


- scanner 
**A scanner accepts user input in the form of text, integers, or data.**

###  Syntax

```java
accessModifier  class className{

	//attributes
	//if no accessModifier , ther defualt is public 
	accessModifier data_type  attributesName =  attributesValues;	
	
	//methods no return 
	accessModifier void methodName(){
		//method block
		
		System.our.println("Hello World");
	
	}
	
	
	//method with parameter and return 
	accessModifier String methodName(int studID, String studName, dataType attributes){
	
	
		//assign parameter values to class attributes ​
		studentID = studID;
		studentName = studName;
		class_attributes  = method_parameters;
	
		
		//method block
		
		System.our.println("Hello World");
		
		return "The values " +studentID+ "."
	
	}
	

}
```





### Code block 

#####  Method with No parameters & No return values


```java
/*​
* Click
nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to
change this license​
* Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit
this template​
*/​
package prjmyfirstclass;​
​
/**​
*​
* @author student​
*/​
public class PrjMyFristSampleClass {​
	/**​
	* @param args the command line arguments​
	*/​
	public static void main(String[] args) {​
		// TODO code application logic here​
		​
		//instantiate the object ​
		Student athlete = new Student(); //student() is the constructor​
		​
		​
		//send a message to call displayInformation() - object.method -call method​
		athlete.displayInformation();​
	}//end of main method​
	
}//end of main class​
​
​
​
//class Student for object later - blue print //class Student for object later - blue print ​

class Student{​
​
	//attributes accessModifier - dataType - attributesName ; ​
	//use accessmodifier protected the attributes​
	private int studentID = 0;​
	private String studentName = "";​
	private String studentCourse = "";​
​
	//methods no parameter and no return - no need attributes from other method ​
	public void displayInformation(){​
	​
		//assign values​
		//method local attributes​
		studentID = 20251234; ​
		studentName = "YongLou, Xu";​
		studentCourse = "BSIT";​
	​
		//condition - compare dealer variable or class attributes​
		if(studentID == 20251234){​
			​
			//print out - new line​
			System.out.println("The student enrolled is: "+​
			studentName + ", with the student number: "+​
			studentID + " and course: "+​
			studentCourse + "."); //from student class attributes​
		​
		}//end of if​
		else{​
			System.out.println("No enrolled student with student number: "​
			+ studentID);​
			}//end of else​
		}//end of displayInformation method with out parameter and no return value​
}
```

#### Method with parameters & No return values

`main` method

```java
//main method

public class PrjMyFristSampleClass {​
		/**​
		* @param args the command line arguments​
		*/​
		public static void main(String[] args) {​
			// TODO code application logic here​
			​
			//instantiate the object ​
			Student athlete = new Student(); //student() is the constructor​
			​
			//send a message to call displayInformation() - object.method -
			call method​
			//athlete.displayInformation(); ​
			​
			​
			//call method with arguments ​
			athlete.displayInformation(202215568, "YongLou, Xu", "BSIT");​​
		}//end of main method​
}//end of main class​
```


`displayInfomation` method 

```java
//over loading ​
//methods with parameter and no return​
public void displayInformation(int studID, String studName, String
studCourse){​
​
	//assign parameter values to class attributes​
	studentID = studID;​
	studentName = studName;​
	studentCourse = studCourse;​
	​
	​
	//condition - compare dealer variable or class attributes​
	if(studentID == 202215568){​
		​
		//print out - new line​
		System.out.println("The student enrolled is: "+​
		studentName + ", with the student number: "+​
		studentID + " and course: "+​studentCourse + "."); //from student class
		attributes​
		​
	}//end of if​
	else{​
		System.out.println("No enrolled student with student number: "​
		+ studentID);​
		}//end of else​
	}//end of displayInformation(parameter) method with parameter and noreturn value​
​
​
}
```


####  Method with return values & No parameters
 
`main` method

```java
public class PrjMyFristSampleClass {​
/**​
* @param args the command line arguments​
*/​
	public static void main(String[] args) {​
		// TODO code application logic here​
		​
		//instantiate the object ​
		Student athlete = new Student(); //student() is the constructor​
		​
		/*call have return value method​
		store return values and received it to message variable*/​
		String messages = athlete.enroll();​
		System.out.println(messages);​
		​​
	}//end of main method​
}//end of main class
```

`enroll `method

```java

//need return , so the method data type is String 

public String enroll(){
	//assign values to class attributes ​
	studentID = 202215568;​
	studentName = "YongLou,Xu";​
	studentCourse = "BSIT";​
​
	//return message​
	return "The student: "+ studentName + ​
	" with student name: " + studentID +​
	" and course: " + studentCourse +​
	" was enrolled.";​
}//end of enroll method - with return values
```


#### Method with return values & parameters

`main `method

```java

//don't forget import the package
import java.util.Scanner; 



public class PrjMyFristSampleClass {​
	/**​
	* @param args the command line arguments​
	*/​
	public static void main(String[] args) {​
		// TODO code application logic here​
		​
		//instantiate the object ​
		Student athlete = new Student(); //student() is the constructor​
		​​​
		/*ask user inputs for student ID, name and courses*/​
		​
		int studID = 0;​
		String studName="";​
		String studCourse="";​
		​
		//scanner class​//instantiate a Scanner object for user input​
		Scanner input = new Scanner(System.in);​
		​
		//reminder user input​
		System.out.print("Enter your student ID: ");​
		studID = input.nextInt();
		//next line​
		input.nextLine();
		​
		​
		//name input​
		System.out.print("Enter your student Name: ");​
		studName = input.nextLine();​
		​
		// course input​
		System.out.print("Enter your Course: ");​
		studCourse = input.nextLine();​
		​
		//send message to call the enroll() with passed argument for the
		parameter​
		String message = athlete.enroll(studID, studName, studCourse);​
		System.out.println(message);​
		​
		​
	}//end of main method​
}//end of main class
```


`enroll `method 

```java

//method with parameter and return values​
public String enroll(int studID, String studName, String studCourse){
	
	//assign parameter values to class attributes
	studentID = studID;
	studentName = studName;
	studentCourse = studCourse;
	
	//return message​
	return "The student: "+ studentName + ​
			" with student name: " + studentID +​
			" and course: " + studentCourse +​
			" was enrolled.";​
}
```








----
### References

Instructor’s In-Class Demonstration
OOP - Module 2. Object Oriented Programming Fundamentals part 2.pptx