

# Module 9 Polymorphism

2026-04-29 23:31

Tags: #java 

Author:  Duke Hsu

---

## 1.0.0 Polymorphism

**Polymorphism**

- Greek word for poly - "Many" , morph - "form"
- The ability of an object to identify as more than one type 


### 1.0.1 Code Example

**Parent Class**

```java
public class Drinks {  
  
    //make method  
    public void make(){  
        System.out.println("Making a drink");  
    }  
}
```

**Child Classes:** 

```java
public class Coffee extends Drinks{  
  
    @Override //override the make method  
    public void make(){  
        System.out.println("Making a coffee + hot water");  
    }  
}
```

```java
public class MilkTea extends Drinks{  
    @Override  
    public void make(){  
        System.out.println("Making a milk tea + sugar + water +  milk");  
    }  
}
```

```java
public class IceTea extends Drinks {  
    @Override  
    public void make(){  
        System.out.println("Making an ice tea + water + sugar + ice");  
    }  
}
```


```java
public class GreenTea extends Drinks{  
    @Override  
    public void make(){  
        System.out.println("Making a green tea + water + sugar");  
    }  
}
```



**Main class**

```java
public class Main {  
    public static void main(String[] args) {  
        //create an array of drinks  
        Drinks[] drinks = {new GreenTea(), new IceTea(), new MilkTea(), new Coffee()};  
  
        //loop through the array and print the make method  
        for (Drinks drink : drinks) {  
            drink.make();    
        }  
  
    }  
}
```


### 1.0.2 Overridring 

## 2.0 Abstract 

Abstraction hides complex implementation details and shows features to the user. 

!!! note "Abstract Classes"
	An abstract class cannot be instantiated.
	It may contain: `abstract methods` ,  `regular methods`

### 2.1 Why it is used 
1. Simplifies programs
	- Users don't need to know how everything works internally 
	- Focus only on what the object does, not how
2. Improves code organization 
	- Separates design (what) from implementation(how)
3. Supports maintainability
	- You can change internal logic without affecting other part of the program


###  2.2 Real Life Example 

In a bank system , each  account type will have different  Interest fee and Service fee.
So , when you create a code  , u can abstract this method to give child class  to implement it  .

Code Example: 

```java

//parent class
abstract class BankAccount{
	/*
	* another statement
	*/
	
	// abstract Interest fee caculate method , implement it by child classes
    abstract double calculateInterest();
    
    // service fee caculate
    abstract double calculateServiceFee(double amount);
}
```


```java
//child class

class SavingAccount extends BankAccount{
	/*
	* another statement
	*/
	
	    // === Polymorphism  ===
    //Orverride parent  class method , provied self implement
    @Override
    double calculateInterest() {
        // 儲蓄帳戶：利息 = 餘額 × 利率
        return getBalance() * INTEREST_RATE;
    }
    
    @Override
    double calculateFee(double amount) {
        // 儲蓄帳戶：手續費很低，只有0.1%
        return amount * 0.001;
    }
	
}

```


## 3.0 Interfaces

An Interface defines methods that must be implemented. An interface defines a **contract** that classes must  follow .

### 3.1 Why it is used
1. Ensures standard behavior
	- Different classes follow the same method structure
2. Enables multiple inheritance 
	- Java does not allow multiple class inheritance, but allowed multiple interfaces.
3. Promotes loose coupling
	- Classes depend on behavior, not specific implementation
4. Improves flexibility and scalability 
	 - Easy to add new classes without changing existing code

### 3.2 Real Life Example

Images bank accounts, clients Accounts should be have this following function 
- deposit 
- withdraw
- getBalance
- printStatement

So , when you create a code, you can use interface to make a contract to give anther class follow. 

Code Example:

```java

//create an interface
interface Account{
	void deposit(double amount);
	void withdraw(double amount);
	double getBlance();
	void printStatement();
}
```

```java
//bank acounts implements the interface methods
abstract class BankAccount implements Account {
    /*
	    other code and statement
    
    */
    
    //use encapsulation 
    private double balance;           
    
    // construact 
    public BankAccount(String accountNumber, String accountHolder, String accountType) {
        this.accountNumber = accountNumber;
        this.accountHolder = accountHolder;
        this.accountType = accountType;
        this.balance = 0;
    }
    

    //
    public double getBalance() {
        return balance;
    }
    
    // === 通用的存錢方法（所有帳戶相同） ===
    @Override
    public void deposit(double amount) {
        if (amount <= 0) {
            System.out.println(" 存入金額必須大於0！");
            return;
        }
        addBalance(amount);
        System.out.println("已存入 " + amount + " 元");
    }
    
    // === 通用的提錢方法（但會調用各子類別的手續費計算） ===
    @Override
    public void withdraw(double amount) {
        if (amount <= 0) {
            System.out.println(" 提取金額必須大於0！");
            return;
        }
        
        // 計算手續費（由子類別實現）
        double fee = calculateFee(amount);
        double totalAmount = amount + fee;
        
        if (totalAmount > balance) {
            System.out.println(" 餘額不足！需要 " + totalAmount + " 元（含手續費）");
            return;
        }
        
        subtractBalance(totalAmount);
        System.out.println(" 已提取 " + amount + " 元（手續費：" + fee + " 元）");
    }
    
    // === 通用的列印帳單方法 ===
    @Override
    public void printStatement() {
        System.out.println("\n========== 帳戶明細 ==========");
        System.out.println("帳戶類型：" + accountType);
        System.out.println("帳號：" + accountNumber);
        System.out.println("戶名：" + accountHolder);
        System.out.println("餘額：" + balance + " 元");
        System.out.println("利息：" + calculateInterest() + " 元");
        System.out.println("=============================\n");
    }
}

```



----
## References
