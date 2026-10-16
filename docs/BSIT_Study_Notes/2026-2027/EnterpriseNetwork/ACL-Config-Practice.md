
# ACL Config Practice

2026-10-15 17:19

Tags: #enterpriseNetwork 

Author:  Duke Hsu

---

## Topic

1. extended ACL
2. standard ACL
3. Named ACL
4. Numbered ACL
5. ACL modify
6. VTY Security
7. established

## 1. extended ACL

Example 1

```cisco-ios
enable
config t
	ip access-list extended 101
		remark Block-PC0-visit-www-Server0
		deny tcp host 192.168.10.2 host 172.16.10.1 eq www
		permit icmp 192.168.10.0 0.0.0.255 any
		permit tcp  192.168.10.0 0.0.0.255 any
		exit
	interface gig0/0
		ip access-group 101 in
		exit
	end

show access-lists
```


Example 2

```cisco-ios
!Named ACL
enable
config t
	ip access-list extended Block-Customer-Visit-Server
		deny tcp 192.168.10.0 0.0.0.255 172.16.0.0 0.0.255.255 eq www
		permit tcp 192.168.10.0 0.0.0.255 172.16.10.0 0.0.0.255
		permit icmp 192.168.10.0 0.0.0.255 172.16.10.0 0.0.0.255
		exit
	interface gig0/0
		ip access-group Block-Customer-Visit-Server in
		exit
	end

show access-lists

```


Example 3

```cisco-ios
!Numbered ACL
enable
config t
	ip access-list extended 102
		deny icmp host 192.168.10.2 host 172.16.10.1 echo
		permit tcp any any
		permit icmp any any 
		permit udp any any 
		exit
	
	interface gig0/0
		ip access-group 102 in
		exit
	end

show access-lists

```





## 2. standard ACL

Example 1

```cisco-ios
enable
config t
	ip access-list standard 10
		remark STANDARD-ACL
		deny host 192.168.10.2
		permit any
		exit
	interface gig0/0
		ip access-group 10 in 
		exit
	end
	
show access-lists 

```

Example 2

```cisco-ios
!Numbered ACL
enable
config t
	ip access-list standard 11
		remark block-192.168.10.0/24
		deny 192.168.10.0 0.0.0.255
		exit
	interface gig0/0
		ip access-group 11 in
		exit
	end

show access-lists
```


Example 3 

```cisco-ios
!Named ACL
enable
config t
	ip access-list standard BLOCK-PC3
		remark block 192.168.10.4
		deny 192.168.10.4
		permit any 
		exit
	interface gig0/0
		ip access-group BLOCK-PC3 in
		exit
	end 
	
show access-lists

```



## 3. ACL Modify 

Sequence Number Method 

```cisco-ios
R0(config-ext-nacl)#?
	<1-2147483647> Sequence Number
	default Set a command to its defaults
	deny Specify packets to reject
	exit Exit from access-list configuration mode
	no Negate a command or set its defaults
	permit Specify packets to forward
	remark Access list entry comment
```

- Sequence Number = notebook rows
- 1-2147483647  sequence number range

```cisco-ios
R0#show access-lists

Standard IP access list Block192.168.10.4
	10 deny host 192.168.10.4 (4 match(es))
	20 permit any (3 match(es))
```

ACL rules:

- Rules are checked top to bottom (lowest sequence number first)
- The first match wins, and checking stops there
- Put specific rules before general rules
- ==🟠Every ACL ends with an implicit "deny any"==


Sequence Number Method  Example

```cisco-ios
enable
config t
	ip access-list Block192.168.10.4
		no 10
		10 permit host 192.168.10.4
		exit
	end

show access-lists
```

## 4. VTY Security 

`access-class  Filter connections based on an IP access list` 

Example 1: 

```cisco-ios
!allow admin login route via VTY line, no ENABLE 
enable
config t
	username ADMIN secret class
	ip access-list standard ADMIN-HOST-VTY
		remark THIS ACL SECURES INCOMING VTY
		permit 192.168.10.2
		deny any
		exit
	
	line vty 0 4
		login local
		transport input telenet
		access-class ADMIN-HOST-VTY in
		end
	
show access-list

```

When u login via PC0 Telnet u will see a msg on R0
`%SYS-5-CONFIG_I: Configured from console by console`

Example 2:

```cisco-ios
enable
config t
	enable password duke1234 !config enable password 
	ip domain-name duke.com
	crypto key generate rsa
	!enter 2048
	
	username ADMIN privilege 15 secret duke
	
	ip access-list standard ADMIN-HOST
		permit 192.168.10.0 0.0.0.255
		deny any
		exit
	
	line vty 0 4
		access-class ADMIN-HOST in  !apply ACL rule
		transport input ssh !allowed protocol
		login local !use local user account database
		exec-timeout 5 0 !if 5min no action, automatic disconnect
		exit
	end

show ip ssh
show access-lists
show running-config | section vty
	
```


## 5. established

```cisco-ios
enable
config t
	interface Gig0/0 !WAN connection
		ip access-group INBOUND in
		ip access-group OUTBOUND out
	exit
	
	!ACL from WAN
	ip access-list extended INBOUND
		permit tcp any any established    !allowed inside device echo
		deny ip any any                   !not allowed outside device connect to inside device
		exit
	
	!ACL from LAN
	ip access-list extended OUTBOUNT
		permit ip any any                !allowed inside device connect outside device 
	
```


- established only apply for  TCP
- 







----
## References
