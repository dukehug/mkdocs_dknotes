# Network 2 Final Project — HomeMe Hotel (English Version)

Created: 2026-11-17 | Updated: 2026-11-22
Author: Duke Hsu | Tags: #network2

> Purpose: Project defense, group handover, and a command reference organized by function.


## 1. IP Addressing and Interface Reference

### 1.1 VLANs and HSRP

| VLAN | Purpose | Subnet | HSRP VIP / Client Gateway | MS-0 | MS-1 |
| ---- | ------------------ | -------------- | ----------------------- | ----------- | ----------- |
| 10   | Management Dept    | 10.10.2.0/27   | 10.10.2.1               | 10.10.2.2   | 10.10.2.3   |
| 20   | Finance            | 10.10.2.32/27  | 10.10.2.33              | 10.10.2.34  | 10.10.2.35  |
| 30   | Front Desk         | 10.10.2.64/27  | 10.10.2.65              | 10.10.2.66  | 10.10.2.67  |
| 40   | Meeting Room       | 10.10.2.96/27  | 10.10.2.97              | 10.10.2.98  | 10.10.2.99  |
| 50   | CEO Office         | 10.10.2.128/28 | 10.10.2.129             | 10.10.2.130 | 10.10.2.131 |
| 99   | Network Management | 10.10.2.160/27 | 10.10.2.161             | 10.10.2.162 | 10.10.2.163 |
| 100  | Guest              | 10.10.0.0/23   | 10.10.0.1               | 10.10.0.2   | 10.10.0.3   |

VLAN10 serves the Management Department, whereas VLAN99 is dedicated to managing network devices. These VLANs have different access permissions. The /27 subnet mask is `255.255.255.224`, /28 is `255.255.255.240`, and /23 is `255.255.254.0`. The subnets do not overlap; the Guest /23 subnet includes both 10.10.0.x and 10.10.1.x.

### 1.2 Access Switches and Uplinks

  
| Switch | VLAN99 IP /27 | Gi0/1 Peer | Gi0/2 Peer |
| --- | --- | --- | --- |
| S0 | 10.10.2.180 | MS-0 Gi1/0/1 | MS-1 Gi1/0/1 |
| S1 | 10.10.2.181 | MS-0 Gi1/0/2 | MS-1 Gi1/0/2 |
| S2 | 10.10.2.182 | MS-0 Gi1/0/3 | MS-1 Gi1/0/3 |
| S3 | 10.10.2.183 | MS-0 Gi1/0/4 | MS-1 Gi1/0/4 |
| S4 | 10.10.2.184 | MS-0 Gi1/0/5 | MS-1 Gi1/0/5 |

All access switches use `10.10.2.161` as their management default gateway. Gi1/0/21 and Gi1/0/22 between MS-0 and MS-1 belong to Port-channel1.

| Device | Access Ports | VLAN | Purpose |
| --- | --- | --- | --- |
| S0 | Fa0/1–22 | 100 | Guest AP / guest-room access |
| S0 | Fa0/23 | 30 | Front Desk AP |
| S0 | Fa0/24 | 99 | Network management PC |
| S1–S3 | Fa0/1–22 | 100 | Guest AP / guest-room access |
| S1–S3 | Fa0/23–24 | 99 | Network management PC access ports |
| S4 | Fa0/1–19 | 100 | Guest AP / guest-room access |
| S4 | Fa0/20 | 10 | Management Dept AP |
| S4 | Fa0/21 | 20 | Finance AP |
| S4 | Fa0/22 | 40 | Meeting Room AP |
| S4 | Fa0/23 | 50 | CEO AP |
| S4 | Fa0/24 | 99 | Network management PC |

 

### 1.3 Routed Links and WAN Connections

| Link | Endpoint A | Endpoint B | Subnet |
| --- | --- | --- | --- |
| MS-0 ↔ R0 | MS-0 Gi1/0/24: 10.10.255.2 | R0 Gi0/1/0 → Vlan201: 10.10.255.1 | 10.10.255.0/30 |
| MS-1 ↔ R1 | MS-1 Gi1/0/24: 10.10.255.6 | R1 Gi0/1/0 → Vlan203: 10.10.255.5 | 10.10.255.4/30 |
| MS-0 ↔ R1 | MS-0 Gi1/0/23: 10.10.255.10 | R1 Gi0/1/1 → Vlan204: 10.10.255.9 | 10.10.255.8/30 |
| R0 ↔ R1 | R0 Gi0/0/1: 10.10.255.13 | R1 Gi0/0/1: 10.10.255.14 | 10.10.255.12/30 |
| MS-1 ↔ R0 | MS-1 Gi1/0/23: 10.10.255.18 | R0 Gi0/1/1 → Vlan202: 10.10.255.17 | 10.10.255.16/30 |
| R0 ↔ ISP | R0 Gi0/0/0: 112.12.57.188 | ISP Gi0/0: 112.12.57.189 | 112.12.57.184/29 |
| R1 ↔ ISP | R1 Gi0/0/0: 112.12.57.196 | ISP Gi0/1: 112.12.57.197 | 112.12.57.192/29 |
| ISP ↔ Server | ISP Gi0/2: 210.5.98.129 | Server: 210.5.98.130 (existing test destination) | 210.5.98.128/29 |

The routers’ GigabitEthernet0/1/x interfaces are Layer 2 ports on the switch module. IP addresses are assigned to the corresponding SVIs, such as Vlan201 and Vlan202. On the multilayer switches, Gi1/0/23–24 are converted to Layer 3 ports with `no switchport`. These two interface types require different configuration methods.

## 2. VLANs, Trunks, and Access Ports

### 2.1 Create VLANs: MS-0, MS-1, and S0–S4

 

