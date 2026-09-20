
# Module -  4  ACL Concepts

2026-09-16 19:58

Tags: #enterpriseNetwork 

Author:  Duke Hsu

---

![ACL-Concepts](https://img.dukehsu.com/study_note/ACL.webp)

## Topic 

1. ACL definition
2. Permit  and Deny
3. Process
4. Direction
5. Wildcard
6. Standard ACL
7. Extended ACL

## 1. ACL - Access Control List

**ACL** means **Access Control List**.

An ACL is a series of **IOS commands** that filters packets using information in the **packet header**. This is called **packet filtering**.

Each permit or deny statement is an **Access Control Entry (ACE)**, also called an **ACL statement**. By default, a router has no ACLs configured.


## 2. Permit / Deny

- **Permit:** Allow a matching packet to be forwarded.
- **Deny:** Discard a matching packet.
  
- When an ACL is applied to an interface, the router checks packets against its ACEs.
- ACLs can control traffic flow, limit network traffic, and provide a basic level of security for network access.

## 3. Process

### 3.1 Top to Bottom

The router checks ACEs in **sequential order**, starting at the top of the ACL.

For an inbound standard IPv4 ACL
1. The router reads the source IPv4 address from the packet header.

2. It compares that address with the first ACE.

3. If there is no match, it checks the next ACE.

  
### 3.2 First Match Wins

When a packet matches an ACE, the router follows that ACE: **permit** or **deny**.
The router stops checking. It does not examine the remaining ACEs.


> Rule order matters because the first matching ACE decides the result.

### 3.3 Implicit Deny

Every ACL ends with an **implicit deny** ACE.

- This rule is hidden. It is not displayed in the configuration.
- A packet that does not match any ACE is discarded.
- An ACL must contain at least one **permit** statement. Otherwise, all traffic checked by that ACL is denied.

> No match = deny.

## 4. Direction

Inbound and outbound describe the packet's direction at a **router interface**.
### 4.1 Inbound

The packet is **entering** the interface.

An inbound ACL filters the packet **before** it is routed to the outbound interface.

```text

Packet enters interface -> Inbound ACL -> Routing decision

```


If the ACL discards the packet, the router does not need to perform a routing lookup. This saves processing work.

  
### 4.2 Outbound

The packet is **leaving** the interface.

An outbound ACL filters the packet **after** routing, regardless of which interface the packet entered.


```text

Routing decision -> Outbound ACL -> Packet leaves interface

```


## 5. Wildcard

An IPv4 ACE uses a **32-bit wildcard mask** to choose which address bits must match.

The rules below apply to individual **bits**.

### 5.1  0 = Match

A wildcard bit of **0** means the corresponding address bit **must match**.

To match one host, use `0.0.0.0`. All 32 address bits must match.

Lecture example:
  
```cisco

access-list 10 permit 192.168.1.1 0.0.0.0

```


This ACE permits only the source address `192.168.1.1`.

The keyword **host** substitutes for the `0.0.0.0` wildcard mask.

### 5.2 1 = Ignore

A wildcard bit of **1** means the corresponding address bit is **ignored**.

Lecture example:

```cisco

access-list 10 permit 192.168.1.0 0.0.0.255

```
  

In `0.0.0.255`:


- The first three octets contain only 0 bits, so they must match `192.168.1`.
- The last octet, `255`, is binary `11111111`, so all eight bits are ignored.
- This ACE permits all hosts in `192.168.1.0/24`.


The keyword **any** substitutes for the `255.255.255.255` wildcard mask. All address bits are ignored, so any address can match.


The lecture gives this shortcut for calculating a wildcard mask from a subnet mask:

```text

255.255.255.255

- subnet mask

= wildcard mask

```

  
 

| Subnet prefix | Subnet mask     | Wildcard mask |
| ------------- | --------------- | ------------- |
| /24           | 255.255.255.0   | 0.0.0.255     |
| /28           | 255.255.255.240 | 0.0.0.15      |
| /23           | 255.255.254.0   | 0.0.1.255     |

## 6. Standard ACL

Standard IPv4 ACL numbers: **1-99** and **1300-1999**. Standard ACLs can also be named.

### 6.1 Source IP only

A standard ACL permits or denies packets based only on the **source IPv4 address**.


- Source IP means where the packet comes from.
- Standard ACLs filter at **Layer 3**.
- They do not select traffic by destination IPv4 address, protocol type, or port.

### 6.2 Near Destination

Place a standard ACL **as close to the destination as possible**.

Because it checks only the source address, placing it too early can also block traffic going to other destinations.

Lecture example:

- Block traffic from `192.168.10.0/24` to `192.168.30.0/24`.
- Still allow that source network to reach `192.168.31.0/24`.
- Apply the standard ACL **outbound on R3's interface toward 192.168.30.0/24**.
- Applying it inbound on R3's `S0/1/1` would also filter traffic to `192.168.31.0/24`.

## 7. Extended ACL

Extended IPv4 ACL numbers: **100-199** and **2000-2699**. Extended ACLs can also be named.

Extended ACLs provide finer control by using more packet information.
  
### 7.1 Source IP


Match the **source IPv4 address**: where the packet comes from.

In the lecture's placement example, the source network is `192.168.11.0/24`.
  

### 7.2 Destination IP

Match the **destination IPv4 address**: where the packet is going.

In the same example, the destination network is `192.168.30.0/24`.

  

### 7.3 Protocol

Match the **protocol type**.

For example, the lecture's named ACL, `FTP-FILTER`, uses **TCP** in its permit statements.

  

### 7.4 Port

Match **source and destination TCP or UDP ports** at **Layer 4**.

This allows the ACL to filter specific network services.

The lecture's `FTP-FILTER` example uses `eq ftp` and `eq ftp-data` to match destination services:


```cisco

ip access-list extended FTP-FILTER

permit tcp 192.168.10.0 0.0.0.255 any eq ftp

permit tcp 192.168.10.0 0.0.0.255 any eq ftp-data

```


### 7.5 Near Source

  

Place an extended ACL **as close to the source as possible**.

  

- Unwanted traffic is blocked early.

- This saves bandwidth because denied traffic does not cross the entire network.

- The organization can place ACLs only on devices it controls.

  

Lecture example:

- Company A wants to deny **Telnet and FTP** traffic from `192.168.11.0/24` to Company B's `192.168.30.0/24`.
- All other traffic should be permitted.
- Place the extended ACL on **R1**, which Company A controls.
- Apply it **inbound on the interface connected to 192.168.11.0/24** so only packets from that network are checked there.

  

 

----
## References

- Module 4  PDF
- Inetner
