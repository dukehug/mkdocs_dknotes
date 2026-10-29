

# GRE Tunnels Config Practice

2026-10-30 01:02

Tags:  #enterpriseNetwork 

Author:  Duke Hsu

---

## Topic

1. GRE definition 
2. GRE Tunnel hands-on


## 1. GRE definition 

Generic Routing Encapsulation (GRE). is a stateless, non-secure tunneling protocol developed by Cisco (RFC 2784) that encapsulates a wide variety of network-layer protocol packets inside IP tunnels. 

## 2. GRE Tunnel hands-on 

Topology 

![image.png](https://img.dukehsu.com/study_note/20261030010748051.webp)

RA IP address information 

| Interface | IP address   |                 |
| --------- | ------------ | --------------- |
| G0/0      | 192.168.1.1  | 255.255.255.0   |
| S0/0/0    | 64.103.211.2 | 255.255.255.252 |
| Tunnel 0  | 10.10.10.1   | 255.255.255.252 |


RB IP address information 

| Interface | IP address    |                 |
| --------- | ------------- | --------------- |
| G0/0      | 192.168.2.1   | 255.255.255.0   |
| S0/0/0    | 209.165.122.2 | 255.255.255.252 |
| Tunnel 0  | 10.10.10.2    | 255.255.255.252 |



### 2.1 Command 

RA

```cisco-ios
enable
config t
	interface tunnel 0
		ip address 10.10.10.1 255.255.255.252
		tunnel source 64.103.211.2
		tunnel destination 209.165.122.2
		tunnel mode gre ip 
		mtu 1400  !if have problem , try it 
		ip tcp adjust-mss 1360
		no shutdown 
		exit
	ip route 192.168.2.0 255.255.255.0 10.10.10.2
	exit

show ip route static 
show running-config | section tunnel
```

RB

```cisco-ios
enable
config t
	interface tunnel 0
		ip address 10.10.10.2 255.255.255.252
		tunnel source 209.165.122.2
		tunnel destination 64.103.211.2
		tunnel mode gre ip
		mtu 1400
		ip tcp adjust-mss 1360
		no shutdown
		exit
	ip route 192.168.1.0 255.255.255.0 10.10.10.1
	exit

show ip route static
show running-config | seciton tunnel
```















----
## References