```cisco-ios
enable
config t
	! Create departmental, management and guest VLANs
	spanning-tree mode rapid-pvst
	vlan 10
		name Management_Dept
		exit
	vlan 20
		name Finance_Dept
		exit
	vlan 30
		name Front_Desk
		exit
	vlan 40
		name Meeting_Room
		exit
	vlan 50
		name CEO_Office
		exit
	vlan 99
		name Network_Management
		exit
	vlan 100
		name Guest_Network
		exit
	end
```

```cisco-ios
enable
! Verify configuration and operational state
show vlan brief
show spanning-tree summary
```

### 2.2 Uplink Trunks

**MS-0, MS-1:**

```cisco-ios
enable
config t
	! Carry all project VLANs; native VLAN must match both ends
	interface range GigabitEthernet1/0/1 - 5
		switchport mode trunk
		switchport trunk native vlan 99
		switchport trunk allowed vlan 10,20,30,40,50,99,100
		no shutdown
		exit
	end
```

**S0–S4:**

```cisco-ios
enable
config t
	! Carry all project VLANs; native VLAN must match both ends
	interface range GigabitEthernet0/1 - 2
		switchport mode trunk
		switchport trunk native vlan 99
		switchport trunk allowed vlan 10,20,30,40,50,99,100
		no shutdown
		exit
	end
```

**Verify**

```cisco-ios
enable
! Verify configuration and operational state
show interfaces trunk
```

Expected result: The uplinks and Po1 are trunking, the native VLAN is 99, and the allowed VLAN list includes 10, 20, 30, 40, 50, 99, and 100. Here, `Mode on` indicates that the interface is statically configured as a trunk.

### 2.3 Access-Port VLAN Assignments by Device

**S0:**

```cisco-ios
enable
config t
	! Enable PortFast by default on access ports
	spanning-tree portfast default
	! Assign access VLANs; do not apply these ranges to uplink trunks
	interface range FastEthernet0/1 - 22
		switchport mode access
		switchport access vlan 100
		no shutdown
		exit
	interface FastEthernet0/23
		switchport mode access
		switchport access vlan 30
		no shutdown
		exit
	interface FastEthernet0/24
		switchport mode access
		switchport access vlan 99
		spanning-tree bpduguard enable
		no shutdown
		exit
	end
```

**S1–S3:**

```cisco-ios
enable
config t
	! Enable PortFast by default on access ports
	spanning-tree portfast default
	! Assign access VLANs; do not apply these ranges to uplink trunks
	interface range FastEthernet0/1 - 22
		switchport mode access
		switchport access vlan 100
		no shutdown
		exit
	interface range FastEthernet0/23 - 24
		switchport mode access
		switchport access vlan 99
		spanning-tree bpduguard enable
		no shutdown
		exit
	end
```

**S4:**

```cisco-ios
enable
config t
	! Enable PortFast by default on access ports
	spanning-tree portfast default
	! Assign access VLANs; do not apply these ranges to uplink trunks
	interface range FastEthernet0/1 - 19
		switchport mode access
		switchport access vlan 100
		no shutdown
		exit
	interface FastEthernet0/20
		switchport mode access
		switchport access vlan 10
		no shutdown
		exit
	interface FastEthernet0/21
		switchport mode access
		switchport access vlan 20
		no shutdown
		exit
	interface FastEthernet0/22
		switchport mode access
		switchport access vlan 40
		no shutdown
		exit
	interface FastEthernet0/23
		switchport mode access
		switchport access vlan 50
		no shutdown
		exit
	interface FastEthernet0/24
		switchport mode access
		switchport access vlan 99
		spanning-tree bpduguard enable
		no shutdown
		exit
	end
```

The global command `spanning-tree portfast default` above enables PortFast by default on access ports. PortFast does not disable STP. See Section 8 for BPDU Guard and port security on the network management PC ports.

```cisco-ios
enable
! Verify configuration and operational state
show vlan brief
show interfaces FastEthernet0/24 switchport
show spanning-tree interface FastEthernet0/24 detail
```

### 2.4 Management IP Addresses for S0–S4

**S0:**

```cisco-ios
enable
config t
	! Management SVI and Layer 2 switch default gateway
	interface Vlan99
		ip address 10.10.2.180 255.255.255.224
		no shutdown
		exit
	ip default-gateway 10.10.2.161
	end
```

**S1:**

```cisco-ios
enable
config t
	! Management SVI and Layer 2 switch default gateway
	interface Vlan99
		ip address 10.10.2.181 255.255.255.224
		no shutdown
		exit
	ip default-gateway 10.10.2.161
	end
```

**S2:**

```cisco-ios
enable
config t
	! Management SVI and Layer 2 switch default gateway
	interface Vlan99
		ip address 10.10.2.182 255.255.255.224
		no shutdown
		exit
	ip default-gateway 10.10.2.161
	end
```

**S3:**

```cisco-ios
enable
config t
	! Management SVI and Layer 2 switch default gateway
	interface Vlan99
		ip address 10.10.2.183 255.255.255.224
		no shutdown
		exit
	ip default-gateway 10.10.2.161
	end
```

**S4:**

```cisco-ios
enable
config t
	! Management SVI and Layer 2 switch default gateway
	interface Vlan99
		ip address 10.10.2.184 255.255.255.224
		no shutdown
		exit
	ip default-gateway 10.10.2.161
	end
```

```cisco-ios
enable
! Verify configuration and operational state
show ip interface brief
show running-config | include ip default-gateway
ping 10.10.2.161
ping 210.5.98.130
```

For an SVI to become up/up, its VLAN must exist and have an active member port or trunk in the appropriate forwarding state. Access switches use `ip default-gateway` for their own management traffic. The multilayer switches use `ip routing` and their routing tables to forward traffic between subnets.

## 3. LACP EtherChannel and Rapid-PVST

