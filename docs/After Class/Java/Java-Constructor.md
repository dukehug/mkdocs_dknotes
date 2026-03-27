

# Java Constructor

2026-03-27 22:44

Tags: #java 

Author:  Duke Hsu

---

## Key concept

- Constructor  is A special method to initialize objects 
- You can pass arguments to a constructor and set up initial values

## Code Example 


Main class

```java

package family;

public class Main {

	public static void main(String[] args) {
	
			//create a new family member
			//if only 3 arrgrment in object , output error
			FamilyMember member1 = new FamilyMember("John",25,18.5,false);
			
			// member1.name = "John"
			// member1.age = 25
			// member1.bmi = 18.5
			// member1.ismarried = false
			
			//print member1 name
			System.out.println(member1.name); //output John
	
	}
}
```

  FamilyMember class

```java
package family;
public class FamilyMember {

//FamilyMember attributes
String name;
int age;
double bmi;
boolean ismarried;

		//Constructors - initialize objects
		public FamilyMember(String name, int age, double bmi, boolean ismarried ){ 
				//accept four parameter to set object of Class FamilyMember
				
				this.name = name; //assign name value to object attribute "name"
				this.age = age; //assign age value to object attribute "age"
				this.bmi = bmi; //assign bmi value to object attribute "bmi"
				this.ismarried = ismarried;
		}
}
```



##  Constructor in Java - Key Points 

### The 3 Most Important Things

| Priority       | What to Remember                                       | Why It Matters                                                                                     |
| -------------- | ------------------------------------------------------ | -------------------------------------------------------------------------------------------------- |
| Most Important | Constructor name MUST match the ==class name exactly== | Same spelling, same capital letters. If you get it wrong, Java won't recognize it as a constructor |
| Very Important | Initialize all properties                              | Make sure every object property gets a value. Don't leave anything empty or with default values    |
| Important      | Use `this `to refer to object properties               | It makes clear which is the property and which is the parameter. Makes your code easier to read    |

**Before you submit your code, ask yourself these questions:**

- [ ] Does the constructor name match the class name exactly (same capital letters)?
- [ ] Did I set a value for every single property?
- [ ] Did I use "this" when assigning values to properties?
- [ ] Did I write "public" in front of the constructor?
- [ ] Are my parameter names clear and easy to understand?



----
### References

Learn CONSTRUCTORS in 10 minutes! - https://www.youtube.com/watch?v=ZD7CB6wKg8A