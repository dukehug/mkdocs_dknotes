
# Module-10-VLANs-and-InterVLAN

2026-11-14 07:19

Tags:  #network2 

Author:  Duke Hsu

---

## Topic 

1. VTP
2. Extended VLANs
3. DTP
4. VLAN Configure
5. VLAN Troubleshoot


## 1. VTP

VLAN Trunking Protocol (VTP) allows a network administrator to manage VLANs on a switch configured as a VTP server. 

-  VTP stores VLAN configurations in a database  named `vlan.dat`
- A switch can be configured in one of three VTP modes:
	-  Server
	- Client
	- Transparent 
	


| Mode        | Feature                                            | Synchronization other VLAN | Save on NVRAM |
| ----------- | -------------------------------------------------- | -------------------------- | ------------- |
| Server      | Add, Edit, Delete VLAN and send noti               | 是                          | 是             |
| Client      | Received VLAN information from Server , can't edit | 是                          | 否             |
| Transparent | 獨立管理自己的本地 VLAN，僅幫忙轉發 VTP 通告但不套用                    | 否                          | 是             |
| Off         | 完全不參與 VTP 運作，也不轉發任何 VTP 封包\|                       | 否                          | 是             |

**Three types of  Advertisements**

**a. Summary Advertisement** 

VTP Servers send summary advertisements every 300 seconds and every time a VLAN database change occurs.This advertisement carries information like VTP version, domain name, revision number, number of subset advertisements to follow, time-stamp, etc. If VLAN configuration changes, one or more subset advertisements follow the summary advertisement.


**b. Subset Advertisement** 

VTP Servers send subset advertisements after a VLAN configuration change occurs. These advertisements contain the specific changes that have been performed, like add or delete of a VLAN, change of name of a VLAN, status of a VLAN, etc.


**c. Advertisement  Request** 

A VTP Client may request any VLAN information. This could be due to the Client switch might be reset and has lost VLAN information or it might hear a higher revision number than its locally stored. The Server switch responds to these Advertisement Requests with a summary advertisement followed by a subset advertisement to bring the Client up-to-date.




| Advertisement             | Senter              | When                      | Content                      |
| ------------------------- | ------------------- | ------------------------- | ---------------------------- |
| **Summary Advertisement** | VTP Server / Client | 每 5 分鐘定期發送，或 VLAN 變更時立即發送 | VTP 網域名稱、修訂版號（Revision）、版本資訊 |
| **Subset Advertisement**  | VTP Server          | VLAN 新增、刪除、改名或收到請求時       | 具體的 VLAN ID、名稱、狀態與 MTU 等詳細清單 |
| **Advertisement Request** | VTP Client          | 交換器重啟、更改網域，或發現版本落後時       | 請求 Server 傳送最新 VLAN 資訊的指令    |

### 1.1 Extended VLAN

Normal range VLANs are identified by a VLAN ID between 1 and 1005

Extended range VLANs are identified by a VLAN ID between 1006 and 4094

!!!note Note
	 VTP does not learn extended range VLANs





### 1.2 VTP Configuration 

There are 5 steps to VTP configuration 

- Configure the VTP Server
- Configure the VTP Domain Name and Password
- Configure the VTP Clients
- Configure VLANs on the VTP Server
- Verify the VTP Clients have received the new VLAN information 

3 switchs

1 Core - SW = Server name: S1
2 Access - SW = Client name: S-Client-0 , 1

**Core-SW and Access-SW**. 

trunk interface

```cisco-ios
enable
config t
	interface range gig0/1 - 2
	switchport mode trunk
	no shutdown 
	end

show interface trunk
```


**VTP Server**

!!! warning Warning 
	 VTP domain name case sensitive 



```cisco-ios
enable
config t
	vtp mode server
	vtp domain CISCO_LAB
	vtp password cisco123
	vtp version 2
	end

show vtp status


```

 ![image.png](https://img.dukehsu.com/study_note/20261120211144832.webp)


**Create VLAN**

```cisco-ios
enable
config t
	vlan 10
	name sales
	vlan 20
	name guest
	end

show vlan brief

```


**VTP Client**

![image.png](https://img.dukehsu.com/study_note/20261120211731984.webp)


```cisco-ios

enable
config t
	vtp mode client
	vtp domain CISCO_LAB
	vtp password cisco123
	vtp version 2
	end
	
	
show vtp status
show vlan brief
```

![image.png](https://img.dukehsu.com/study_note/20261120212144086.webp)


Popular problem : VLAN  No synchronization

check the wried , trunk port 





###  1.3 VTP Transparent mode


![image.png](https://img.dukehsu.com/study_note/20261120214128397.webp)


**S1 VTP Server**

```cisco-ios
enable
config t
!change the interface to trunk mode
	interface gig0/1
	switchport mode trunk 
	exit
	

!configuration the VTP Server
	vtp mode server
	vtp domain DUKE
	vtp password cisco
	vtp version 2
	exit
	
!create 2 VLAN
	vlan 10
		name Finance_Dept
		exit
	vlan 20 
		name IT_Dept
		end

!verify
show vtp status
show interface trunk
show vlan brief



```


**S2 Transparent Switch** 

```cisco-ios
enable
config t 
	vtp mode transparent
	show domain CCNA
	vtp passowrd cisco
	vtp version 2
	exit
	vlan 333
		name Local_Test 
		exit
	end

show vtp status
show vlan brief
```


### S3 VTP Client

```cisco-ios
enable
config t
	vtp mode client
	vtp domain DUKE
	vtp password cisco
	end

show vlan brief
```




**Troubleshoot VTP**

- Incompatible VTP versios
- VTP password issues
- Incorrect VTP Domain Name
- All switches set to client mode
- Incorrect Configuration Revision


**Troubleshoot DTP**

- Trunk mode mismatches
- Allowed VLANs on trunks
- Native VLAN mismatches


## 2. DTP  - Dynamic Trunking Protocol

DTP manages trunk negotiation only if the port on the neighbor switch is configured in a trunk mode that supports DTP

!!! warning Warning 
	 Turn off DTP on interfaces on a Cisco switch that is connected to devices that do not support DTP

DTP relies on different switchport modes to decide if a trunk will form:

- **Dynamic Auto:** The port passively waits to become a trunk. It will form a trunk only if the neighboring switch is set to _Trunk_ or _Dynamic Desirable_.

- **Dynamic Desirable:** The port actively sends DTP frames to convert the link into a trunk. It will form a trunk if the neighbor is set to _Trunk_, _Dynamic Desirable_, or _Dynamic Auto_.

- **Trunk:** Forces the port to become a permanent trunk and sends DTP frames to convince the neighbor to do the same.

- **Access:** Forces the port into a permanent non-trunking (access) state and disables DTP negotiation.

DTP Hands on 

SW1 gig0/1 -------SW2 gig0/1


![image.png](https://img.dukehsu.com/study_note/20261121054438184.webp)



SW1

```cisco-ios
enable
config t
	interface gig0/1
		switchport mode dynamic desirable
		end

```

SW2

```cisco-ios
enable
show interface trunk
```

**Turn off DTP**

SW1 and SW2 same command 

```cisco-ios
enable
config t
	interface gig0/1
	switchport mode trunk
	switchport nonegotiate
	end
show interface trunk 
```



----
## References