The two physical links between the multilayer switches are bundled into Po1. STP treats the bundle as one logical link. EtherChannel can distribute multiple traffic flows across its members, but a single flow is not guaranteed to use the combined bandwidth of both links.

### 3.1 Common LACP Configuration: MS-0 and MS-1

This is the current configuration using active mode. The existing TXT files already specify LACP, so there is no need to remove and recreate the channel group.

```cisco-ios
enable
config t
	! Both members negotiate LACP actively
	interface range GigabitEthernet1/0/21 - 22
		switchport mode trunk
		switchport trunk native vlan 99
		switchport trunk allowed vlan 10,20,30,40,50,99,100
		channel-group 1 mode active
		no shutdown
		exit
	interface Port-channel1
		switchport mode trunk
		switchport trunk native vlan 99
		switchport trunk allowed vlan 10,20,30,40,50,99,100
		no shutdown
		exit
	end
```

**MS-0: STP priority 24576.**

```cisco-ios
enable
config t
	! Lower bridge priority is preferred as root
	spanning-tree mode rapid-pvst
	spanning-tree vlan 10,20,30,40,50,99,100 priority 24576
	end
```

**MS-1: STP priority 28672.**

```cisco-ios
enable
config t
	! Lower bridge priority is preferred as root
	spanning-tree mode rapid-pvst
	spanning-tree vlan 10,20,30,40,50,99,100 priority 28672
	end
```

```cisco-ios
enable
! Verify configuration and operational state
show etherchannel summary
show interfaces trunk
show spanning-tree vlan 99
show spanning-tree vlan 100
```

Expected result: Po1 shows `SU`, the protocol is `LACP`, and both Gi1/0/21 and Gi1/0/22 show `(P)`. `S` means Layer 2, `U` means in use, and `P` means the port is bundled in the port channel.

MS-0 should be the root bridge, provided no other device has a lower bridge priority. For VLAN99, the displayed priority may be 24675: the configured value of 24576 plus VLAN ID 99. A backup uplink on an access switch may be in the Alternate/Discarding state. This is normal STP loop prevention, not a link failure.

## 4. SVIs and HSRP

Clients use the VIP as their default gateway rather than the individual SVI IP address of MS-0 or MS-1. MS-0 has priority 110 and preemption enabled; MS-1 uses the default priority of 100. Under normal conditions, MS-0 is expected to be Active and MS-1 Standby. This is the intended behavior; use show commands to verify their current roles.

### MS-0

```cisco-ios
enable
config t
	! Enable inter-VLAN routing
	ip routing
	! Provide a shared virtual gateway on every client VLAN
	interface Vlan10
		ip address 10.10.2.2 255.255.255.224
		standby version 2
		standby 10 ip 10.10.2.1
		standby 10 priority 110
		standby 10 preempt
		no shutdown
		exit
	interface Vlan20
		ip address 10.10.2.34 255.255.255.224
		standby version 2
		standby 20 ip 10.10.2.33
		standby 20 priority 110
		standby 20 preempt
		no shutdown
		exit
	interface Vlan30
		ip address 10.10.2.66 255.255.255.224
		standby version 2
		standby 30 ip 10.10.2.65
		standby 30 priority 110
		standby 30 preempt
		no shutdown
		exit
	interface Vlan40
		ip address 10.10.2.98 255.255.255.224
		standby version 2
		standby 40 ip 10.10.2.97
		standby 40 priority 110
		standby 40 preempt
		no shutdown
		exit
	interface Vlan50
		ip address 10.10.2.130 255.255.255.240
		standby version 2
		standby 50 ip 10.10.2.129
		standby 50 priority 110
		standby 50 preempt
		no shutdown
		exit
	interface Vlan99
		ip address 10.10.2.162 255.255.255.224
		standby version 2
		standby 99 ip 10.10.2.161
		standby 99 priority 110
		standby 99 preempt
		no shutdown
		exit
	interface Vlan100
		ip address 10.10.0.2 255.255.254.0
		standby version 2
		standby 100 ip 10.10.0.1
		standby 100 priority 110
		standby 100 preempt
		no shutdown
		exit
	end
```

### MS-1

```cisco-ios
enable
config t
	! Enable inter-VLAN routing
	ip routing
	! Provide a shared virtual gateway on every client VLAN
	interface Vlan10
		ip address 10.10.2.3 255.255.255.224
		standby version 2
		standby 10 ip 10.10.2.1
		no shutdown
		exit
	interface Vlan20
		ip address 10.10.2.35 255.255.255.224
		standby version 2
		standby 20 ip 10.10.2.33
		no shutdown
		exit
	interface Vlan30
		ip address 10.10.2.67 255.255.255.224
		standby version 2
		standby 30 ip 10.10.2.65
		no shutdown
		exit
	interface Vlan40
		ip address 10.10.2.99 255.255.255.224
		standby version 2
		standby 40 ip 10.10.2.97
		no shutdown
		exit
	interface Vlan50
		ip address 10.10.2.131 255.255.255.240
		standby version 2
		standby 50 ip 10.10.2.129
		no shutdown
		exit
	interface Vlan99
		ip address 10.10.2.163 255.255.255.224
		standby version 2
		standby 99 ip 10.10.2.161
		no shutdown
		exit
	interface Vlan100
		ip address 10.10.0.3 255.255.254.0
		standby version 2
		standby 100 ip 10.10.0.1
		no shutdown
		exit
	end
```

```cisco-ios
enable
! Verify configuration and operational state
show ip interface brief
show standby brief
```

**Defense talking point:** HSRP protects the clients’ first-hop gateway. It does not automatically synchronize DHCP leases or NAT sessions. Shutting down R0 tests upstream routing/WAN redundancy; shutting down MS-0 allows you to observe MS-1 taking over the HSRP role. The existing TXT files do not configure HSRP interface tracking, so an upstream failure cannot be assumed to trigger an HSRP role change.

