
# Module 4 Simplex Method Part2

2026-03-07 11:43

Tags: #math 

Author:  Duke Hsu

---

## Maximize Problem 



### Given Problem:

Object function 

$Max \quad Z=3x+5y$

Constraint 

$Subject\quad to: \quad$
$4x-y\le25$

$x+2y\le40$

$x,y\ge0$

#### Step 1 - Standard 

$Max \quad Z=3x+5y+0S_1+0S_2$

$4x-y+S_1=25$

$x+2y+S_2 = 40$

$x,y,S_1,S_2 \ge 0$

!!!note
	 Object function (n), Constraint (m); 

!!!note
	Matrix size: Rows = m + 1, Column = n + m + 1

$m = 2, n = 2$
#### Step 2 - Tableau 

- Row is Your constraint 
- Column is Your all variable ($x_1,x_2,x_3,S_1, S_2,S_3$) etc...
- $C_j$ Your Object function coefficient

##### Iteration - 1 

|       | $C_j$             |       | $3$ | ==$5$==  | $0$   | $0$   |       |
| ----- | ----------------- | ----- | --- | -------- | ----- | ----- | ----- |
| $C_i$ | $Solution(Basic)$ | $Qty$ | $x$ | ==$y$==  | $S_1$ | $S_2$ | $Q_i$ |
| $0$   | $S_1$             | $25$  | $4$ | ==$-1$== | $1$   | $0$   | $-25$ |
| ==$0$==   | ==$S_2$==             | ==$40$==  | ==$1$== | ==$2$==  | ==$0$==   | ==$1$==   | ==$20$==  |
|       | $Z_j$             | $0$   | $0$ | ==$0$==  | $0$   | $0$   |       |
|       | $C_j - Z_j$       |       | $3$ | ==$5$==  | $0$   | $0$   |       |

$Z_j = (C_iRow1 * First Row Each Number) + (C_iRow2 * Second Row Each Number)$

Find the `Entering Variable`:

- 檢查 $C_j - Z_j$ row, 那個==最大的positive number== 的那個`column `就是 `Entering Variable`
-  $C_j - Z_j$  - For Maximize  problem pick the most positive value that column is your **Entering Variable**  

Find the `Leaving Variable`:

- 檢查 $Q_i$  column, 那個==最小的Positive number== 那個`row `就是 `Leaving Variable`
- Devide the Qty column by the entering values(only positive ones) , the row with the smallest positive , that's your **Leaving Variable**;

	$Q_i = Qty \div Entering Variable Column Constraint Row Each Number$

!!!note
	忽略負數


Iteration -1 Result:

**Entering Variable** : $y$
**Leaving Variable** : $S_2$
**Pivot Element**: $2$

##### Iteration - 2

Leaving variable leaving tableau, Entering variable entry the new tableau > Pivot row

1. **Pivot row Y**: 

$Old \quad Tableau \quad Leaving \quad Variable \quad Row  \quad Numbers \quad  \div \quad Pivot \quad Element$



2. **Other Constraint Row:** 

$New row =  Old Tableau Row Numbers -  (This Row Y 係數) \times Pivot Rows Each Number$

Old Tableau $S_1$ Row Numbers Y 係數 = $-1$

$New S_1 row = Old Tableau S_1 Row Numbers - $(-1)$ \times Pivot Row Numbers$


$New S_1 Row = [25,4,-1,1,0] - ((-1) \times [20,\frac{1}{2},1,0,\frac{1}{2}])$


3. $Z_j$

$Z_j = (C_iRow1 * First Row Each Number) + (C_iRow2 * Second Row Each Number)$




|       | $C_j$             |                               | ==$3$==                                                     | $5$                 | $0$               | $0$                                   |                        |
| ----- | ----------------- | ----------------------------- | ----------------------------------------------------------- | ------------------- | ----------------- | ------------------------------------- | ---------------------- |
| $C_i$ | $Solution(Basic)$ | $Qty$                         | ==$x$==                                                     | $y$                 | $S_1$             | $S_2$                                 | $Q_i$                  |
| ==$0$==   | ==$S_1$==             | ==$25-(-1)\times 20=45$==         | ==$4-(-1)\times \frac{1}{2}=\frac{9}{2}$==                  | ==$-1-(-1)\times 1=0$== | ==$1-(-1)\times0=1$== | ==$0-(-1)\times\frac{1}{2}=\frac{1}{2}$== | ==$45\div\frac{9}{2}=10$== |
| $5$   | $y$               | $40\div2=20$                  | ==$1\div2=\frac{1}{2}$==                                    | $2\div2=1$          | $0$               | $1\div2=\frac{1}{2}$                  | $20\div\frac{1}{2}=40$ |
|       | $Z_j$             | $(0\times45)+(5\times20)=100$ | ==$(0\times\frac{9}{2})+(5\times\frac{1}{2})=\frac{5}{2}$== | $5$                 | $0$               | $\frac{5}{2}$                         |                        |
|       | $C_j - Z_j$       |                               | ==$3-\frac{5}{2}=\frac{1}{2}$==                             | $0$                 | $0$               | $-\frac{5}{2}$                        |                        |

Iteration -2 Result:

**Entering Variable** : $x$
**Leaving Variable** : $S_1$
**Pivot Element**: $\frac{9}{2}$


##### Iteration - 3 

|       | $C_j$             |                             | $3$ | $5$ | $0$            | $0$             |       |
| ----- | ----------------- | --------------------------- | --- | --- | -------------- | --------------- | ----- |
| $C_i$ | $Solution(Basic)$ | $Qty$                       | $x$ | y   | $S_1$          | $S_2$           | $Q_i$ |
| $3$   | $x$               | ==$45\div\frac{9}{2}=10$==      | 1   | 0   | $\frac{2}{9}$  | $\frac{1}{9}$   |       |
| $5$   | $y$               | ==$20-\frac{1}{2}\times10=15$== | 0   | 1   | $-\frac{1}{9}$ | $\frac{4}{9}$   |       |
|       | $Z_j$             | ==$105$==                       | $3$ | $5$ | $\frac{1}{9}$  | $\frac{22}{9}$  |       |
|       | $C_j - Z_j$       |                             | 0   | 0   | $-\frac{1}{9}$ | $-\frac{22}{9}$ |       |

!!!note
	Look at the $C_j - Z_j$ row , If all values are zero or negative -- Done , Qty is the Optimal solution 


Decision: 

$x = 10;$

$y = 15;$

$Optimal Z = 105$



----
### References

Professor's classroom explanation