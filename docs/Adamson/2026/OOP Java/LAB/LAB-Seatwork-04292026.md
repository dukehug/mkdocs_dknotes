
# LAB  Seatwork 04292026

2026-04-29 21:49

Tags:  #java 

Author:  Duke Hsu

---

## Key takeaways

- Using Inheritance and Encapsulation create a number guess games .
- Parent class `Character`
- Child classes `Player`, `Monster`
- Including `while` loop, `if-else` statement 
- Using GETTER and SEETER update and get data

## Program logical 

1. Import the required classes (`Scanner` and `Random`)
2. Generate a random number (1–6) as the secret number
3. Prompt the user to enter a guess
4. Check the result:
    - Correct guess → Monster - 20 HP
    - Wrong guess → Player - 10 HP


## UML 


![[lab_seatwork_final_2.png]]



## Code Example

**Main Class**

```java
//import Scanner and Random  
import java.util.Scanner;  
import java.util.Random;  

public class Main {  
    public static void main(String[] args) {  
  
        //create instances of Scanner and Random  
        Scanner sc = new Scanner(System.in);  
        Random rand = new Random();  
  
        //create instances of the player and monster  
        Player player = new Player("Hero", 100);  
        Monster monster = new Monster("Shadow Beast", 90);  
  
        //display the game rules  
        System.out.println("=== GUESS THE GREATURE NUMBER ===");  
        System.out.println("Defeat the monster by guessing its secret number! (1-6)");  
        System.out.println("If you guess correctly, monster loses 20 HP");  
        System.out.println("If you guess wrong, you lose 10 HP");  
        System.out.println(" ");  
  
        //game loop  
        while(player.getHp() >0 && monster.getHp()>0){  
  
            //display player and monster status  
            player.displayStatus();  
            monster.displayStatus();  
            System.out.println(" ");  
  
            //generate a random number between 1 and 5  
            int secretNumber = rand.nextInt(5) + 1;  
  
            //ask user input guessing number  
            System.out.println("Enter your guess: ");  
            int guess = sc.nextInt();  
  
            //execute subclass method attack  
            player.attack(monster, guess, secretNumber);  
  
            System.out.println("-----------------------");  
        }//end while  
  
        //result        if(monster.getHp() <= 0){  
            System.out.println("Congratulations! You defeated the monster!");  
        }else{  
            System.out.println("Game Over! The monster defeated you!");  
        }//end if  
  
        sc.close();  
  
    }//end main method 
}
```



**Parent Class**

```java
public class Character {  
    //super class attributes  
     private String name;  
     private int hp;  
  
    //constructor  
    public Character(String name, int hp) {  
        //set the attributes  
        this.setHp(hp);  
        this.setName(name);  
    }  
  
    //displays the status of the character  
    public void displayStatus(){  
        System.out.println(getName() + " Now has:  " + getHp() + " HP");  
    }  
  
    //==================== GETTERS AND SETTERS ======================  
    public String getName() {  
        return name;  
    }  
  
    public int getHp() {  
        return hp;  
    }  
  
    public  void setHp(int hp) {  
        this.hp = hp;  
    }  
  
    public void setName(String name) {  
        this.name = name;  
    } 
}
```


**Child class `Player`**

```java
public class Player extends Character {  
    //constructor  
    Player(String name, int hp){  
        //super calls the constructor of the superclass  
        super(name, hp);  
    }  
  
    // subclass method  
    public void attack(Monster monster, int guess, int secretNumber){  
        if(guess == secretNumber){  
            //monster wounded - 20 HP  
            monster.wounded();  
            monster.setHp(monster.getHp() - 20) ;  
        }else {  
            //player taunted - 10 HP  
            monster.taunt();  
            this.setHp(this.getHp() - 10);  
        }  
    }//end attack method
}
```



**Child class `Monster`**

```java
public class Monster extends Character {  
    //constructor  
    Monster(String name, int hp) {  
        //super calls the constructor of the superclass  
        super(name, hp);  
    }  
  
    //subclass method  
    public void taunt(){  
        System.out.println(getName() + " Wrong guess! Prepare to suffer!");
    }//end taunt  
  
    //subclass method    public void wounded(){  
        System.out.println(getName()  + "  wounded! it hurts！！！");
    }//end wounded  
}
```




---

