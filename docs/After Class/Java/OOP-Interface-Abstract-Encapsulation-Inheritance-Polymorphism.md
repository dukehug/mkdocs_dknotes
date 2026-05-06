
# JAVA OOP - Interface , Abstract ,   Encapsulation , Inheritance And  Polymorphism Concepts Code Example


## Interface

`Account`:
- 規定account 應該有哪些功能，需要做什麼
- 只定義了空的method ， 沒有詳細的method如何實現
## Abstract And Encapsulation 

`BankAccount ` >  Abstract , Encapsulation  
- `abstract class BankAccount implements Account`  Override  the Interface methods， and implement it
- 使用private modify 保護重要信息， 並通過getter setter 來更新和獲取數據
- 使用abstract寫了利息和手續費的計算方式， 供後續的子class 實現具體的功能
## Inheritance And Polymorphism

`SavingsAccount`
- Inheritance from `BankAccount`(Extends from BankAccount), 繼承BankAccount 的所有屬性和方法
- 利用polymorphism 的特性， 複寫(Override)  利息和手續費的計算方式

剩餘的 `checkAccount `class, `TermAccount` class 同樣採用了 Inheritance 和 Polymorphism 的特性


## Code Example:

### Interface 

```java
// ============================================
// 第一部分：定義介面 - 帳戶的基本能力
// ============================================

/**
 * 介面：定義所有帳戶必須具備的功能
 * Interface - 規定帳戶應該做什麼
 */
interface Account {
    void deposit(double amount);      // deposit
    void withdraw(double amount);     // withdraw
    double getBalance();              // balance check 
    void printStatement();            // print
}

```

### Abstract  And  Encapsulation 

```java
// ============================================
// 第二部分：抽象類別 - 帳戶的通用邏輯
// ============================================

/**
 * 抽象類別：所有帳戶的基礎框架
 * Abstract - 提供共同的方法和屬性
 * Encapsulation - 使用private保護敏感數據
 */
abstract class BankAccount implements Account {
    
    // === Encapsulation 封裝 ===
    // 使用private隱藏內部細節，只能通過方法訪問
    private String accountNumber;     // 帳號
    private String accountHolder;     // 帳戶人姓名
    private double balance;           // 餘額
    private String accountType;       // 帳戶類型
    
    // 建構子：初始化帳戶
    public BankAccount(String accountNumber, String accountHolder, String accountType) {
        this.accountNumber = accountNumber;
        this.accountHolder = accountHolder;
        this.accountType = accountType;
        this.balance = 0;
    }
    
    // === 封裝：提供安全的getter ===
    public String getAccountNumber() {
        return accountNumber;
    }
    
    public String getAccountHolder() {
        return accountHolder;
    }
    
    public double getBalance() {
        return balance;
    }
    
    public String getAccountType() {
        return accountType;
    }
    
    // === 封裝：提供安全的setter ===
    // 存錢 - 增加餘額
    protected void addBalance(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }
    
    // 提錢 - 減少餘額
    protected void subtractBalance(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
        }
    }
    
    // === Abstract 抽象方法 ===
    // 每種帳戶的利息計算方式不同，由子類別實現
    abstract double calculateInterest();
    
    // 每種帳戶可能有不同的手續費規則
    abstract double calculateFee(double amount);
    
    
    // === 通用的存錢方法（所有帳戶相同） ===
    @Override
    public void deposit(double amount) {
        if (amount <= 0) {
            System.out.println("❌ 存入金額必須大於0！");
            return;
        }
        addBalance(amount);
        System.out.println("✅ 已存入 " + amount + " 元");
    }
    
    // === 通用的提錢方法（但會調用各子類別的手續費計算） ===
    @Override
    public void withdraw(double amount) {
        if (amount <= 0) {
            System.out.println("❌ 提取金額必須大於0！");
            return;
        }
        
        // 計算手續費（由子類別實現）
        double fee = calculateFee(amount);
        double totalAmount = amount + fee;
        
        if (totalAmount > balance) {
            System.out.println("❌ 餘額不足！需要 " + totalAmount + " 元（含手續費）");
            return;
        }
        
        subtractBalance(totalAmount);
        System.out.println("✅ 已提取 " + amount + " 元（手續費：" + fee + " 元）");
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


### Inheritance And Polymorphism

```java
// ============================================
// 第三部分：具體的帳戶類別 - Inheritance 繼承
// ============================================

/**
 * 儲蓄帳戶 - 繼承BankAccount
 * Inheritance - 繼承父類別的所有方法和屬性
 * Polymorphism - 覆蓋calculateInterest()和calculateFee()方法
 */
class SavingsAccount extends BankAccount {
    
    // 儲蓄帳戶的利率
    private static final double INTEREST_RATE = 0.02;  // 年利率2%
    
