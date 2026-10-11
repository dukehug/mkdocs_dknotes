
# WEEK - 9  VLAN  InternetWork Operating System

2026-10-11 18:46

Tags:  #IAS 

Author:  Duke Hsu

---
## Topic 

1. Cisco IOS
2. VLAN - Virtual Local Area Network
3. Router-on-a-Stick Inter-VLAN Routing
4. Layer 3 Switch with SVI inter-VLAN routing
5. Hands-on

## 1. Cisco IOS 

Cisco IOS (Internetwork Operating System) is the proprietary, command-line-driven network operating system that runs on the majority of Cisco routers, switches, and networking equipment

Ref: [https://www.cisco.com/site/us/en/products/networking/software/ios-nx-os/index.html](https://www.cisco.com/site/us/en/products/networking/software/ios-nx-os/index.html)

## 2. VLAN

A VLAN (Virtual Local Area Network) is a logical subnetwork that splits a single physical network infrastructure into multiple isolated broadcast domains at Layer 2 (data link layer) of the OSI model

![VLAN](https://community.cisco.com/t5/image/serverpage/image-id/221993i7A363BADEEBAC9FD/image-size/large?v=v2&px=999)



## 3. Router-on-a-Stick Inter-VLAN Routing


![https://ptgmedia.pearsoncmg.com/images/chap4_9780136729358/elementLinks/04fig05.jpg](https://ptgmedia.pearsoncmg.com/images/chap4_9780136729358/elementLinks/04fig05.jpg)

**Router**

- Inter-VLAN Routing ( use Sub-interface)
- DHCP, NAT/PAT, Routing and ACL
- WAN Connectivity
- Forwarding
- Firewall / VPN


**Switch**

cisco 2960

- Create VLAN and Management 
- Trunk Port and Access Port 
- Trunk Port  = Uplink port 
- Access Port Connect end devices

**Scenarios**

- SMB - Small business
-  Home Lab
- LAB

 

**Advantages**

- Cost-Effective - No need Layer 3 switches
- SImple Implementation
- Reduced Cabling
- VLAN Isolation

**Disadvantages**

- Single Point of Failure
- Traffic Bottleneck 
- Performance Limits
- Scalability Constraints



## 4. Layer 3 Switch with SVI inter-VLAN routing 

![image.png](https://img.dukehsu.com/study_note/Layer3-VLAN.webp)


An SVI is a logical Layer 3 interface created on a multilayer (Layer 3) switch for a specific VLAN.


**Router**

- NAT / PAT, Routing 
- WAN Connectivity
- Forwarding
- Firewall / VPN


**Switch**

Cisco 3560

- DHCP, ACL Management
- VLAN create , Management 
- VLAN Gateway
- Inter-VLAN Routing

**Advantages**

- High Performance and Line-Rate Speed
- Reduced Internal Link Congestion
- High Scalability
- Lower Physical Complexity


**Disadvantages**

- Higher Hardware Cost
- Limited Advanced Features -  QoS, Firewalls, SD-WAN
- Basic Security Capabilities
- Single Point of Failure Risks


|              | Router-on-a-Stick Inter-VLAN Routing                                         | Layer 3 Switch with SVI inter-VLAN routing           |
| ------------ | ---------------------------------------------------------------------------- | ---------------------------------------------------- |
| VLAN Gateway | Router Sub-interface                                                         | Switch SVI                                           |
| Uplink Port  | trunk port , no ip address                                                   | routed port, need ip address                         |
| VLAN traffic | Traffic through the trunk to the router and back<br>                         | Hardware switching within the switch                 |
| Bottleneck   | Limited by the bandwidth of a single trunk link and the router’s performance | Limited Advanced Features, Almost no such limitation |
| Scenarios    | SMB, LAN                                                                     | CAN                                                  |

## 5. Hands-on

### 5.1 Layer 3 Switch with SVI inter-VLAN routing 


#### 5.1.1 Switch CLI

##### a. Switch VLAN


```cisco-ios
! SWitch - VLAN
enable
config t
	vlan 10
		name EMPLOYEES
		exit
	interface range fa0/1-3
		switchport mode access
		switchport access vlan 10
		spanning-tree portfast
		exit
		
	vlan 20
		name GUESTS
		exit
	interface range fa0/5-7
		switchport mode access
		switchport access vlan 20
		spanning-tree portfast
		exit
		
	vlan 40
		name IT
		exit
	interface range fa0/9-11
		switchport mode access
		switchport access vlan 40
		spanning-tree portfast
		exit
		
	vlan 50
		name SERVERS
		exit
	interface range fa0/13-15
		switchport mode access
		switchport access vlan 50
		spanning-tree portfast
		exit	
	
```


##### b.Enable Inter-VLAN 


```cisco-ios
! Enable Inter-VLAN Routing 
enable
config t
	ip routing
	interface vlan 10
		ip address 192.168.10.1 255.255.255.0
		no shutdown 
		exit
		
	interface vlan 20
		ip address 192.168.20.1 255.255.255.0
		no shutdown
		exit
		
	interface vlan 40
		ip address 192.168.40.1 255.255.255.0
		no shutdown
		exit
		
	interface vlan 50
		ip address 192.168.50.1 255.255.255.0
		no shutdown
		exit

```

##### c. VLAN DHCP Config

```cisco-ios
! DHCP Configuration
enable 
config t
	ip dhcp excluded-address 192.168.10.1
	ip dhcp excluded-address 192.168.20.1
	ip dhcp excluded-address 192.168.40.1
	ip dhcp excluded-address 192.168.50.1
	
	ip dhcp pool VLAN10_POOL
		network 192.168.10.0 255.255.255.0
		default-router 192.168.10.1
		dns-server 8.8.8.8
		exit

	ip dhcp pool VLAN20_POOL
		network 192.168.20.0 255.255.255.0
		default-router 192.168.20.1
		dns-server 8.8.8.8
		exit

	ip dhcp pool VLAN40_POOL
		network 192.168.40.0 255.255.255.0
		default-router 192.168.40.1
		dns-server 8.8.8.8
		exit	

	ip dhcp pool VLAN50_POOL
		network 192.168.50.0 255.255.255.0
		default-router 192.168.50.1
		dns-server 8.8.8.8
		exit
	end

! verify

show ip dhcp binding
show ip dhcp pool



```

##### d. Security 


**DHCP Snooping**

- Layer 2 Security 
- DHCP Snooping helps prevent ==🔴rogue DHCP servers== from giving users incorrect IP address
- Example: Fake DHCP Server


```cisco-ios
!enable global and specify VLAN 
enable
config t
	ip dhcp snooping 
	ip dhcp snooping vlan 10 
	ip dhcp snooping vlan 20
	ip dhcp snooping vlan 40
	ip dhcp snooping vlan 50

!verify 
show ip dhcp snooping binding

! 查看狀態和 trusted 口     
show ip dhcp snooping               

```

**Dynamic ARP Inspection**

- Dynamic ARP Inspection(DAI) helps protect against certain ARP spoofing/poisoning attacks. 
- Need enable `snooping` first
- DAI commonly works together with DHCP Snooping

```cisco-ios
ip arp inspection vlan 10
ip arp inspection vlan 20
ip arp inspection vlan 40
ip arp inspection vlan 50
```


##### e. PortFast and BPDU Guard

**PortFast**

**問題：** 端口 link up 後，STP 默認要經過 listening、learning，約 30 秒才進入 forwarding。這段時間 PC 拿不到 DHCP 地址，開機後網絡像是「卡住」。

**作用：** 讓 access 口跳過這 30 秒，link up 立刻進 forwarding。

**只能用在連 PC、服務器、打印機的端口。** 連其他交換機的口不能開，否則可能短暫形成環路。

**BPDU Guard**

**問題：** 有人把一台交換機（或家用小路由器）接到 access 口。如果它參與 STP，可能搶成 root bridge，或造成環路，整個網絡癱瘓。

**作用：** 該端口一旦收到 BPDU（只有交換機才會發），立刻進入 **err-disabled** 狀態，端口關閉。

!!! warning "Warning"
	 BPDU Guard can shutdown a port if unexpected BPDUs are received. Do not blindly enable BPDU Guard on legitimate switch-to-switch trunk links. 

```cisco-ios
!portfast and bpdu guard
interface range fa0/1-24
	spanning-tree portfast  
	spanning-tree bpduguard enable  !remeber + enable
```


##### f. Uplink Port setting

```cisco-ios 
! Gig0/0

enable
config t
	interface Gig 0/1
		ip address 10.0.0.2 255.255.255.252
		no shutdown
		exit
	ip route 0.0.0.0 0.0.0.0 10.0.0.1
```



####  5.1.2 Route CLI 


- IP address settings
- LAN , WAN
- Route Table
- NAT / PAT


```cisco-ios
! Route
enable
config t
	interface GigabitEthernet0/0  !LAN Connection
		 description Uplink to switch
		 ip address 10.0.0.1 255.255.255.252
		 ip nat inside
		 no shutdown
		 exit
		 
	interface GigabitEthernet0/1   !WAN Connection
		description WAN Connection
		ip address 172.16.10.2 255.255.255.0
		ip nat outside
		no shutdown
		exit
	
	ip route 192.168.0.0 255.255.0.0 10.0.0.2 !回程路由
	access-list 1 permit 192.168.0.0 0.0.255.255
	ip nat inside source list 1 interface gig0/1 overload !PAT
	ip route 0.0.0.0 0.0.0.0 172.16.10.1 !next hop

```


#### 5.1.3 VLAN ACLs

-  Not allowed Guests access Employees, IT, Server

```cisco-ios
!create an extended ACL
enable
config t
	ip access-list extended VLAN-ACCESS-SECURITY
		remark Guests not allowed access Company network 
		deny ip 192.168.20.0 0.0.0.255 192.168.10.0 0.0.0.255
		deny ip 192.168.20.0 0.0.0.255 192.168.40.0 0.0.0.255
		deny ip 192.168.20.0 0.0.0.255 192.168.50.0 0.0.0.255
		permit ip 192.168.20.0 0.0.0.255 any 
		exit
	interface vlan 20
		ip access-group VLAN-ACCESS-SECURITY in !apply the ACL to the Guests VLAN
		exit
```











----
## References


[https://www.ciscopress.com/articles/article.asp?p=3089357&seqNum=5](https://www.ciscopress.com/articles/article.asp?p=3089357&seqNum=5) 


PPT 

