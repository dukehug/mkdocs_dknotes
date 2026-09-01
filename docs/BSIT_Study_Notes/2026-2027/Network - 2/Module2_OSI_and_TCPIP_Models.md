# Module -  2  OSI and TCP/IP Models

2026-08-28 20:13

Tags: #Network 

Author:  Duke Hsu

---

## Topic 

1. OSI Model
2. Data Encapsulation
3. TCP/IP Model
4. IPv4 and IPv6 



## Learning Objectives

After studying this module, you should be able to:

1. Explain why network communication is divided into layers.
2. Name the seven OSI layers and describe the main job of each layer.
3. Name the four TCP/IP layers and map them to the OSI model.
4. Identify common Protocol Data Units (PDUs) and address types.
5. Explain the main differences between TCP and UDP.
6. Describe the formats of IPv4 and IPv6 addresses.
7. Explain subnet masks, prefix lengths, and historical IPv4 address classes.
8. Use the layered models as a basic troubleshooting guide.

---

## 1. Why Network Models Matter

A network model divides communication into smaller functions called **layers**. Each layer has a specific job and provides services to the layer above it.

Layered models help us:

- understand how data moves through a network;
- describe protocols in a common way;
- design and update one part of a network without changing everything;
- identify the layer where a problem may exist; and
- allow products from different vendors to work together through common standards.

Two important models are:

- **OSI model** - a seven-layer reference model used to explain network functions.
- **TCP/IP model** - a four-layer model based on the protocols used on the Internet.

> The OSI model is mainly a reference model. Real networks normally use the TCP/IP protocol suite, but the OSI layers are still useful for learning and troubleshooting.

---

## 2. The OSI Model

**OSI** means **Open Systems Interconnection**. The model separates network communication into seven layers.

### 2.1 OSI Layers at a Glance

| Layer | Name         | Main function                                          | PDU                         | Main address or identifier          |
| ----: | ------------ | ------------------------------------------------------ | --------------------------- | ----------------------------------- |
|     7 | Application  | Provides network services used by applications         | Data                        | Not normally assigned by this layer |
|     6 | Presentation | Formats, translates, compresses, and encrypts data     | Data                        | Not normally assigned by this layer |
|     5 | Session      | Starts, manages, and ends communication sessions       | Data                        | Not normally assigned by this layer |
|     4 | Transport    | Provides end-to-end communication between applications | TCP segment or UDP datagram | Port number                         |
|     3 | Network      | Provides logical addressing and routing                | Packet                      | IP address                          |
|     2 | Data Link    | Delivers frames across one local link                  | Frame                       | MAC address                         |
|     1 | Physical     | Sends bits as signals through the medium               | Bits                        | None                                |

**PDU** means **Protocol Data Unit**. It is the name given to data at a particular layer.

### 2.2 Layer 7 - Application

The Application layer provides network services that software can use.

Common functions include:

- accessing web services;
- transferring files;
- sending and receiving email;
- translating domain names; and
- remotely managing a device.

Common protocols include:

- **HTTP/HTTPS** - web communication;
- **FTP** - file transfer;
- **SMTP** - sending email;
- **DNS** - name resolution; and
- **SSH** - secure remote access.

> The Application layer is not the user application itself. It contains the network protocols and services used by the application.

### 2.3 Layer 6 - Presentation

The Presentation layer makes sure data is in a usable form.

Its functions may include:

- changing data formats;
- translating character encoding;
- compressing and decompressing data; and
- encrypting and decrypting data.

In the TCP/IP model, these functions are usually handled by applications or software libraries.

### 2.4 Layer 5 - Session

The Session layer manages conversations between applications.

Its functions may include:

- starting a session;
- keeping the session active;
- synchronizing communication; and
- ending the session correctly.

In the TCP/IP model, these functions are normally part of the Application layer.

### 2.5 Layer 4 - Transport

The Transport layer provides end-to-end communication between applications on different hosts.

Its main functions include:

- dividing application data into smaller units;
- reassembling the data at the destination;
- identifying applications with **port numbers**;
- managing reliability when required; and
- controlling the rate of data transmission when supported by the protocol.

The two main transport protocols are TCP and UDP.

