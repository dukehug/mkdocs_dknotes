
# Cisco 2950-24  Configuration

2026-08-19 17:36

Tags: #Network 

Author:  Duke Hsu

---

## Overview

![image.png](https://img.dukehsu.com/study_note/20260819224947180.webp)


```                  
				192.168.1.0/24
          G0/0                        G0/0
R-A 192.168.1.1 ---------------- 192.168.1.2 R-B
 |                                              |
 | G0/1                                    G0/1 |
 |                                              |
 | 192.168.3.0/24                  192.168.5.0/24
 |                                              |
 | G0/1                                    G0/1 |
 |                                              |
R-C 192.168.3.2                  192.168.5.1 R-D
          G0/0                        G0/0
           192.168.4.1 -------- 192.168.4.2
                  192.168.4.0/24
```





## 設置 接口 IP Address

```shell

#R-A

enable

show ip interface brief 

configure terminal

interface GigabitEthernet0/0 

ip address 192.168.1.1 255.255.255.0
no shutdown
end

show ip interface brief



#R-B

enable

show ip interface brief 

configure terminal

interface GigabitEthernet0/0 

ip address 192.168.2.1 255.255.255.0
no shutdown
end

show ip interface brief

ping 192.168.1.1



# Copy config to startup-config 
write memory 

#or same  write memory
copy running-config startup-config


```

## OSPF v2 配置

```shell
#R-A

enable
configure terminal 
router ospf 100

network 192.168.0.0  0.0.255.255 area 0
end

show ip ospf neighbor
show ip route
show ip protocols
show ip ospf database

# config passive-interface
enable
configure terminal

router ospf 100
passive-interface gigabitEthernet 0/2

end

# Copy config to startup-config 
write memory 

#or same  write memory
copy running-config startup-config

#R-B

enable
configure terminal 
router ospf 101

network 192.168.0.0  0.0.255.255 area 0
end

show ip ospf neighbor
show ip route
show ip protocols
show ip ospf database
show ip ospf interface


# config passive-interface
enable
configure terminal

router ospf 100
passive-interface gigabitEthernet 0/2

end



# Copy config to startup-config 
write memory 

#or same  write memory
copy running-config startup-config

```


# DHCP 基礎 配置和維護

### 基礎配置

```shell
enable
config t

interface GigabitEthernet 0/2 
ip address 192.168.10.1 255.255.255.0
no shutdown
exit


ip dhcp exclude-address 192.168.10.1
ip dhcp exclude-address 192.168.10.254

ip dhcp pool LAN10
network 192.168.10.0 255.255.255.0
default-router 192.168.10.1
domain-name dukehsu.com
dns-server 8.8.8.8
exit

sevice dhcp

end

show ip interface brief


#save config
copy running-config startup-config


```


##  刪除

```shell

#check dhcp details

show ip dhcp pool

show running-config | section dhcp

show ip dhcp binding

show running-config | include ip dhcp excluded-address

#delete dhcp pool
config t 
no ip dhcp pool {dhcp pool name}

end

#delete dhcp excluded-address
config t 
no ip dhcp excluded-address {ipaddress}

end

#turn off dhcp service
config t 
no service dhcp
end

show ip dhcp binding

```


## 維護/修改

```shell
#check dhcp details

show ip dhcp pool

show running-config | section dhcp

show ip dhcp binding

show running-config | include ip dhcp excluded-address

#modify interface
config t
interface GigabitEthernet 0/2
no ip address
ip address 192.168.9.1 255.255.255.0

exit


#modify dhcp pool
ip  dhcp pool LAN10
no network 192.168.10.0 255.255.255.0
network 192.168.9.0 255.255.255.0

no default-router 192.168.10.1
deafult-router 192.168.9.1 
exit


#modify excluded ipaddress
no ip dhcp excluded-address 192.168.10.1 
ip dhcp excluded-address 192.168.9.1


end

# clear dhcp binding
clear ip dhcp binding *


# check dhcp confict

show ip dhcp conflict

# 在執行清除dhcp 衝突之前， 記得先排查為什麼會衝突

# clear dhcp conflict
clear ip dhcp conflict *


```



##  OSPF Hello Packet

![image.png](https://img.dukehsu.com/study_note/20260819222837624.webp)

![image.png](https://img.dukehsu.com/study_note/ospf_hello_packet_1.webp)



----
## References
