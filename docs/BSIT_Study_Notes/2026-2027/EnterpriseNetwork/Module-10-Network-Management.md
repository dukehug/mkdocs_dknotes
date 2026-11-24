
# Module-10-Network-Management

2026-11-20 16:36

Tags: #enterpriseNetwork 

Author:  Duke Hsu

---

## Topic 

1. CDP
2. LLDP
3. NTP
4. SNMP
5. Syslog
6. Router and Switch File Maintenance


## 1. CDP 

CDP is a Cisco proprietary Layer 2 protocol that is used to gather information about Cisco devices which share the same data link. CDP is media and protocol  independent and runs on all Cisco devices, such as routers , switches, and access servers. 

The device sends periodic CDP advertisements to connected devices. There advertisements share information about the type of device that is discovered, the name of the devices, and the number and type of the interfaces. 


## 1.1 Configure and Verify CDP

```cisco-ios
enable
show cdp
config t
	cdp run
	end
show cdp 

config t
	no cdp run
	end
show cdp 

!enable cdp on interface
config t
	interface gig0/1
		cdp enable
		end

show cdp neighbors
show cdp neighbors details


!disable cdp on interface
config t
	interface gig0/1
		no cdp enable
		end

show cdp neighbors
```
 

## 2. LLDP

LLDP (Link Layer Discovery Protocol) is a vendor-neutral neighbor discovery protocol similar to CDP. LLDP works with network devices, such as routers, switches, and wireless, LAN access points. This protocol advertises its identity and capabilities to other devices and receives the information form a  physically-connected Layer 2 devices. 

## 2.1 Configure and Verify LLDP

```cisco-ios
enable
config t
	lldp run !global enable lldp
	interface gig0/1
		lldp transmit !set up this interface transmit only 
		lldp receive  !set up this interface receive only 
		end

show lldp
show lldp neighbors

```

- `lldp run `  Enable  the lldp service in the  global config mode
- `no lldp run` Disable the lldp service in the global config mode
- `show lldp`  lldp status only 
- `show lldp neighbors`  lldp neighbors devices, interface , device-id 
- `show lldp neighbors detail`  lldp neighbor devices details. 


## 3. NTP 

Network Time Protocol 

The software clock on a route or switch starts when the system boots. It is the primary source of the time for the system. It is important to synchronized the time across all devices on the network. 

Purpose 

- Debug
- System log

!!! note Note
	NTP uses UDP port 123 and is documented in RFC 1305

## 3.1  NTP Operation 

**Stratum**

NTP networks use a hierarchical system of time sources. Each level in this hierarchical system is called a stratum .  The stratum level is defined as the number of hop counts from the authoritative source . The synchronized time is distributed across the network by using NTP

The max hop count is 15. 

If the stratum 16, the lowest stratum level indicates that a device is unsynchronized. 


|Stratum|Source|Typical accuracy|Use case|
|---|---|---|---|
|**Stratum 0**|Atomic clock, GPS, DCF77, WWVB|1 ns — 1 µs|Physical reference (not NTP)|
|**Stratum 1**|Direct connection to Stratum 0 (PPS, serial)|1 — 10 µs|HF trading, broadcast, metrology|
|**Stratum 2**|NTP over one or more Stratum 1 servers|100 µs — 1 ms|Public servers (pool.ntp.org), datacenters|
|**Stratum 3**|NTP over a Stratum 2|1 — 10 ms|Enterprise servers, Active Directory|
|**Stratum 4**|NTP over a Stratum 3|5 — 20 ms|Workstations, IoT, home routers|
|**Stratum 5−15**|Deep cascade (rare in practice)|> 20 ms|Internal propagation on very large networks|
|**Stratum 16**|Unsynchronized (special value)|—|Invalid server, ignored by clients|

## 3.2 Configure and Verify NTP

```cisco-ios
enable
show clock detail

config t
	ntp server 209.165.200.225
	end
show clock detail
show ntp status
show ntp associations

!manual set up time
clock set 20:36:00 Nov 22 2026

```

## 4. SNMP

SNMP was developed to allow administrators to manage nodes on an IP network . It enables network administrators to monitor and manage network performance, find an solve network problems, and plan for network growth . 

Simple Network Management Protocol   = SNMP

- Centralized software that polls devices for metrics , issues configuration changes, and receives alerts. 
- SNMP Agent software running on a managed device that collects local metrics maintains device data , and communicates with the manager. 
- Management Information Base (MIB)  A hierarchical database defining  managed variables using unique Object Identifiers (OIDs) 


**MIB**


![](https://docs.oracle.com/cd/E72452_01/tuxedo/docs1222/snmpmref/images/1tmib.01.1.2.jpg)



**Operations**:

- Get  - Single
- GetNext  - Sequential 
- GetBulk   - large blocks of data from an agent
- Set - Manager modifies a writable variable on a managed device
- Response - Agent returns requested values of confirms a `Set` operation
- Trap  - Agent sends an unsolicited alert to the manager when a specific event occurs 
- Inform  -  Agent sends an alert to the manager and expects and acknowledgement retrying if needed. 

**Version**

- SNMP v1: 32bit, clear-text, original standard
- SNMP v2: 64bit, GetBulk, Inform, plaintext 
- SNMP v3: Adds authentication, encryption, and access control (USM/VACM) to protect data in transit; recommended for production networks


SNMP agents on UDP 161
SNMP manager on UDP 162

## 5. Syslog

Syslog uses UDP port 514  to send event notification messages across IP networks to event message collectors. 

The syslog protocol starts by sending system messages and debug output to a local logging process. Syslog configuration may send these messages across the network to an eternal syslog server, where they can be retrieved without needing to access the actual device. 

internal buffer = viewable through the CLI of the device 

- Logging buffer (RAM inside a router or switch)
- Console line
- Terminal line
- Syslog  server

**SYSLOG Levels**

![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE6HAcrKzFTlWq6WCe-En5Ic9qjD9ML4nWL8XSidEprfSswJbsmfptTOEJ&s=10)


**Use the command to force logged events to display the date and time**

```cisco-ios
enable
config t
	service timestamps log datetime
```

## 6. Router File Systems

```
enable
config t
	show file systems
	dir
	cd nvram: !some device no this command 
	pwd   !some device no this command
	dir
	
```

## 6.1  Management txt file 

- export and import txt file 
- copy the config txt  to tftp 
- copy the config txt to usb 


## 6.2 Password Recovery Procedures

Step 1. Enter the **ROMMON** mode.  
Step 2. Change the configuration register.  
Step 3. Copy the startup-config to the running-config.  
Step 4. Change the password.  
Step 5. Save the running-config as the new startup-config.  
Step 6. Reload the device.



### Step 1 Enter the ROMMON mode


- Connect a console cable and open your terminal emulator (such as PuTTY).

- Power off the device, then power it back on. 

- As soon as initial boot output appears, repeatedly send a break signal until you reach the `rommon >` or `switch:` prompt:
    - **Ctrl + C** (commonly used on newer IOS XE platforms and simulators).





----
## References

https://ntp.rdem-systems.com/en/ntp-stratum-levels.php

https://docs.oracle.com/cd/E72452_01/tuxedo/docs1222/snmpmref/1tmib.html