

# Module - 6 Servers

2026-10-02 21:50

Tags:  #Network 

Author:  Duke Hsu

---

![](https://www.zenarmor.com/docs/assets/images/types-of-servers-507a1970e9401e3fc59727d0fd7dde95.png)


## Topic 

1. Servers
2. Types of Servers and its Functions


## 1. Servers

Modern computer networks depend on servers to provide centralized services, resources, and information to users and devices.

Whenever we access a website, receive an IP address, resolve a domain name, access a shared file, send an email, or use an online application, a server is usually involved in providing that service. 


Servers are designed to perform specific functions and support the communication and resource-sharing requirements of a network .

Different servers provide different services. 


## 2. Types of Servers


-  DHCP Server
- DNS Server
- Web Server
- File Server
- Database Server
- Application Server
- Mail Server
- FTP Server
- Authentication / AAA Server
- Directory Server
- Print Server
- NTP Server
- TFTP Server
- Backup Server
- Monitoring Server
- Logging Server




### 2.1 DHCP Server

![[https://dvijinfotech.com/wp-content/uploads/2021/09/components-and-advantages-of-dhcp-server.jpg](https://www.cloudns.net/blog/wp-content/uploads/2021/02/How-does-DHCP-work.png)

Dynamic Host Configuration Protocol 

DHCP Server is a server that automatically provides network configuration information to client devices when they connect to a network. 

DHCP server assigns and available IP address and can also provide the subnet mask, default  gateway, and DNS server information . 

**DHCP Main Function**

- Automatically provides IP addressing and other network configuration to clients



### 2.2 DNS Server

![](https://www.cloudns.net/blog/wp-content/uploads/2023/04/Authoritative-DNS-server-1024x577.png)


Domain Name System is a server that translates human-readable domain names and hostnames into IP addresses. 


**DNS Main Function**

- Easier to remember
- Resolvers domain names of hostnames into IP addresses
  
  
Examples of DNS server Software

- AdGuard Home
- Pi-hole
- Unbound
- PowerDNS
- BIND 9
- Smart DNS

### 2.3 Web Server

![](https://www.vpsmalaysia.com.my/media/uploads/blog/what-is-a-web-server/img-01-1200w.jpg)

A Web Server is a server that stores, processes , and delivers web content to clients, usually through the HTTP or HTTPS protocols. 


**Web Server Main Function**

Hosts and delivers websites and web content to clients 

**Examples of Web Server Software:**

- Caddy
- Nginx
- Apache HTTP Server
- IIS
- Lighttpd


### 2.4 File Server

![](https://media.geeksforgeeks.org/wp-content/uploads/20220824171022/FileServer-660x330.jpg)

A File Server is a server that provides centralized storage and access to files and folders for users and computers on a network . 

**File Server Main Function:**

- Provides centralized file storage, sharing, and access control 

**Examples of File Server:**

- Linux / Samba File Server / SMB
- NAS (Network-Attached Storage)
- Cloud Storage File servers
- FTP / SFTP Servers
- WebDAV

### 2.5  Database Server

Stores , manages, processes and provides access to structured data using a database management system

It receives requests from applications or clients, processes database queries, and returns the required information .

**Main Function:**

Stores , manages, processes and provides access to structured data

**Examples of Database Systems:**

- MySQL
- PostgreSQL
- MS SQL
- Oracle Database
- MariaDB

### 2.6. Application Server 

An Application Server is a server that provides an environment for running application programs and processing application logic on behalf of clients. 

It handles application requests, performs business rules or processes, and may communicate with other servers such as databases servers to retrieve or update information . 


**Main Function:**

Runs application logic and provides application services to clients. 


**Examples of Database Systems:**

- API Server
- Apache Tomcat
- WildFly
- IBM WebSphere
- Oracle WebLogic
- GlassFish

### 2.7 Mail Server 

A Mail Server is a server responsible for sending, receiving , storing, and delivering electronic mail messages between users and other mail servers. 

It uses email protocols to manage communication between email clients and mail systems. 

**Main Function:**

Provides email communication and message delivery 


**Common Protocols:**

- SMTP - Sending and Relaying Email
- IMAP - Access and Manage messages stored on a mail server (Internet Message Access Protocol)
- POP3 - Retrieve email messages from a mail server


**Examples of Mail Server**

- Postfix
- Dovecot
- Docker Mailserver [https://github.com/docker-mailserver/docker-mailserver](https://github.com/docker-mailserver/docker-mailserver)
- Stalwart Email Server
- Maddy Mail Server


### 2.8 FTP Server

File Transfer Protocol Server is a server that provides a service for transferring files between computers over a network. 

It allows authorized clients to upload files to the server and download files from it 

**Main Function:**

Provides file-transfer services between networked systems. 

- Uploading website files
- Download files
- Transferring large files
- Sharing files between systems

**Secure Alternatives:**

- SFTP
- FTPS

**Example of FTP Server**

- FileZilla Server
- Wing FTP Server
- Cerberus FTP Server
- SFTP Go

[Free Public FTP Server ](https://www.sftp.net/public-online-ftp-servers)

### 2.9 Authentication / AAA Server

An Authentication Server is a server that verifies the identity of  users or devices before allowing them to access network resources or services. 

In networking, authentication is commonly associated with  AAA:

- Authentication - Determines who the users is
- Authorization - Determines What the user is allowed to do 
- Accounting - Records user activity or resource usage

**Main Function:**

Provides centralized identity verification and access control 

**Example of Authentication Server:**

- Keycloak [https://www.keycloak.org](https://www.keycloak.org)
- Authelia
- Ory
- Authentik
- Zitadel
- Authgear-Server [https://github.com/authgear/authgear-server](https://github.com/authgear/authgear-server)


### 2.10 Directory Server

![](https://raw.githubusercontent.com/txstudio/2020-12th-ironman/master/images/02/active-directory-basic-graphic.gif)


A  Directory Server is a server that centrally stores and manages information about users, computers, groups, and other network resources. 

It allows administrators to manage identities and network resources from a centralized system rather  than configuring every computer individually. 


**Main Function**

 Provides centralized management of users, computers, groups, devices  and network resource

**Example of Directory Server**

- Microsoft Active Directory
- OpenLDAP


Ref:

[https://ithelp.ithome.com.tw/articles/10237735](https://ithelp.ithome.com.tw/articles/10237735)
[https://dic.vbird.tw/linux_server/unit07.php](https://dic.vbird.tw/linux_server/unit07.php)
[https://www.freedom.net.tw/ict-insight/outsource/ad-intro.html](https://www.freedom.net.tw/ict-insight/outsource/ad-intro.html)
[https://docs.oracle.com/cd/E19341-01/817-7164/intro.html](https://docs.oracle.com/cd/E19341-01/817-7164/intro.html)
[https://ldap.com/directory-servers/](https://ldap.com/directory-servers/)

### 2.11  Print Server

![](https://www.savapage.org/docs/manual/images/manual/sp-infra-template.png)


A Print Server is a server that manages network printers and print requests from multiple clients. 

Instead of connecting each computer directly to printer, users can send their print jobs to the print server, which manages and forwards them to the appropriate printer. 

**Example of Print Server**

- CUPS - Apple Inc 
- SavePage
- PrinterOne

### 2.12. NTP Server

Network Time Protocol Server is a server that provides accurate time synchronization to network devices and computer systems. 

Network devices such as routers, switches, servers, and computers can synchronize their clocks with an NTP server. 

**Main Function:**

Synchronizes the date and time of network devices and systems.

**Accurate time helps with:**

- Log analysis
- Troubeshooting
- Security monitoring
- Authentication
- Event correlation



### 2.13  TFTP Server

![https://pjo2.github.io/images/working_tftpd32.jpg](https://pjo2.github.io/images/working_tftpd32.jpg)

Trivial File Transfer Protocol Server is a server that provides a simple file-transfer service. 

TFTP is designed to perform basic file transfers with fewer features than protocols such as FTP

**Main Function:**

Provides simple file-transfer services, particularly in network environments.

**Common Networking Users:**

- Transferring network device configuration files (eg. NOP, Router, )
- Transferring firmware or boot files (eg. Openwrt devices, routers)
- Supporting network device operations ( eg. PXE, Diskless )

**Open source TFTP Server**

- [tftpd64](https://pjo2.github.io/tftpd64/)
- [uftpd](https://github.com/troglobit/uftpd)


### 2.14  Backup Server

![[https://www.urbackup.org/impressions.html](https://www.urbackup.org/screenshots/client_logs.png)


![Bareos](https://www.bareos.com/wp-content/uploads/2025/11/Bareos-Architecture-1.svg)




 A Backup Server is a server that creates , stores, and manages copies of important data so that the data can be recovered if the original information is lost, damaged, deleted, or becomes unavailable. 


**Main Function:**

Provides centralized data backup and recovery 

**Data That Can Backed Up**

- User files
- Databases
- Server configurations
- Application data
- Network device configurations

**Open Source Backup Server:**

- [UrBackup](https://www.urbackup.org) 
- [Kopia](https://kopia.io)
- [Bacula](https://www.bacula.org)
- [Bareos](https://www.bareos.com)

### 2.15 Monitoring Server

![Zaabix](https://osamaoracle.com/wp-content/uploads/2020/02/222.png?w=539)


A Monitoring Server is a server or system that continuously collects information about the availability, performance, and condition of network devices, servers , and services. 

It helps network administrators identify problems before or while they affect users. 

**Main Function:**

Monitors the health, performance, and availability of network systems. 

**It Can Monitor:**

- CPU utilization
- Memory usage
- Disk space
- Network traffic
- Device availability
- Service status
- Network interfaces

**Common Monitoring Server:**

- [Zaabix](https://www.zabbix.com)
- Datadog
- SolarWinds SAM
- LogicMonitor
- Nagios XI

### 2.16 Logging Server

![](https://grafana.com/mw/_next/image/?url=https%3A%2F%2Fa-us.storyblok.com%2Ff%2F1022730%2F1000x604%2F81ce5ace9c%2Fimage-homepage-rca-dashboard.png%2Fm%2Ffilters%3Aformat(webp)%3Aquality(90)%2F&w=1920&q=75)



A Logging Server is a centralized server that receives, stores, and manages event or log messages generated by network devices, servers, and applications. 


**Main Function:**

Centralizes the collection and storage of system and network logs.

**Logs Can Contain:**

- Login attempts
- Authentication failures
- Configuration changes
- Configuration changes
- System errors
- Network events
- Security events

**Open Source Logging Server**

- [Grafana](https://grafana.com)
- [Syslog-ng](https://www.syslog-ng.com)
- [Graylog](https://www.syslog-ng.com)
- [VictoriaMetrics](https://victoriametrics.com)



Ref:

- [Grafana Demo](https://play.grafana.org/d/maggk24/grafana-cloud/?pg=hp&plcmt=play-demo)



----
## References


[https://www.cloudns.net/blog/authoritative-dns-server/](https://www.cloudns.net/blog/authoritative-dns-server/)

[https://www.cloudflare.com/learning/dns/what-is-a-dns-server/](https://www.cloudflare.com/learning/dns/what-is-a-dns-server/)

[https://www.cloudns.net/blog/dhcp-server/](https://www.cloudns.net/blog/dhcp-server/)

[https://www.geeksforgeeks.org/computer-networks/what-is-file-server/](https://www.geeksforgeeks.org/computer-networks/what-is-file-server/)

[https://www.zenarmor.com/docs/network-basics/types-of-servers](https://www.zenarmor.com/docs/network-basics/types-of-servers)

[https://pinggy.io/blog/best_open_source_dns_servers_for_self_hosting/](https://pinggy.io/blog/best_open_source_dns_servers_for_self_hosting/)