| Feature | TCP | UDP |
|---|---|---|
| Full name | Transmission Control Protocol | User Datagram Protocol |
| Connection | Connection-oriented | Connectionless |
| Reliability | Uses acknowledgements, sequencing, and retransmission | Does not provide TCP-style delivery guarantees |
| Overhead | Higher | Lower |
| PDU | Segment | Datagram |
| Best fit | When reliable, ordered delivery is required | When low delay or simple delivery is more important |

> UDP is not automatically "better" or "faster" in every situation. The application chooses TCP or UDP according to its needs.

### 2.6 Layer 3 - Network

The Network layer delivers packets between different networks.

Its main functions include:

- logical addressing with IP addresses;
- selecting a path to the destination;
- routing packets between networks; and
- forwarding packets to the next hop.

Routers mainly operate at this layer. IPv4 and IPv6 are Layer 3 protocols.

### 2.7 Layer 2 - Data Link

The Data Link layer moves frames across one local network link.

Its main functions include:

- placing packets inside frames;
- using MAC addresses for local delivery;
- detecting transmission errors; and
- controlling access to the physical medium.

Ethernet switches mainly make forwarding decisions at this layer.

> A Layer 2 frame is normally rebuilt at every router hop. Its source and destination MAC addresses are therefore local to the current link.

### 2.8 Layer 1 - Physical

The Physical layer sends raw bits through a physical or wireless medium.

It defines items such as:

- electrical, optical, or radio signals;
- cables and connectors;
- bit timing and signal characteristics; and
- physical transmission speed.

Examples include copper cables, fiber-optic cables, radio signals, connectors, and transceivers.

---

## 3. Data Encapsulation

When a host sends data, each lower layer adds information needed for delivery. This process is called **encapsulation**.

```text
Application data
      ↓
TCP segment or UDP datagram   + port numbers
      ↓
IP packet                     + IP addresses
      ↓
Data-link frame               + MAC addresses and trailer
      ↓
Bits                          sent as signals
```

At the receiving host, the layers remove this information in reverse order. This process is called **decapsulation**.

The three main identifiers have different jobs:

- **Port number** - identifies an application or service.
- **IP address** - identifies a logical interface and helps route data across networks.
- **MAC address** - supports delivery across the current local link.

---

## 4. The TCP/IP Model

The TCP/IP model describes the protocol suite used by modern IP networks and the Internet. It has four layers.

### 4.1 TCP/IP Layers

| TCP/IP layer | Main function | Examples |
|---|---|---|
| Application | Provides network services and handles application data | HTTP, HTTPS, DNS, SMTP, SSH |
| Transport | Provides communication between applications | TCP, UDP |
| Internet | Provides IP addressing, routing, and packet forwarding | IPv4, IPv6, ICMP |
| Network Access | Handles local-link delivery and physical transmission | Ethernet, Wi-Fi |

The bottom TCP/IP layer may be called the **Network Access**, **Link**, or **Network Interface** layer. These names refer to the same general part of the model.

### 4.2 OSI and TCP/IP Mapping

| OSI model | TCP/IP model |
|---|---|
| Layer 7 - Application | Application |
| Layer 6 - Presentation | Application |
| Layer 5 - Session | Application |
| Layer 4 - Transport | Transport |
| Layer 3 - Network | Internet |
| Layer 2 - Data Link | Network Access |
| Layer 1 - Physical | Network Access |

The models describe similar functions, but their layer boundaries are not exactly the same. The placement of some support protocols, such as ARP, may also differ between diagrams or textbooks.

---

## 5. IPv4 Addressing

### 5.1 IPv4 Format

An IPv4 address:

- contains **32 bits**;
- is divided into four 8-bit parts called **octets**;
- is normally written in dotted-decimal notation; and
- has a decimal value from 0 to 255 in each octet.

Example:

```text
192.168.1.10
```

IPv4 provides about 4.3 billion possible bit patterns. However, not every address can be assigned to a host because some ranges and individual addresses have special purposes.

### 5.2 Subnet Masks and Prefix Lengths

An IPv4 address contains:

- a **network portion**, which identifies the subnet; and
- a **host portion**, which identifies an interface inside that subnet.

A subnet mask or CIDR prefix length shows where the network portion ends.

Example:

```text
IPv4 address:  192.168.1.10
Subnet mask:   255.255.255.0
CIDR notation: 192.168.1.10/24
```

`/24` means the first 24 bits are the network prefix. `255.255.255.0` and `/24` describe the same prefix length.