## 5. DHCP: MS-0 Only

Six pools serve VLAN10, 20, 30, 40, 50, and 100. VLAN99 uses static management addresses and has no NET_MGMT pool. All DHCP default gateways point to the corresponding HSRP VIPs.

```cisco-ios
enable
config t
	! Reserve gateways, switch addresses and additional static addresses
	ip dhcp excluded-address 10.10.2.1 10.10.2.3
	ip dhcp excluded-address 10.10.2.33 10.10.2.35
	ip dhcp excluded-address 10.10.2.65 10.10.2.67
	ip dhcp excluded-address 10.10.2.97 10.10.2.99
	ip dhcp excluded-address 10.10.2.129 10.10.2.131
	ip dhcp excluded-address 10.10.0.1 10.10.0.3
	ip dhcp excluded-address 10.10.2.4
	ip dhcp excluded-address 10.10.2.37
	ip dhcp excluded-address 10.10.2.68
	ip dhcp excluded-address 10.10.2.100
	ip dhcp excluded-address 10.10.2.132
	ip dhcp excluded-address 10.10.0.4
	! DHCP pools; DNS is an advertised address, not proof of DNS reachability
	ip dhcp pool MGMT_DEPT
		network 10.10.2.0 255.255.255.224
		default-router 10.10.2.1
		dns-server 8.8.8.8
		exit
	ip dhcp pool FINANCE
		network 10.10.2.32 255.255.255.224
		default-router 10.10.2.33
		dns-server 8.8.8.8
		exit
	ip dhcp pool FRONT_DESK
		network 10.10.2.64 255.255.255.224
		default-router 10.10.2.65
		dns-server 8.8.8.8
		exit
	ip dhcp pool MEETING
		network 10.10.2.96 255.255.255.224
		default-router 10.10.2.97
		dns-server 8.8.8.8
		exit
	ip dhcp pool CEO
		network 10.10.2.128 255.255.255.240
		default-router 10.10.2.129
		dns-server 8.8.8.8
		exit
	ip dhcp pool GUEST
		network 10.10.0.0 255.255.254.0
		default-router 10.10.0.1
		dns-server 8.8.8.8
		exit
	end
```

| Pool | Allocatable Addresses (Before Accounting for Existing Leases) | Count |
| --- | --- | --- |
| MGMT_DEPT | 10.10.2.5–30 | 26 |
| FINANCE | 10.10.2.36, 10.10.2.38–62 | 26 |
| FRONT_DESK | 10.10.2.69–94 | 26 |
| MEETING | 10.10.2.101–126 | 26 |
| CEO | 10.10.2.133–142 | 10 |
| GUEST | 10.10.0.5–10.10.1.254 | 506 |

```cisco-ios
enable
! Verify configuration and operational state
show ip dhcp pool
show ip dhcp binding
show ip dhcp conflict
```

**Verify on an end device**

```text
ipconfig /all
ping 10.10.2.33
```

 

**Limitation:** DHCP has no redundancy. If MS-0 is powered off, clients with valid existing leases can still route through MS-1, but new address assignments and lease renewals will be affected.

## 6. OSPF, Default Routes, WAN, and NAT

### 6.1 Routed Ports and OSPF on MS-0 and MS-1

**MS-0: **

```cisco-ios
enable
config t
	! Routed uplinks to the two routers
	interface GigabitEthernet1/0/23
		no switchport
		ip address 10.10.255.10 255.255.255.252
		no cdp enable
		no shutdown
		exit
	interface GigabitEthernet1/0/24
		no switchport
		ip address 10.10.255.2 255.255.255.252
		no cdp enable
		no shutdown
		exit
	! Form neighbors only on routed uplinks
	router ospf 1
		router-id 1.1.1.1
		log-adjacency-changes
		passive-interface default
		no passive-interface GigabitEthernet1/0/23
		no passive-interface GigabitEthernet1/0/24
		network 10.10.0.0 0.0.15.255 area 0
		network 10.10.255.0 0.0.0.255 area 0
		exit
	end
```

**MS-1:**

```cisco-ios
enable
config t
	! Routed uplinks to the two routers
	interface GigabitEthernet1/0/23
		no switchport
		ip address 10.10.255.18 255.255.255.252
		no cdp enable
		no shutdown
		exit
	interface GigabitEthernet1/0/24
		no switchport
		ip address 10.10.255.6 255.255.255.252
		no cdp enable
		no shutdown
		exit
	! Form neighbors only on routed uplinks
	router ospf 1
		router-id 2.2.2.2
		log-adjacency-changes
		passive-interface default
		no passive-interface GigabitEthernet1/0/23
		no passive-interface GigabitEthernet1/0/24
		network 10.10.0.0 0.0.15.255 area 0
		network 10.10.255.0 0.0.0.255 area 0
		exit
	end
```

### 6.2 Switch-Module SVIs and OSPF on R0 and R1

**R0:**

```cisco-ios
enable
config t
	! Create VLANs for the Layer 2 module ports
	vlan 201
		exit
	vlan 202
		exit
	interface GigabitEthernet0/1/0
		switchport mode access
		switchport access vlan 201
		no shutdown
		exit
	interface GigabitEthernet0/1/1
		switchport mode access
		switchport access vlan 202
		no shutdown
		exit
	interface Vlan201
		ip address 10.10.255.1 255.255.255.252
		no shutdown
		exit
	interface Vlan202
		ip address 10.10.255.17 255.255.255.252
		no shutdown
		exit
	interface GigabitEthernet0/0/1
		ip address 10.10.255.13 255.255.255.252
		no shutdown
		exit
	! Advertise internal links in area 0
	router ospf 1
		router-id 3.3.3.3
		log-adjacency-changes
		passive-interface default
		no passive-interface GigabitEthernet0/0/1
		no passive-interface Vlan201
		no passive-interface Vlan202
		network 10.10.255.0 0.0.0.255 area 0
		default-information originate
		exit
	end
```

