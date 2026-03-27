
# Java-Interface

2026-03-28 00:43

Tags: #java 

Author:  Duke Hsu

---

## Key Concept

- interface  is a template that can be applied to a class. 
- interface similar to inheritance, but specifies what a class has/ must do.
- classes can apply more than one interface, 

## Code Example:

- Bank Class

```java
/**
 * 
 */
package bankingsystem;

/**
 * 
 */
public class Bank {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		//initd object
		SavingAccount  dkAccount = new SavingAccount("duke", 5000);
		
		// call methods - interface BankAccount and InteresEarning
		dkAccount.deposit(9000);
		dkAccount.deposit(100000);
		dkAccount.withdraw(5000);
		System.out.println("**********************************");
		dkAccount.printStatement();
		
		System.out.println();
		System.out.println("==================================");
		dkAccount.applyInterest();
		System.out.println("InterestRate is:  "+dkAccount.getInterestRate());

	}

}

```

- SavingAccount Class

```java
package bankingsystem;


//class SavingAccount can apply more than one interface -  BankAccount,InteresEarning
public class SavingAccount implements BankAccount,InteresEarning{
	
	private double balance;
	private String accountHoulder;
	private double interestRate =0.03;
	
	//constructor 
	public SavingAccount(String name, double initialBanlance) {
		this.accountHoulder = name;
		this.balance = initialBanlance;
	}
	

	@Override
	public void deposit(double amount) {
		balance += amount;
		System.out.println("Account:  " + accountHoulder + " Deposited: " + amount);
	}

	
	@Override
	public void withdraw(double amount) {
		if (balance >= amount) {
			
			balance -= amount;
			System.out.println("Account: " +accountHoulder + " Withdraw: " + amount);
			
		}else {
			
			System.out.println("Isufficient funds!!!");
			
		}

	}
	

	@Override
	public double getBalance() {
		
		return balance;
	}

	
	
	@Override
	public void printStatement() {
		
        System.out.println("=== Savings Account ===");
        System.out.println("Holder: " + accountHoulder);
        System.out.println("Balance: $" + balance);
		
	}


	@Override
	public void applyInterest() {
		double interest = balance * interestRate;
		balance += interest;
        System.out.println("  Interest applied: $" + interest);
        System.out.println("  New balance: $" + balance);
		
	}


	@Override
	public double getInterestRate() {
		return interestRate;
	}

}

```

- CheckingAccount Class

```java
package bankingsystem;

public class CheckingAccount implements BankAccount {
	private double balance;
    private String accountHolder;
    
    public CheckingAccount(String name, double initialBalance) {
        this.accountHolder = name;
        this.balance = initialBalance;
    }
    
    @Override
    public void deposit(double amount) {
        balance += amount;
        System.out.println("💰 " + accountHolder + " deposited $" + amount);
    }
    
    @Override
    public void withdraw(double amount) {
        // overdraft
        balance -= amount;
        System.out.println("💸 " + accountHolder + " withdrew $" + amount);
    }
    
    @Override
    public double getBalance() {
        return balance;
    }
    
    @Override
    public void printStatement() {
        System.out.println("=== Checking Account ===");
        System.out.println("Holder: " + accountHolder);
        System.out.println("Balance: $" + balance);
    }
}


```


- Interface BankAccount  

```java
package bankingsystem;

//this interface can implements to class
public interface BankAccount {
	
	void deposit(double amount); //deposit money
	void withdraw(double amount); // withdraw money 
	double getBalance(); //balance check 
	void printStatement(); //print statements

}

```


- Interface InterestEarning

```java
package bankingsystem;


// this interface can implements to class
public interface InteresEarning {
	void applyInterest();
	double getInterestRate();

}

```

!!!note Reminder
	Use Command + Shift + V paste the code from Eclipse


----
### References
