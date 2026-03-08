
# Activity: Laboratory Activity#1 (Midterm)

2026-03-05 15:27

Tags:  #java 

Author:  Duke Hsu

---

## Topic

- while loop
- if-else
- Scanner
- Method


```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package studentrecordsys;
import java.util.Scanner;
/**
 *
 * @author dukehsu
 */
public class StudentRecordSys {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);  
        
        //create a object of student named duke
        Student duke = new Student();
        
        //while loop
        while(true){
            
            //call infoInput() method
            duke.infoInput(scanner);
            
            //next line and ask user input 
            System.out.println();
            System.out.println("Do you want to another student? (y/n): ");
            String input = scanner.nextLine();
            
            // or condition 
            if(input.equals("y") || input.equals("yes")){
                 //next line
                 System.out.println(); 
                 
                 //and continue
                 continue;
                 
            }else{
                
                //if user input n,  call summarize 
                duke.summarizeStudent(); 
                break; //stop while loop
                
            }//end of if-else
            
        }//end of while loop      
    }//end of main method
    
}


//create a Student class
class Student{
    
    //class Student attributes
    String name;
    double score;
    int studentCount;
    int passedStudent = 0;
    int failedStudent = 0;

    
    //infoInput method parameter Scanner
    public void infoInput(Scanner scanner){
        
        
        //ask user input name and score
        System.out.print("Enter student name: ");
        name = scanner.nextLine();

        System.out.print("Enter score: ");
        score = scanner.nextDouble();
        scanner.nextLine();
 
        //check score
        checkGrade(score);
        
        //studentCount +1 
        studentCount++;

    }//end of infoInput()
    
    
    //checkGrade method parameter stScore
    public void  checkGrade(double stScore){
        
        //assign parameter values to class attributes ​
        score = stScore;
        
        //condition check 
        if(score >= 90){
            System.out.println("Grade Remark: Excellent");
            
            //passedStudent + 1
            passedStudent++;
        }else if(score >= 80){
            System.out.println("Grade Remark: Very Good");
            
            //passedStudent + 1
            passedStudent++;
        }else if(score <70){
            
            System.out.println("Grade Remark: Failed");
            failedStudent++;
        }//end of if-else-if
        
    }//end of checkGrade()
    
    
    
    //summarizeStudent method
    public void summarizeStudent(){
        
        
        //print summarize information
        System.out.println();
        System.out.println("===== SUMMARY =====");
        System.out.println("Total Students: "+ studentCount);
        System.out.println("Passed: " + passedStudent);
        System.out.println("Failed: "+ failedStudent);

    }//end of summrizeStudent

}//end of Student class
```








----
### References
