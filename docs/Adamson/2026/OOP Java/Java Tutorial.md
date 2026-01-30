2025-12-25 15:43

Tags: #java 

---
Java Tutorial

```java
public class Main {
    public static void main(String[] args) {
        // println is new line
        String name = "Duke";
        System.out.println("Hello "+ name);
        System.out.println("Hava a good day !");
        System.out.println("Learning Java is fun !");

        // print  it does not insert a new line at end of output
        System.out.print("I will print on the same line");

        // println number 
        System.out.println(3);
        System.out.println(358);
        System.out.println(50000);

        // println with calculations
        System.out.println(3+5);
        System.out.println(2*5);
        System.out.println(3 % 7);

        // println variables - string
        String first_name = "Yonglou,";
        String last_name = " Xu";
        String full_name = first_name + last_name ; // "+" concatenation
        System.out.println(full_name);

        // println variables - int and calculations.
        int x = 5;
        int y = 2;

        System.out.println(x+y); //output 7
        System.out.println( x % y ); //print the value  x mod y output 1
        System.out.println("The sum is " + x + y); //print variables only  , output 52
        System.out.println("The sum is " + (x+y)); //print x add y , output 7

        // declare many variables 

        int a = 5, b =6, c = 60;
        System.out.println(a+b+c);

        int a_n = 5;
        int b_n = 6;
        int c_n = 60;
        System.out.println(a_n+b_n+c_n);

        int d,f,g;
        d=f=g=50;
        System.out.println(d+f+g);

        // multiple  string variables 
        String fst_name = "Duke",lst_name ="Hsu";
        System.out.println(fst_name + " " + lst_name);

        // identifiers - meanifull variables name

        int minutsPreHour = 60; //good
        int m = 60; // is okay ,but not good

        /*
        
        The general rules for naming variables are:

        Names can contain letters, digits, underscores, and dollar signs
        Names must begin with a letter
        Names should start with a lowercase letter, and cannot contain whitespace
        Names can also begin with $ and _
        Names are case-sensitive ("myVar" and "myvar" are different variables)
        Reserved words (like Java keywords, such as int or boolean) cannot be used as names
        */

        // final - constants 
        final long NAOTION_ID = 28556794410258L; //int can't display this variable
        final int BIRTHYEAR = 1998;

        // Example 
        String student_name = "Louis,Co";
        int  student_ID = 2022;
        int studen_age  = 25;
        float tuition_fee = 95550f;
        char student_grade = 'A';

        // println variables
        System.out.println(student_name);
        System.out.println(student_ID);
        System.out.println(studen_age);
        System.out.println(tuition_fee);
        System.out.println(student_grade);

        

    }
}

```







----
References: 
