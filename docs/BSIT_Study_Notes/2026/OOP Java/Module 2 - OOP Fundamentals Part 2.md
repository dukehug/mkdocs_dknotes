2026-02-05 22:46

Tags: #java 

Author:  Duke Hsu

---
## Part 2 Topic 

1. Creating Class
2. Adding Class Attributes
3. Adding Methods
4. Instantiating Objects
5. Sending Messages

### Topic in the sample code

```java
public class PrjWritingCLass {
    public static void main(String[] args){
        Student duke = new Student();
        

        //with out parameter + with return values
        duke.enroll(20251266,"Louis Co","BS - CS"); //duke enrolled
        
        //whit parameter + no return values
        duke.displayInformation(20251266); //output duke information
        
        
        //with out return value 
        duke.enroll(); //no output 

        // no parameter , no return 
        duke.displayInformation(); //student ID = 20251234   print other information
    }
}

class Student{


    //attributes
    private int studentID = 0;
    private String name = "";
    private String course = "";


    //method with out parameter + with return
    public String enroll(){

        //this variables not used
        int studID = 20251234;
        String studName = "Duke Hsu";
        String studCourse = "BS - IT";

        return "The Student was enrolled!";
    }

    //method with parameters + with return 
    public String enroll(int studID, String studName,String studCourse){
        studentID = studID;
        name = studName;
        course = studCourse;

        return "The Student was enrolled!";
    }


    //method with parameter + with out return 
    public void displayInformation(int studID){
        if (studID==studentID){
            System.out.println("The student enrolled is " + name + " , with student ID: "+ studID + ", and course : "+ course + ".");
        }
        else{

            System.out.println("No enrolled student with the student ID: " +studID+ ".");
        }
    }


    //method with out parameter and return values
    public void displayInformation(){
        
        int studID = 20251234;

        if (studID==20251234){
            System.out.println("The student enrolled is " + name + " , with student ID: "+ studID + ", and course : "+ course + ".");
        }
        else{

            System.out.println("No enrolled student with the student ID: " +studID+ ".");
        }
    }
    

}
```

 










----
### References: 
