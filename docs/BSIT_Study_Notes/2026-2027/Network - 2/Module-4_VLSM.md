
# Module - 4  VLSM  - Variable Length Subnet Mask

2026-09-05 09:40

Tags: #Network 

Author:  Duke Hsu

---
## Topic 

1. VLSM (Variable Length Subnet Mask)
2. Step by Step 

## 1. VLSM 

VLSM stands for ==Variable Length Subnet Mask.==

- You can use more than one mask inside the same Class A/B/C network .

- You can create subnets of different sizes based on actual requirements.

- It is often described as subnetting the subnet.

## 2. VLSM Step by step 

![VLSM-Step-by-Step.png](https://img.dukehsu.com/study_note/VLSM-Step-by-Step.webp)

###  2.1Step 1 : List all networks and  their hosts requirement 

**Find  subnet size**
- Host needs
- CIDR / Prefix
- Subnet Mask

**For example**

4000 hosts 

$2^{11} - 2 =2044$  not enough
$2^{12}-2=4094$  ok > 4000

Host bits = 12 

Network bits = 32 - 12 =  20 
CIDR : /20

Subnet mask = 255.255.240.0

### 2.2 Step 2  Arrange the requirements from largest to smallest 

Find network address 

- Interesting Octet
- Increment number / Magical number
- Network Address

For example 

CIDR = /20 

`255 . 255 . 240 . 0` 

Interesting Octet = Octet 3 

Interment number = 256 - subnet mask value 

```
ST
256 - 240 = 16

CT
256 - 240 = 16

SV
256 - 248 = 8

CS
256 - 252 = 4
```



### 2.3 Step 3 - Determine the appropriate subnet mask for each requirement.

Find Address Range 

- Broadcast IP
- 1st Usable IP
- Last Usable IP

Network + 1 = First 
Broadcast - 1 = Last

!!! Warning "Notice"
	 0 ~ 7 is 8 bits ,  included 0, 1, 2, 3, 4, 5 , 6 , 7 



----
## References

[https://www.youtube.com/watch?v=P5t2gN2l7ZI](https://www.youtube.com/watch?v=P5t2gN2l7ZI)

