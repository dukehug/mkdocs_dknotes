
# Module-9-DHCPv4

2026-11-21 06:03

Tags: #network2 

Author:  Duke Hsu

---

## Topic 

1. DHCPv4 Steps to Obtain a Lease
2. DHCPv4 Steps to Renew a Lease
3. DHCPv4 Relay
4. DHCPv4 Hands on

Dynamic Host Configuration Protocol v4

Assigns IPv4 addresses and other network configuration information dynamically . 

## 1. DHCPv4 Steps to Obtain a Lease

a. DHCP Discover :  DHCPv4 Client -------> DHCPv4 Server

b. DHCP Offer :     DHCPv4 Server (Unicast) ---------> DHCPv4 Client

c. DHCP Request:  DHCPv4 Client (Broadcast) --------> DHCPv4 Server

d. DHCP Acknowledgment : DHCPv4 Server (Unicast) -----------> DHCPv4 Client




## 2. DHCPv4 Steps to Renew a Lease


c. DHCP Request:  DHCPv4 Client (Broadcast) --------> DHCPv4 Server

d. DHCP Acknowledgment : DHCPv4 Server (Unicast) -----------> DHCPv4 Client



## 3. DHCPv4 Relay 

[DHCP-v4-Relay](DHCP-v4-Relay.md)


## 4. DHCPv4 Server Hands on 

```cisco-ios
enable
config t
	interface gig0/1
		ip address 192.168.1.1 255.255.255.0
		description LAN-Interface
		no shutdown
		exit
	ip dhcp excluded-address 192.168.1.1 192.168.1.100
	ip dhcp pool LAN_DHCP_POOL
		default-router 192.168.1.1
		network 192.168.1.0 255.255.255.0
		dns-server 1.1.1.1
		domain-name duke.com
		end
		
show running-config | section dhcp
show ip dhcp binding 
show ip dhcp pool
	
```






----
## References
