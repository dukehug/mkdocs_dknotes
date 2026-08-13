

# LAB  Activity  03042026

2026-03-01 01:06  

update 2026-03-5 15:27


Tags: #java 

Author:  Duke Hsu

---


```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

package CampusInfo;
import java.util.Scanner;
/**
 *
 * @author dukehsu
 */
public class CampusInfo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner userInput = new Scanner(System.in);
        
        Students duke = new Students();
        
        System.out.print("Plz enter your Name: ");
        duke.name = userInput.nextLine();
        
        
        System.out.print("Plz enter your age: ");
        duke.age = userInput.nextInt();
        
        System.out.print("Perlim Grade: ");
        double pGrade = duke.perlimGrade = userInput.nextDouble();
        
        
        System.out.print("Midtrem Grade: ");
        double mGrade = duke.midtrmGrade = userInput.nextDouble();
        
        System.out.print("Final Grade: ");
        double fGrade = duke.finalGrade = userInput.nextDouble();
        
        System.out.println();
        System.out.println();
        
        double avgGrade = duke.computeAverge(pGrade, mGrade, fGrade);
        
        System.out.println("Aveger Grade is:  "+ avgGrade);
        
        
        if(avgGrade >= Students.PASSING_GRADE){
            System.out.println("PASSED");
        }else{
            
            System.out.println("FAILED");
        }
        
    }
    
}

class Students{
    
    String name;
    int age;
    double perlimGrade;
    double midtrmGrade;
    double finalGrade;
    
    static final double PASSING_GRADE = 75.0;
    
    public double computeAverge(double pGrade,double mGrade, double fGrade){
        
        perlimGrade = pGrade;
        midtrmGrade = mGrade;
        finalGrade = fGrade;
        
        double avgGrade  = (perlimGrade + midtrmGrade + finalGrade) /3;
        
        return avgGrade;
    }

}
```







----
### References
