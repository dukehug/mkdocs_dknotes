
# DHCP v4 Relay Practice

2026-11-07 13:36

Tags:  #network2 

Author:  Duke Hsu


---

## Topic 

1. DHCP Relay
2. DHCP Relay Hands-on



## 1. DHCP Relay

A DHCP relay (DHCP relay agent) is a networking function typically hosted on a router or Layer 3 switch that forwards DHCP messages between clients on one subnet and a DHCP server located on a different subnet 

### 1.1 How It Works

- **The Broadcast Problem:** When a new device joins a network, it sends a ==broadcast== message (`DHCPDISCOVER`) looking for an IP address. Standard routers block broadcasts from crossing subnets, meaning the client cannot directly reach a DHCP server on another network.

- **The Relay Solution:** A router configured with DHCP relay (often called an _IP helper address_) intercepts this local broadcast. 

- **Conversion to Unicast:** The relay agent fills in the **giaddr** (Gateway IP Address) field with its own interface address to tell the server which subnet the request came from. It then repackages the message as a ==**unicast**== packet and sends it directly to the remote DHCP server.

- **The Return Path:** When the DHCP server sends back an offer, it replies to the relay agent, which then delivers the configuration to the client

### 1.2 Why Use DHCP Relay?

- **Centralized Management:** You don't need a DHCP server on every single branch or department subnet; one central server (or redundant pair) can manage IP allocation for your entire organization. 

- **Cost and Complexity Reduction:** It lowers hardware and administrative overhead across multi-site networks, remote locations, or complex VPN/tunnel setups. 

### Main Use Cases

- **Large enterprise networks and multi-VLAN environments:**  
    A company may separate its network into multiple departments or user groups, such as Sales, IT, and Guest VLANs. Instead of deploying a separate DHCP server for every VLAN, the network administrator can deploy one centralized DHCP server and enable DHCP Relay on the Layer 3 switches or routers for each VLAN.
    
- **Multiple subnets or remote branch offices:**  
    Routers or firewalls can forward DHCP requests so that a centralized DHCP server at headquarters can manage IP address allocation for remote branches or different subnets.

## 2. Hands-on


### 2.1 Example 

![image.png](https://img.dukehsu.com/study_note/20261107140559994.webp)

 

**Independent DHCP Server + Relay:** Suitable for networks with many subnets, such as dozens of VLANs, where centralized management is needed. It is also useful when you need to keep DHCP lease records, integrate with IPAM or Windows AD/DNS, or configure advanced DHCP options such as PXE boot and VoIP phone settings.

**R1 config:**

```cisco-ios
enable
config t
	interface g0/0
		ip address 192.168.10.1 255.255.255.0
		ip helper-address 192.168.11.1
		description DHCP_RELAY_Giaddr_10
		no shutdown
		exit
	interface g0/1
		ip address 192.168.11.2 255.255.255.0
		description DHCP_SERVER_DEFAULT_GATEWAY
		no shutdown
		exit
	ip route 192.168.9.0 255.255.255.0 192.168.11.3  !for .9 subnet
	exit
	
copy running-config startup-config
		
```


**R2 config:**

```cisco-ios
enable
config t
	interface g0/1
		ip address 192.168.9.1 255.255.255.0
		ip helper-address 192.168.11.1
		description DHCP_RELAY_Giaddr_9
		no shutdown
		exit
	interface g0/0
		ip address 192.168.11.3
		description DHCP_SERVER_SUBNET_11
		exit
	exit

copu running-config startup-config
```



----
## References
