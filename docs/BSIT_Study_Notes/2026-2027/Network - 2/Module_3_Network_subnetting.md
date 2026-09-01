
# Module 3 Network  Subnetting 

2026-08-29 07:44

Tags: #Network 

Author:  Duke Hsu

---


## Topic 

1. Problem with Large Broadcast Domains
2. Resons for Subnetting
3. Subnetting an IPv4 Network 


## 1. Problem with Large Broadcast Domains

Slow  network operations and device operations 

- Slow network 
	- broadcast traffic


- Slow device
	- must accept and process each broadcast packet 


- Network Slowdowns
- Bandwidth Waste
- Broadcast Storms
- Security Vulnerabilities



Solution 
- Reduce the size of the network to create smaller broadcast domains in a process called subnetting. 
- VLANs
- Routers and Layer 3 Switches

## 2. Resons for Subnetting

- Quickly find the problem Location 
- Organizational Unit
- Determined by device Type

## 3. Subnetting an IPv4 Network 

- Prefix length and the subnet mask are different ways of identifying the network portion of an address.
- Subnets are created by borrowing host bits fro network bits. 
- More host bits borrowed , the more subnets that can be defined.

Subnetting Formula 

- Calculate number of Subnets formula : $2^n$       
- $n$ is bits borrowed
- Calculate number of Hosts formula: $2^n - 2$
- $n$ is the number of bits remaining int the host field


![image.png](https://img.dukehsu.com/study_note/20260901121821064.webp)


![image.png](https://img.dukehsu.com/study_note/20260901121931466.webp)


### 3.1 Host bits borrowing example 

![image.png](https://img.dukehsu.com/study_note/20260901113616740.webp)


Example:  **/24** is the default CIDR

- /25 - Borrowing 1 bit from the fourth octet creates 2 subnets supporting 126 hosts each .
- /26 - Borrowing 2 bit from the fourth octet creates 4 subnets supporting 126 hosts each .
- /27 - Borrowing 3 bit from the fourth octet creates 8 subnets supporting 126 hosts each .
- /28 - Borrowing 4 bit from the fourth octet creates 16 subnets supporting 126 hosts each .
- /29 - Borrowing 5 bit from the fourth octet creates 32 subnets supporting 126 hosts each .
- /30 - Borrowing 6 bit from the fourth octet creates 64 subnets supporting 126 hosts each .

Network ID dan Broadcast Address

![image.png](https://img.dukehsu.com/study_note/Network-ID-and-Broadcast-Address.webp)


Example - pkg

![subnetting-example-topology.png](https://img.dukehsu.com/study_note/subnetting-example-topology.webp)



### 3.2 Magic Number

- Magic number technique used to calculate subnets
- Magic number is simple the place value of the last one in the subnet mask

![subnetting-magical-number.jpg](https://img.dukehsu.com/study_note/subnetting-magical-number.webp)


- Magic number is 32
- Magic number in octet 4, therefor  subnetting start 192.168.==0==/27 
- 192.168.1.==0==/27 -192.168.1.==224==/27




----
## References

[https://sysadminetwork.wordpress.com/2017/05/30/tcpiptcpip-internet-layer/](https://sysadminetwork.wordpress.com/2017/05/30/tcpiptcpip-internet-layer/)

[https://sysadminetwork.wordpress.com/2017/06/05/soal-subnetting/](https://sysadminetwork.wordpress.com/2017/06/05/soal-subnetting/)