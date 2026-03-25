
# LAB Activity  03252026

2026-03-25 13:47

Tags: #java 

Author:  Duke Hsu

---

## Topic 

- Array
-  Array of object
- for loop
- Scanner

!!!note
	 After `sc.nextInt();` and `sc.nextDouble();`  you need add `sc.nextLine();`
	 ```

Code:

```java
package arrayslabactvity;
import java.util.Scanner;

/**
 *
 * @author dukehsu
 */
public class ArraysLabActvity {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);
        
        
        //define array of object size .
        System.out.print("Plz enter number of Products: ");
        int numProducts = sc.nextInt();
        sc.nextLine();
        
        
        //create a array of object 
        Product[] products = new Product[numProducts];
        
        
        //for loop to ask user input product name and price
        for(int i=0; i<products.length; i++){
            
            Product p = new Product();  //create a object
            
            System.out.print("Plz Enter Product " +(i+1)+" Name: ");
            p.prodName=sc.nextLine();
            
            System.out.print("Plz Enter Product " +(i+1)+" Price: ");
            p.price = sc.nextDouble();
            sc.nextLine();
            
            products[i]=p;
        
        }//end of for loop
        
        System.out.println("--------");
        
        //use forloop to access the arrays
        for(int i = 0; i < numProducts; i++){
            products[i].display();
        }//end of for loop
    }//end of main methods
}

//Product Class
class Product{
    
    //attribute
    String prodName;
    double price;
    
    // display method
    void display(){
        System.out.println("Product Name is : " + prodName);
        System.out.println("Produc Price is: "+ price);
    }

}//end of Product class
```


----
### References