**R1:**

```cisco-ios
enable
config t
	! Create VLANs for the Layer 2 module ports
	vlan 203
		exit
	vlan 204
		exit
	interface GigabitEthernet0/1/0
		switchport mode access
		switchport access vlan 203
		no shutdown
		exit
	interface GigabitEthernet0/1/1
		switchport mode access
		switchport access vlan 204
		no shutdown
		exit
	interface Vlan203
		ip address 10.10.255.5 255.255.255.252
		no shutdown
		exit
	interface Vlan204
		ip address 10.10.255.9 255.255.255.252
		no shutdown
		exit
	interface GigabitEthernet0/0/1
		ip address 10.10.255.14 255.255.255.252
		no shutdown
		exit
	! Advertise internal links in area 0
	router ospf 1
		router-id 4.4.4.4
		log-adjacency-changes
		passive-interface default
		no passive-interface GigabitEthernet0/0/1
		no passive-interface Vlan203
		no passive-interface Vlan204
		network 10.10.255.0 0.0.0.255 area 0
		exit
	end
```

All OSPF interfaces are in Area 0. `passive-interface default` prevents neighbor formation on client VLANs; only routed links explicitly configured as non-passive exchange Hello packets. On the multilayer switches, `network 10.10.0.0 0.0.15.255 area 0` selects interfaces that participate in OSPF. It does not automatically summarize all VLAN subnets into a single /20 route.