    public SavingsAccount(String accountNumber, String accountHolder) {
        super(accountNumber, accountHolder, "儲蓄帳戶");
    }
    
    // === Polymorphism 多態性 ===
    // 覆蓋父類別的方法，提供自己的實現
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

/**
 * 支票帳戶 - 繼承BankAccount
 * Inheritance - 繼承父類別的所有方法和屬性
 * Polymorphism - 覆蓋calculateInterest()和calculateFee()方法
 */
class CheckingAccount extends BankAccount {
    
    // 支票帳戶的利率更低
    private static final double INTEREST_RATE = 0.005;  // 年利率0.5%
    
    public CheckingAccount(String accountNumber, String accountHolder) {
        super(accountNumber, accountHolder, "支票帳戶");
    }
    
    // === Polymorphism 多態性 ===
    @Override
    double calculateInterest() {
        // 支票帳戶：利息更少
        return getBalance() * INTEREST_RATE;
    }
    
    @Override
    double calculateFee(double amount) {
        // 支票帳戶：手續費較高，0.5%
        return amount * 0.005;
    }
}

/**
 * 定期帳戶 - 繼承BankAccount
 * Inheritance - 繼承父類別的所有方法和屬性
 * Polymorphism - 覆蓋calculateInterest()和calculateFee()方法
 */
class TermAccount extends BankAccount {
    
    // 定期帳戶利率最高
    private static final double INTEREST_RATE = 0.05;   // 年利率5%
    private static final double WITHDRAWAL_FEE = 50;    // 固定手續費
    
    public TermAccount(String accountNumber, String accountHolder) {
        super(accountNumber, accountHolder, "定期帳戶");
    }
    
    // === Polymorphism 多態性 ===
    @Override
    double calculateInterest() {
        // 定期帳戶：利息最高
        return getBalance() * INTEREST_RATE;
    }
    
    @Override
    double calculateFee(double amount) {
        // 定期帳戶：固定手續費50元
        return WITHDRAWAL_FEE;
    }
}

```

### BankSystem Class And Main Method

```java


// ============================================
// 第四部分：主程式 - 展示所有概念
// ============================================

public class BankSystem {
    public static void main(String[] args) {
        System.out.println("🏦 銀行帳戶系統\n");
        
        // 建立三種不同類型的帳戶
        Account savings = new SavingsAccount("2024001", "王小明");
        Account checking = new CheckingAccount("2024002", "李小華");
        Account term = new TermAccount("2024003", "張小美");
        
        // ========================================
        // 演示1：存錢 - 所有帳戶用同一方法
        // ========================================
        System.out.println("--- 第一步：存錢 ---");
        savings.deposit(10000);
        checking.deposit(10000);
        term.deposit(10000);
        
        // ========================================
        // 演示2：查詢餘額
        // ========================================
        System.out.println("\n--- 第二步：查詢餘額 ---");
        System.out.println("儲蓄帳戶餘額：" + savings.getBalance() + " 元");
        System.out.println("支票帳戶餘額：" + checking.getBalance() + " 元");
        System.out.println("定期帳戶餘額：" + term.getBalance() + " 元");
        
        // ========================================
        // 演示3：提錢 - 展示Polymorphism多態性
        // （同樣的方法，不同帳戶的手續費不同！）
        // ========================================
        System.out.println("\n--- 第三步：提錢（展示多態性 - 手續費不同） ---");
        System.out.println("\n儲蓄帳戶提2000元：");
        savings.withdraw(2000);  // 手續費2元
        
        System.out.println("支票帳戶提2000元：");
        checking.withdraw(2000); // 手續費10元
        
        System.out.println("定期帳戶提2000元：");
        term.withdraw(2000);     // 手續費50元
        
        // ========================================
        // 演示4：列印帳單 - 展示Polymorphism
        // （同樣的方法，不同帳戶的利息不同！）
        // ========================================
        System.out.println("--- 第四步：列印帳單（展示多態性 - 利息不同） ---");
        savings.printStatement();  // 利息：2%
        checking.printStatement(); // 利息：0.5%
        term.printStatement();     // 利息：5%
        
        // ========================================
        // 演示5：統一處理所有帳戶
        // （這就是Interface的威力！）
        // ========================================
        System.out.println("--- 第五步：用一個方法處理所有帳戶類型 ---");
        Account[] allAccounts = {savings, checking, term};
        
        System.out.println("給所有帳戶都存5000元：");
        for (Account acc : allAccounts) {
            acc.deposit(5000);
        }
        
        System.out.println("\n從所有帳戶都提1000元：");
        for (Account acc : allAccounts) {
            acc.withdraw(1000);
        }
        
        System.out.println("\n所有帳戶的最終狀態：");
        for (Account acc : allAccounts) {
            acc.printStatement();
        }
    }
}

```


