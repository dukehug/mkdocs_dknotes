

# Activity  Assignment Model  Maximum Problem

2026-04-10 11:25

Tags:  #math 

Author:  Duke Hsu

---

**Activity: Assignment Model**  
**Problem:**  
   
A Faculty Association of a certain college has four fund raising projects to work, which are to be assigned to each of the four officers. Given the **opportunity profit**( in thousand pesos) table below. What should be the best assignments?  
   
==Opportunity profit = Maximum profit==  
   
| | | | | | |  
|-|-|-|-|-|-|  
|   | **Project** | | | | |   
| **Officer** |   | **W** | **X** | **Y** | **Z** |   
|  | **A** | 5 | 6 | 4.5 | 2.5 |   
|  | **B** | 4 | 3 | 3.5 | 1 |   
|  | **C** | 3.5 | 1.5 | 2 | 3 |   
|  | **D** | 4.5 | 1 | 0 | 5.5 |   
 !!! note "Maximization"
	 The Hungarian Method was originally designed to solve minimization problems. Therefore, "Step 0: Building the Loss Matrix" must be performed first before proceeding.

### **Step 0:  Loss Matrix / Regret**  
   
Loss Matrix = Maximum value  – Each cell values  
   
Max value is **6**  
   
| | | | | | |  
|-|-|-|-|-|-|  
|   | **Project** | | | | |   
| **Officer** |   | **W** | **X** | **Y** | **Z** |   
|  | **A** | 6 - 5 =**1** | 6 - 6 =**0** | 6 - 4.5 = **1.5** | 6 - 2.5 = **3.5** |   
|  | **B** | 6 - 4 = **2** | 6 - 3 = **3** | 6 - 3.5 = **2.5** | 6 - 1 = **5** |   
|  | **C** | 6 - 3.5 = **2.5** | 6 - 1.5 = **4.5** | 6 - 2 = **4** | 6 - 3 = **3** |   
|  | **D** | 6 - 4.5 = **1.5** | 6 - 1 = **5** | 6 - 0 = **6** | 6 - 5.5 =**0.5** |   
   
### **Step 1: Row Reduction**  
Find minimum value in each row. Subtract that value from each value in the same row .  
   
|             |             |         |         |         |         |     |     |
| ----------- | ----------- | ------- | ------- | ------- | ------- | --- | --- |
|             | **Project** |         |         |         |         |     |     |
| **Officer** |             | **W**   | **X**   | **Y**   | **Z**   |     |     |
|             | **A**       | **1**   | **0**   | **1.5** | **3.5** | 0   |     |
|             | **B**       | **2**   |  **3**  | **2.5** | **5**   | 2   |     |
|             | **C**       | **2.5** | **4.5** | **4**   | **3**   | 2.5 |     |
|             | **D**       | **1.5** | **5**   | **6**   | **0.5** | 0.5 |     |
   
   
Iteration **a** 
   
| | | | | | |  
|-|-|-|-|-|-|  
|   | **Project** | | | | |   
| **Officer** |   | **W** | **X** | **Y** | **Z** |   
|  | **A** | **1** | **0** | **1.5** | **3.5** |   
|  | **B** | **0** | 1 | **0.5** | **3** |   
|  | **C** | **0** | **2** | **1.5** | **0.5** |   
|  | **D** | **1** | **4.5** | **5.5** | **0** |   
   
   
### **Step 2: Column  Reduction**  
Find minimum value in each column . Subtract that value from each value in the same column.  
   
|             |             |       |         |         |         |     |
| ----------- | ----------- | ----- | ------- | ------- | ------- | --- |
|             | **Project** |       |         |         |         |     |
| **Officer** |             | **W** | **X**   | **Y**   | **Z**   |     |
|             | **A**       | **1** | **0**   | **1.5** | **3.5** |     |
|             | **B**       | **0** | 1       | **0.5** | **3**   |     |
|             | **C**       | **0** | **2**   | **1.5** | **0.5** |     |
|             | **D**       | **1** | **4.5** | **5.5** | **0**   |     |
|             |             | 0     | 0       | 0.5 | 0       |     |
   
Iteration **b**   
   
| | | | | | |  
|-|-|-|-|-|-|  
|   | **Project** | | | | |   
| **Officer** |   | **W** | **X** | **Y** | **Z** |   
|  | **A** | **1** | **0** | **1** | **3.5** |   
|  | **B** | **0** | 1 | **0** | **3** |   
|  | **C** | **0** | **2** | **1** | **0.5** |   
|  | **D** | **1** | **4.5** | **5** | **0** |   
   
   
### **Step 3 - Cover All Zeros with Lines**  
Draw the minimum number of lines needed to cover all zeros. If number of lines = number of rows, you are done . Otherwise move to step 4 .  

![](../../../assets/images/assignment_model_maximum_problem_1.png)
   

   
**4 Lines = 4 Rows  We are done .  Jump to Step 5**  
   
### **Step 4:  Revise the Matrix**  
Find the smallest uncovered values. Subtract this from all uncovered values and add it to values at intersection of lines. Then repeat step 3.  
- Cells with **no line** through them: subtract the smallest uncovered number  
- Cells at the **crossing point** of two lines: add the smallest uncovered number  
- Cells with **exactly one line**: keep the number as it is  
### **Step 5:  Circle the assignment from row or column with minimum number of zeros**  

![](../../../assets/images/assignment_model_maximum_problem_2.png)

### **The Assignments:**  
   
**Officer A to project X            6**  
**Officer B to project Y            3.5**  
**Officer C to project W            3.5**  
**Officer D to project Z            5.5**  
   
**Maximum Profit is : 6+3.5+3.5+5.5 = 18.5**  
   
**18, 500.00 Pesos**  
   

----
   

   
   