R0 is configured with `default-information originate`; R1 is not. With this basic form of the command, R0 must have a default route in its routing table before it advertises one. The advertisement is therefore not unconditional. Reference: [Cisco: Default Route Origination in OSPF](https://www.cisco.com/c/en/us/support/docs/ip/open-shortest-path-first-ospf/47868-ospfdb9.html). This Packet Tracer device previously accepted only the command without metric options, so these notes retain the supported form.

```cisco-ios
enable
! Verify configuration and operational state
show ip ospf neighbor
show ip protocols
show ip route ospf
show ip route
```

Expected result: Neighbors on active routed links reach the FULL state. Under normal conditions, the multilayer switches should see an `O*E2 0.0.0.0/0` route originated by R0. Do not infer the actual exit path solely from a router ID or an address returned by traceroute; verify it against the routing table and NAT information.

### 6.3 ISP: Three Directly Connected Subnets

```cisco-ios
enable
config t
	! Simulated ISP; addresses must start with 112 
	hostname ISP_ROUTER
	interface GigabitEthernet0/0
		ip address 112.12.57.189 255.255.255.248
		no shutdown
		exit
	interface GigabitEthernet0/1
		ip address 112.12.57.197 255.255.255.248
		no shutdown
		exit
	interface GigabitEthernet0/2
		ip address 210.5.98.129 255.255.255.248
		no shutdown
		exit
	end
```

```cisco-ios
enable
! Verify configuration and operational state
show ip interface brief
show ip route
```

### 6.4 R0 and R1: WAN, PAT, and Default Routes to the ISP

**R0:**

```cisco-ios
enable
config t
	! Mark the ISP-facing interface as NAT outside
	interface GigabitEthernet0/0/0
		ip address 112.12.57.188 255.255.255.248
		ip nat outside
		no shutdown
		exit
	! Mark internal routed interfaces as NAT inside
	interface Vlan201
		ip nat inside
		exit
	interface Vlan202
		ip nat inside
		exit
	interface GigabitEthernet0/0/1
		ip nat inside
		exit
	! Select private source addresses for PAT
	access-list 1 permit 10.10.0.0 0.0.255.255
	ip nat inside source list 1 interface GigabitEthernet0/0/0 overload
	! Send unknown destinations toward the ISP
	ip route 0.0.0.0 0.0.0.0 112.12.57.189
	end
```

**R1:**

```cisco-ios
enable
config t
	! Mark the ISP-facing interface as NAT outside
	interface GigabitEthernet0/0/0
		ip address 112.12.57.196 255.255.255.248
		ip nat outside
		no shutdown
		exit
	! Mark internal routed interfaces as NAT inside
	interface Vlan203
		ip nat inside
		exit
	interface Vlan204
		ip nat inside
		exit
	interface GigabitEthernet0/0/1
		ip nat inside
		exit
	! Select private source addresses for PAT
	access-list 1 permit 10.10.0.0 0.0.255.255
	ip nat inside source list 1 interface GigabitEthernet0/0/0 overload
	! Send unknown destinations toward the ISP
	ip route 0.0.0.0 0.0.0.0 112.12.57.197
	end
```

ACL 1 selects source addresses for translation; it is not applied to an interface to filter traffic. `overload` allows multiple private addresses to share a WAN IP address. R0 and R1 maintain separate NAT tables, so existing connections may need to be re-established after the exit router changes. Session continuity is not guaranteed.

```cisco-ios
enable
! Verify configuration and operational state
show ip route
show ip nat translations
show ip nat statistics
show access-lists 1
```

First, ping `210.5.98.130` from a client, then inspect the NAT translations and statistics. The external server uses `210.5.98.129` as its default gateway.

### 6.5 MS-0 and MS-1: Floating Static Default Routes via R1

**MS-0:**

```cisco-ios
enable
config t
	! AD 150 is less preferred than the OSPF default route (AD 110)
	ip route 0.0.0.0 0.0.0.0 10.10.255.9 150
	end
```

**MS-1:**

```cisco-ios
enable
config t
	! AD 150 is less preferred than the OSPF default route (AD 110)
	ip route 0.0.0.0 0.0.0.0 10.10.255.5 150
	end
```

```cisco-ios
enable
! Verify configuration and operational state
show running-config | include ip route
show ip route
```

Under normal conditions, OSPF’s administrative distance (AD) of 110 takes precedence over the backup static route’s AD of 150. Seeing R1 as a next hop in running-config therefore does not mean it is currently being used. If the OSPF default route disappears and the R1 next hop remains reachable, an `S*` backup default route is expected to be installed.

**Limitation:** The current configuration has no IP SLA or tracking. If a remote ISP failure occurs while R0’s local default route remains installed, R0 may continue advertising a default route. Automatic failover to R1 is therefore not guaranteed for every upstream failure. Source-based routing and the corresponding NAT configuration for the new dedicated Guest WAN are not included in this set of TXT files and must not be presented as a verified path.

## 7. ACLs: Guest Isolation and Management Access

### 7.1 Policies and Application Points

| Source | Destination / Service | Expected Result |
| --- | --- | --- |
| VLAN99 | Ping internal subnets, SSH to hotel network devices, and access the external test network | Allow |
| VLAN10–50 | Interdepartmental communication, ping network devices, and access the external test network | Allow |
| VLAN10–50 | Initiate new SSH connections to network devices | Deny |
| VLAN100 | Initiate access to departmental subnets, VLAN99, or 10.10.255.0/24 | Deny |
| VLAN100 | Reply to pings from VLAN99 | Allow echo-reply |
| VLAN100 | External test network and DHCP | Allow |

Guest pings to its own gateway, SVIs in the same VLAN, and other reachable router addresses are accepted exceptions under the current requirements. The policy does not claim to block ping to every IP address on every device. Communication within VLAN99 normally does not pass through these SVI inbound ACLs.

Both multilayer switches need identical ACLs applied at the same locations so that the policy remains consistent after an HSRP role change. `in` refers to traffic entering Layer 3 routing from that VLAN, not traffic sent from the switch toward clients.

### 7.2 GUEST_IN: MS-0 and MS-1

The rule order first permits DHCP broadcasts and ping replies to the management network, then blocks internal destinations, and finally permits the remaining Guest traffic.

```cisco-ios
enable
config t
	! ACL order is significant
	ip access-list extended GUEST_IN
		remark Allow DHCP discovery and rebinding
		permit udp any eq bootpc host 255.255.255.255 eq bootps
		remark Allow replies to network management VLAN
		permit icmp 10.10.0.0 0.0.1.255 10.10.2.160 0.0.0.31 echo-reply
		remark Block departmental and management networks
		deny ip any 10.10.2.0 0.0.0.255
		remark Block router and switch point-to-point links
		deny ip any 10.10.255.0 0.0.0.255
		remark Allow guest traffic to remaining destinations
		permit ip 10.10.0.0 0.0.1.255 any
		exit
	interface Vlan100
		ip access-group GUEST_IN in
		exit
	end
```

### 7.3 DEPT_IN: MS-0 and MS-1

```cisco-ios
enable
config t
	! Permit required ICMP and return TCP before blocking management access
	ip access-list extended DEPT_IN
		remark Allow ping (echo) to VLAN 99 devices
		permit icmp any 10.10.2.160 0.0.0.31 echo
		remark Allow replies to management VLAN
		permit icmp any 10.10.2.160 0.0.0.31 echo-reply
		permit tcp any 10.10.2.160 0.0.0.31 established
		remark Block all other new connections to management VLAN (SSH etc.)
		deny ip any 10.10.2.160 0.0.0.31
		remark Allow other traffic
		permit ip any any
		exit
	interface Vlan10
		ip access-group DEPT_IN in
		exit
	interface Vlan20
		ip access-group DEPT_IN in
		exit
	interface Vlan30
		ip access-group DEPT_IN in
		exit
	interface Vlan40
		ip access-group DEPT_IN in
		exit
	interface Vlan50
		ip access-group DEPT_IN in
		exit
	end
```

`echo` allows departments to initiate pings to VLAN99; `echo-reply` allows departments to reply to pings initiated from VLAN99. `established` checks only the TCP ACK/RST bits. It does not maintain a connection state table and is not a stateful firewall. The subsequent deny rule blocks ordinary new connections, while the final permit rule preserves other interdepartmental and external traffic. Reference: [Cisco: ACL established Definition](https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/security/a1/sec-a1-cr-book/sec-cr-a2.html).

Departmental traffic to the 10.10.255.x addresses on R0 and R1 is not blocked by the VLAN99 destination rules above. SSH access to those devices is protected by the VTY source ACL in Section 9.

```cisco-ios
enable
! Verify configuration and operational state
show access-lists GUEST_IN
show access-lists DEPT_IN
show running-config | section interface Vlan100
show running-config | section interface Vlan10
show ip interface Vlan100
show standby brief
```

If Packet Tracer’s `show ip interface` output disagrees with the ACL binding in running-config, do not determine success or failure from one field alone. Check `ip access-group`, run controlled allow/deny tests, and compare the match counts of the corresponding access control entries (ACEs). Previously accumulated permit matches alone do not prove that the current deny rules work.

## 8. Port Security: Designated Network Management PC Ports

These restrictions apply to the network management PC’s access ports, not AP uplinks or switch trunks. The existing TXT files already record sticky MAC address `0090.0CCD.1B23`. This authorizes a specific PC rather than every computer in VLAN99.

| Devices | Protected Interfaces |
| --- | --- |
| S0, S4 | FastEthernet0/24 |
| S1, S2, S3 | FastEthernet0/23–24 |

### 8.1 S0 and S4

```cisco-ios
enable
config t
	! Preserve the authorized management PC MAC
	interface FastEthernet0/24
		switchport mode access
		switchport access vlan 99
		switchport port-security
		switchport port-security maximum 1
		switchport port-security violation restrict
		switchport port-security mac-address sticky
		switchport port-security mac-address sticky 0090.0CCD.1B23
		spanning-tree portfast
		spanning-tree bpduguard enable
		no shutdown
		exit
	end
```

### 8.2 S1, S2, and S3

```cisco-ios
enable
config t
	! The exported configuration records the same authorized MAC on both ports
	interface range FastEthernet0/23 - 24
		switchport mode access
		switchport access vlan 99
		switchport port-security
		switchport port-security maximum 1
		switchport port-security violation restrict
		switchport port-security mac-address sticky
		switchport port-security mac-address sticky 0090.0CCD.1B23
		spanning-tree portfast
		spanning-tree bpduguard enable
		no shutdown
		exit
	end
```

The TXT files record the same PC’s sticky MAC address on both ports of S1–S3. This does not mean that two different PCs are authorized. Moving the same MAC address between multiple secure ports on one switch still requires testing. The presence of configuration entries alone does not prove that switching between the two ports works.

`restrict` drops traffic from violating sources and increments the violation counter; it normally does not place the port in the err-disabled state. BPDU Guard provides separate protection: it can disable an access port that receives a BPDU. The two features have different triggers.

```cisco-ios
enable
! Verify configuration and operational state
show port-security interface FastEthernet0/24
show port-security address
show running-config | section interface FastEthernet0/24
```


## 9. SSH, Console Access, and enable Privileges

### 9.1 Login Flow and Common Configuration

Applies to MS-0, MS-1, R0, R1, and S0–S4; **the simulated ISP is excluded**.

`SSH / Console → Username and login password → Device> → enable → Password: → Device# → config t`

The user account has privilege level 1, so login initially opens the `>` prompt. Entering the enable secret elevates access to the `#` prompt. At privilege level 15, the user can run `config t`. The MOTD banner appears during login; IOS automatically displays `Password:` after the user enters `enable`.

The following plaintext credentials retain the original notes’ lab settings: username `HomeMe`, login password `password123`, and enable secret `enable123`. Capitalization must match.

```cisco-ios
enable
config t
	! Local login starts in user EXEC mode
	username HomeMe privilege 1 secret password123
	! Separate password for privileged EXEC mode
	enable secret enable123
	banner motd #Authorized users only. Log in with your username and password. Use enable and enter the enable password for administrative access.#
	ip domain-name homeme.local
	! Use SSH v2 only
	ip ssh version 2
	ip ssh time-out 60
	ip ssh authentication-retries 2
	line console 0
		login local
		privilege level 1
		exit
	end
```

**RSA key: Run this only on a new device that does not yet have keys.** Set the correct device hostname first. The command below prompts for the modulus size; enter `2048`, wait for key generation to finish, and then enter `end`.

```cisco-ios
enable
config t
	! Run only when RSA keys are absent
	crypto key generate rsa
	! At the modulus prompt, enter 2048; wait for key generation
	end
```

### 9.2 MS-0, MS-1, R0, and R1: Allow VTY Login Only from VLAN99

```cisco-ios
enable
config t
	! Restrict remote management by source subnet
	ip access-list standard VTY_VLAN99_ONLY
		permit 10.10.2.160 0.0.0.31
		deny any
		exit
	line vty 0 4
		login local
		privilege level 1
		access-class VTY_VLAN99_ONLY in
		transport input ssh
		exec-timeout 5 0
		exit
	end
```

### 9.3 S0–S4: VTY Configuration

```cisco-ios
enable
config t
	! Apply SSH and local login to both VTY ranges
	line vty 0 4
		login local
		privilege level 1
		transport input ssh
		exec-timeout 5 0
		exit
	line vty 5 15
		login local
		privilege level 1
		transport input ssh
		exec-timeout 5 0
		exit
	end
```

The S0–S4 TXT files **do not contain** `access-class VTY_VLAN99_ONLY in`. When departmental traffic crosses VLANs through a multilayer switch to reach an access switch’s management IP, DEPT_IN blocks new SSH connections; GUEST_IN blocks Guest access. This meets the current policy for those network paths, but it does not mean that each access switch has its own VTY source ACL. Devices in VLAN99 still need valid credentials to log in.

`exec-timeout 5 0` disconnects an idle session after five minutes. `ip ssh time-out 60` sets the timeout for SSH authentication. These settings serve different purposes.

```cisco-ios
enable
! Verify configuration and operational state
show ip ssh
show running-config | include username
show running-config | section line vty
show users
show privilege
```

On the four devices with VTY ACLs, also run:

```cisco-ios
enable
! Verify configuration and operational state
show access-lists VTY_VLAN99_ONLY
```

Test from a PC in VLAN99. After logging in, confirm that the prompt is `>` before entering `enable`. Enter credentials only at their corresponding prompts.

```text
ssh -l HomeMe 10.10.2.162
ssh -l HomeMe 10.10.2.163
ssh -l HomeMe 10.10.255.1
ssh -l HomeMe 10.10.255.5
ssh -l HomeMe 10.10.2.180
```



## 10. NTP and Saving Configurations

### 10.1 NTP: All 10 Devices

All TXT files specify `210.5.98.130`. Configuring a server does not prove that synchronization has completed; a successful ping only confirms ICMP reachability. In this lab, the 2960 switch’s inability to synchronize with NTP is recorded as a known bug.

```cisco-ios
enable
config t
	! Synchronize time with the external lab server
	ntp server 210.5.98.130
	end
```

```cisco-ios
enable
! Verify configuration and operational state
ping 210.5.98.130
show ntp associations
show ntp status
show clock
```

Confirm that the server’s NTP service is enabled and that routing provides reachability. Allow simulation time to pass, then check synchronization again. If a device model does not support a particular show subcommand, use the options listed by CLI `?` and retain the available association/clock evidence.

### 10.2 Save on Each Device After Verifying the Configuration

```cisco-ios
enable
! Save verified running configuration; accept the default destination filename
copy running-config startup-config
show startup-config
```

Save the Packet Tracer `.pkt` file and export both TXT configurations again. Running `copy running-config startup-config` on a device and saving the project in the application are separate actions. The next review should use TXT exports from the same PKT version.

## 11. Defense Verification Sequence and Evidence Checklist

The following is a **verification plan with expected results**, not a record of tests rerun during this review. For each test, record the source device/IP, destination IP, states before and after testing, and the result. Change only one condition at a time during failure tests, then restore it.

| Step | Test | Action / Evidence | Expected Result |
| --- | --- | --- | --- |
| 1 | Addressing and VLANs | show vlan brief, show interfaces trunk, and client ipconfig /all | Correct VLAN, mask, and VIP |
| 2 | LACP | show etherchannel summary; disable one member link, check again, then restore it | LACP and Po1 SU; communication continues over the remaining member |
| 3 | STP | show spanning-tree vlan 99; disconnect the access switch’s primary uplink and check again | Backup uplink forwards traffic; reconvergence occurs after restoration |
| 4 | HSRP | Continuously ping the VIP/external destination from a client with an existing lease; shut down MS-0 and run show standby brief on MS-1 | MS-1 becomes Active; do not confuse failure to obtain a new DHCP lease with HSRP failure |
| 5 | OSPF and exit path | show ip route on both multilayer switches; tracert 210.5.98.130 on a client | Under normal conditions, the OSPF default route points toward R0 |
| 6 | R0 failure | Keep R1 online and shut down R0; check routes, tracert, and R1 NAT | After convergence, the backup static route and R1 exit path are usable |
| 7 | Restore the primary route | Restore R0, wait for FULL neighbor states, and check routes and traceroute | The OSPF default route takes precedence again |
| 8 | Guest ACL | From Guest, ping departmental devices, VLAN99, and 10.10.255.x, then an external destination; compare ACL counters | Internal access denied and external access allowed, subject to the accepted address exceptions |
| 9 | Management and departmental ACLs | From VLAN99, test ping across subnets and SSH; from a department, ping devices and another department, then test SSH | Management tests succeed; departmental ping succeeds but SSH fails |
| 10 | Port security | Connect authorized and unauthorized PCs to the designated port in turn, generate traffic, and inspect the violation counter | Authorized traffic passes; violating traffic is dropped and the counter increases |
| 11 | NTP / applications | show ntp status; access the external server in a browser | Verify time synchronization and application service separately; ping is not a substitute |
| 12 | Save | copy running-config startup-config, save the PKT, and export TXT files | The submission, notes, and device configurations use the same version |

Common PC test commands: choose destinations expected to succeed or fail based on the source VLAN.

```text
ipconfig /all
ping 10.10.2.161
ping 10.10.2.180
ping 10.10.255.1
ping 210.5.98.130
tracert 210.5.98.130
ssh -l HomeMe 10.10.2.180
```

For interdepartmental tests, use endpoints that are actually online and whose addresses have been confirmed. Pinging only an SVI does not prove communication between two endpoints. Initial pings may be affected by ARP; wait for convergence, retry, and record the results.

## 12. Group Presentation Guide and Common Defense Questions

| Question | Key Answer |
| -------------------------------------- | ----------------------------------------------------------------------- |
| How do VLAN10 and VLAN99 differ? | VLAN10 serves the business Management Department. VLAN99 is the network device management subnet and is authorized as a source for management login. |
| Why do we need STP, LACP, and HSRP together? | STP prevents Layer 2 loops; LACP bundles physical links; HSRP maintains a virtual gateway for clients. They protect different parts of the network. |
| If R0 is the primary router, why do the multilayer switches have static routes via R1? | Those routes have an AD of 150, higher than OSPF’s 110. They serve as backups when the OSPF default route disappears. |
| Why can departments ping devices but not SSH to them? | ICMP echo is explicitly permitted. DEPT_IN blocks new connections to VLAN99, while the core switches and routers also have VTY source ACLs. |
| If Guest is isolated, why can a management PC still ping Guest? | GUEST_IN first permits echo-reply packets addressed to VLAN99, then denies Guest-initiated access to internal destinations. |
| Does permit ip any any override earlier deny rules? | No. ACLs are evaluated from top to bottom, and the first matching entry determines the action. Unmatched traffic is subject to an implicit deny. |
| Do both DHCP and HSRP have redundancy? | HSRP does; DHCP runs only on MS-0, with no lease synchronization or second DHCP server. Multiple DHCP servers can potentially cause address conflicts. |
| Is NAT synchronized to the backup router? | No. Each router performs PAT independently. Existing sessions may be interrupted when traffic switches to the other exit router. |
| Why is ip address unavailable on the switch module’s physical ports? | They are Layer 2 switchports. An access VLAN maps each port to an SVI that holds the IP address. |
| Can running-config alone prove that SSH and NTP work? | No. RSA keys, actual login, NTP synchronization, and live connectivity require separate verification. |


Group members can divide the presentation into addressing and VLANs → Layer 2 redundancy → HSRP/DHCP → OSPF/NAT → ACLs/SSH/port security → failure testing. Each member should be able to explain the purpose, application point, verification commands, and at least one limitation of their assigned feature.

## 13. References and Evidence Scope

- Primary source: The 20 device configuration TXT files reviewed in the Nov21 directory.
- IP addresses, ACL rule order, HSRP priorities, LACP mode, and management-port settings were checked against the TXT files. VLAN names, physical peer connections, endpoint/AP/server GUI settings, and live operational states cannot be verified from these TXT files alone.
- [Cisco: Default Route Origination in OSPF](https://www.cisco.com/c/en/us/support/docs/ip/open-shortest-path-first-ospf/47868-ospfdb9.html).
- [Cisco: ACL Commands and the established Condition](https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/security/a1/sec-a1-cr-book/sec-cr-a2.html).