> **CIDR** means **Classless Inter-Domain Routing**. Modern networks use CIDR and variable prefix lengths instead of depending on address classes.

### 5.3 Historical IPv4 Address Classes

Older IPv4 networks used **classful addressing**. The first octet determined the address class and its default mask.

| Class | Traditional first-octet range | Historical default mask | Historical prefix | Original purpose |
|---|---:|---|---:|---|
| A | 1-126 | 255.0.0.0 | /8 | Very large networks |
| B | 128-191 | 255.255.0.0 | /16 | Medium networks |
| C | 192-223 | 255.255.255.0 | /24 | Small networks |
| D | 224-239 | Not applicable | Not applicable | Multicast |
| E | 240-255 | Not applicable | Not applicable | Reserved or experimental use |

Important points:

- Classful addressing is historical; CIDR is used today.
- `127.0.0.0/8` is reserved for loopback purposes.
- `0.0.0.0/8` has special uses and was not a normal Class A host range.
- A modern prefix must be read from its configured mask or prefix length. It must not be guessed from Class A, B, or C.

---

## 6. IPv6 Addressing

IPv6 was developed partly because the supply of globally routable IPv4 addresses is limited.

An IPv6 address:

- contains **128 bits**;
- is written in hexadecimal;
- is divided into eight 16-bit groups;
- uses colons between groups; and
- uses a prefix length to identify the network prefix.

Full-form example:

```text
2001:0db8:0000:0000:0000:0000:0000:0010/64
```

Compressed form:

```text
2001:db8::10/64
```

Basic compression rules:

- Leading zeros inside a group may be removed.
- One continuous sequence of all-zero groups may be replaced by `::`.
- `::` may appear only once in an IPv6 address.

> The prefix `/64` means the first 64 bits form the network prefix. It does not mean that the whole IPv6 address has only 64 bits.

---

## 7. IPv4 and IPv6 Comparison

| Feature | IPv4 | IPv6 |
|---|---|---|
| Address size | 32 bits | 128 bits |
| Normal notation | Decimal with dots | Hexadecimal with colons |
| Example | `192.168.1.10` | `2001:db8::10` |
| Network boundary | Subnet mask or prefix length | Prefix length |
| Broadcast | Supported | Not used |
| Multicast | Supported | Supported |
| Address configuration | Manual or DHCP | Manual, SLAAC, or DHCPv6 |
| Address resolution | ARP | Neighbor Discovery Protocol (NDP) |
| Address-conservation NAT | Common | Generally not required |
| Base header | At least 20 bytes; options can increase its size | Fixed 40-byte base header; extra information uses extension headers |

IPv6 does not use broadcast. It uses multicast and, in some situations, anycast to reach selected devices.

---

## 8. Troubleshooting by Layer

The layered models help narrow down a network problem.

| Area to check | Layer | Example questions |
|---|---|---|
| Physical connection | OSI Layer 1 | Is the cable connected? Is the interface up? Is a signal present? |
| Local-link communication | OSI Layer 2 | Is the VLAN correct? Is the switch learning MAC addresses? |
| IP communication | OSI Layer 3 | Is the IP address and prefix correct? Is there a route to the destination? |
| End-to-end transport | OSI Layer 4 | Is the correct TCP or UDP port being used? Is a firewall blocking it? |
| Network service | OSI Layers 5-7 | Is DNS working? Is the server application running? Is the data format supported? |

A simple troubleshooting order is:

1. Check power, cables, wireless signal, and interface status.
2. Check local-link settings, including VLAN and MAC learning.
3. Check IP address, prefix, default gateway, and routing table.
4. Check TCP or UDP ports and security rules.
5. Check the application service and its configuration.

---

## 9. Quick Review

- The OSI model has seven layers; the TCP/IP model has four.
- OSI is a reference model. TCP/IP represents the protocol suite used on IP networks.
- TCP provides reliable, ordered delivery; UDP provides simpler connectionless delivery.
- Port numbers identify applications, IP addresses support routing, and MAC addresses support local-link delivery.
- Data is encapsulated as data, segment or datagram, packet, frame, and bits.
- IPv4 addresses are 32 bits; IPv6 addresses are 128 bits.
- IPv6 does not use broadcast and uses NDP instead of ARP.
- IPv4 address classes are historical. Modern networks use CIDR prefixes.
- Layered models help locate problems, but real implementations do not always follow every model boundary exactly.


----
## References

