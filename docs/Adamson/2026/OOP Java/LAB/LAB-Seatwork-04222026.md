
# LAB  Seatwork 04222026

2026-04-22 13:18

Tags: #java 

Author:  Duke Hsu

---

## Key takeaways

- Create a Students class using Encapsulation concept .
- Declare class attributes as `private`
- Provide `public` Getter and Setter methods to access and update the value of `private` attributes
- Keep the method focused (Using setter methods to process data and validate user input. )
- Clean / Organized  


### Main Class

```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package prjencapsulation;
import java.util.Scanner;
/**
 * @author dukehsu
 * Student Name: YongLou, Xu
 */
public class PrjEncapsulation {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);
        
        //constructor  a object 
        Students st1 = new Students();
        
        //ask user input data using setter method upadte data
        System.out.print("Plz enter student Name: ");
        String stName = sc.nextLine();
        st1.setName(stName);
        
        System.out.print("Enter age: ");
        int stAge = sc.nextInt();
        sc.nextLine();
        st1.setAge(stAge);
         
        System.out.print("Enter course: ");
        String stCourse = sc.nextLine();
        st1.setCourse(stCourse);
        
        System.out.print("Enter grade: ");
        double stGrade = sc.nextDouble();
        sc.nextLine();
        st1.setGrade(stGrade);
        
        //display data
        st1.displayInfo();
        
        sc.close();
    }
    
}

```


### Students Class

```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prjencapsulation;
import java.util.Scanner;
/**
 *
 * @author dukehsu
 * Student Name: YongLou, Xu
 */
public class Students {
    
    Scanner sc = new Scanner(System.in);
    
    //private attributes (data hiding, keep data safe) 
    private String name;
    private String course;
    private double grade;
    private int age;
    
    //method to display student information  - call getter methods
    public void displayInfo(){
        
        System.out.println("\n --- Student Information ---");
        System.out.println("Name: " + getName());
        System.out.println("Age: " + getAge());
        System.out.println("Course: " + getCourse());
        System.out.println("Grade: " + getGrade());
        
        //condition for check grade status
        if(grade >= 75){
            System.out.println("Status: Passed");
        }else {
            System.out.println("Status: Failed");
        }
    }
    
    
    //---------------------------- GETTER ------------------------------
    //public methods - getter from name,course,grade,age and return data
    public String getName(){
        return name;
    } 
    
    public String getCourse(){
        return course;
    }
    
    public double getGrade(){
        return grade;
    }
    
    public int getAge(){
        return age;
    }
    
    //---------------------------- SETTER -------------------------------
    //public methods - setter for name,course, grade, age, and update data
    public void setName(String name){
        
        //using while loop to check user input data
        while(name == null || name.trim().isEmpty()){ 
            System.out.println("Invalid name, Name cannot be empty.Plz try again");
            name = sc.nextLine();
        }
        this.name = name;

    }
    
    public void setCourse(String course){
        //using while loop to check user input data
        while(course == null || course.trim().isEmpty()){ 
            System.out.println("Invalid course. Course cannot be empty. Plz try again");
            course = sc.nextLine();
        }
        this.course = course;
    }
    
    // Student name: YongLou, Xu
    public void setGrade(double grade){
        
        //using while loop to check user input data
        while(grade < 0 || grade > 100){
            System.out.println("Invalid grade. Grade must be between 0 and 100. Plz try agian");
            grade = sc.nextDouble();
        }
        this.grade = grade;
    }
    
    public void setAge(int age){
        // using while loop to check user input data
        while(age <=0 || age >=100){
            System.out.println("Invalid age input, Age must be greater than 0 and lower than 100.Plz try again ");
            age = sc.nextInt();
        }
        this.age = age;
    }
}

```


----
## References
