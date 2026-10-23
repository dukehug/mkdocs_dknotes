
# Module - 7  Protocols and models  in short

2026-10-16 21:39

Tags:  #network2 

Author:  Duke Hsu

---

![](<https://img.dukehsu.com/study_note/Network Protocols and Models Infographic.webp>)

## Topic

1. The Rules
2. Protocols
3. Protocol Suites
4. Standards Organizations
5. Reference Models
6. Data Encapsulation
7. Data Access
8. New Terms


## 1.The Rules

- Protocols mush have a sender and a receiver
- Common computer protocols include these requirements: 
	- message encoding, formatting and encapsulation, size, timing, and delivery options. 





## 2. Protocols

- To send a message across the network requires the use of several protocols. 
- Each network protocol has its own function, format, and rules for communications.

## 3. Protocols Suites

- A protocol suite is a group of inter-related protocols
- TCP/IP protocol suite are the protocols used today.

## 4. Standards Organizations

- Open standards encourage interoperability, competition, and innovation.


## 5. Reference Models

- The two models used in networking are the ==TCP/IP== and the ==OSI ==mode
- TCP/IP  model has 4 layers
- OSI model has 7 layers

## 6. Data Encapsulation

- The form that a piece of data takes at any layer is called a ==protocol data unit== (PDU)
- There are five different PDUs used in the data encapsulation process: 
	- Data
	- Segment
	- Packet
	- Frame
	- Bits

## 7. Data Access

- The Network and Data Link layers are going to provide addressing to move data through the network 

- ==Layer 3 will provide IP addressing==
- ==Layer 2 will provide MAC addressing==

- The way these layers handle addressing will depend on whether the source and the destination are on the same network or if the destination is on a different network from the source. 

## 8. New Terms 

>encoding
>protocol
>channel
>flow control
>response timeout
>acknowledgement
>unicast
>multicast
>broadcast
>protocol suite
>Ethernet
>standard
>proprietary protocol
>transport
>data link
>network access
>encapsulation
>de-encapsulation
>segment
>segmentation
>packet
>frame
>default gateway
>802.3(Ethernet)
>802.11(Wireless LAN / WiFi)
>Hypertext Transfer Protocol(HTTP)
>Simple Mail Transfer Protocol(SMTP)
>Post Office Protocol(POP)
>Transmission Control Protocol(TCP)
>Advanced Research Projects Agency Network (ARPAGNET)
>Protocol data Unit(PDU)
>Internet Message Access Protocol (IMAP)
>File Transfer Protocol(FTP)
>User Datagram Protocol(UDP)
>Network Address Translation(NAT)
>Internet Control Message Protocol (ICMP)
>Open Shortest Path First(OSPF)
>Enhanced Interior Gateway Routing Protocol(EIGRP)
>Address Resolution Protocol (ARP)
>Dynamic Host Configuration (DHCP)

### 8.1 General Networking Terms 

|Term|中文|簡單定義|
|---|---|---|
|Protocol|協定|裝置之間溝通時共同遵守的一組規則。|
|Channel|通訊通道|資料從一個裝置傳送到另一個裝置所使用的媒介或路徑。|
|Flow Control|流量控制|控制資料傳送速度，避免接收端來不及處理資料。|
|Response Timeout|回應逾時|傳送資料後等待回應的最大時間；超過時間就視為沒有收到回應。|
|Acknowledgement|確認回覆|接收端告訴傳送端：「資料已經收到。」常寫成 ACK。|
|Unicast|單播|One-to-One，一個來源傳送給一個特定目的地。|
|Multicast|多播|One-to-Many Group，傳送給特定的一群裝置。|
|Broadcast|廣播|One-to-All，在同一 Broadcast Domain 中傳送給所有裝置。|
|Protocol Suite|協定套件|一組互相配合工作的網路協定，例如 TCP/IP Protocol Suite。|
|Standard|標準|公開制定的技術規則，讓不同廠商的設備可以互相相容。|
|Proprietary Protocol|專有協定|由特定公司或組織開發、控制的協定。|
|Transport|傳輸|通常指 Transport Layer，負責端到端的資料傳輸，例如 TCP、UDP。|
|Data Link|資料連結|OSI Layer 2，負責 Frame、MAC Address 和區域網路傳輸。|
|Network Access|網路存取|TCP/IP Model 的底層，負責實際將資料送到網路媒介。|
|Encoding|編碼|將資料轉換成適合傳輸的訊號或格式。|


### 8.2 Data Processing / PDU 

|Term|中文|簡單定義|
|---|---|---|
|Encapsulation|封裝|資料往下經過網路層級時，每一層加入自己的 Header / Trailer。|
|De-encapsulation|解封裝|接收端將 Header / Trailer 一層一層移除，取得原始資料。|
|Segment|資料區段|Transport Layer 的資料單位，通常與 TCP 有關。|
|Segmentation|分段|將大型資料切割成較小的 Segment，方便傳輸。|
|Packet|封包|Network Layer / Layer 3 的資料單位，通常包含 IP Address。|
|Frame|訊框|Data Link Layer / Layer 2 的資料單位，通常包含 MAC Address。|
|Protocol Data Unit (PDU)|協定資料單位|對各層資料單位的通稱，例如 Segment、Packet、Frame 都是 PDU。|

你可以把資料傳送流程記成：

`Data → Segment → Packet → Frame → Bits`

接收時相反：

`Bits → Frame → Packet → Segment → Data`


### 8.3 Network Infrastructure Terms 

| Term            | 中文     | 簡單定義                                   |
| --------------- | ------ | -------------------------------------- |
| Ethernet        | 乙太網路   | 最常見的有線 LAN 技術。                         |
| Default Gateway | 預設閘道   | 主機要前往其他網路時，預設將資料送去的 Router IP Address。 |
| NAT             | 網路位址轉換 | 將 Private IP 與 Public IP 之間進行轉換。       |


Example:

```
PC
192.168.1.10
     |
     | Send to another network
     ↓
Default Gateway
192.168.1.1
     |
     ↓
Internet
```


### 8.4 IEEE Standards 

|Term|類型|定義|
|---|---|---|
|IEEE 802.3|Ethernet Standard|定義有線 Ethernet LAN 的標準。|
|IEEE 802.11|Wireless LAN Standard|定義 Wi-Fi / Wireless LAN。|


### 8.5 Application Layer Protocols 應用層協定

|Protocol|Full Name|用途|
|---|---|---|
|HTTP|Hypertext Transfer Protocol|網頁資料傳輸。|
|SMTP|Simple Mail Transfer Protocol|傳送 Email。|
|POP / POP3|Post Office Protocol|從 Mail Server 下載 Email。|
|IMAP|Internet Message Access Protocol|在 Server 上同步、管理 Email。|
|FTP|File Transfer Protocol|傳輸檔案。|
|DHCP|Dynamic Host Configuration Protocol|自動提供 IP Address、Subnet Mask、Gateway、DNS 等設定。|

Email Example: 

```
Send Email
   ↓
 SMTP
   ↓
Mail Server

Receive Email
   ↓
IMAP / POP3
```

### 8.6 Transport Layer Protocols

| Protocol | Full Name                     | 定義                                        |
| -------- | ----------------------------- | ----------------------------------------- |
| TCP      | Transmission Control Protocol | Connection-oriented、可靠傳輸，使用 ACK、重傳、排序等機制。 |
| UDP      | User Datagram Protocol        | Connectionless，速度快，但不保證資料一定送達。            |
|          |                               |                                           |


最簡單可以這樣記：

|TCP|UDP|
|---|---|
|Reliable|Faster|
|Connection-oriented|Connectionless|
|ACK|No ACK by default|
|Retransmission|No retransmission by default|
|Web、Email、File transfer 等|DNS、Voice、Video、Streaming 等常見|

### 8.7 Network Layer / Supporting Protocols

|Protocol|Full Name|定義|
|---|---|---|
|ICMP|Internet Control Message Protocol|用來傳送網路錯誤與診斷訊息，例如 `ping` 使用 ICMP。|
|ARP|Address Resolution Protocol|根據 IPv4 Address 找到對應的 MAC Address。|

Example: 

```
Known:
IP = 192.168.1.20

Need:
MAC Address = ?

ARP Request
     ↓
"Who has 192.168.1.20?"

ARP Reply
     ↓
"My MAC is AA:BB:CC:DD:EE:FF"
```


### 8.8 Routing Protocols 

|Protocol|Full Name|定義|
|---|---|---|
|OSPF|Open Shortest Path First|Link-State Dynamic Routing Protocol，自動學習最佳路徑。|
|EIGRP|Enhanced Interior Gateway Routing Protocol|一種 Dynamic Routing Protocol，最初由 Cisco 開發。|

```cisco-ios
router ospf 1
network 192.168.1.0 0.0.0.255 area 0
```

- `OSPF` → Term / Protocol
- `router ospf 1` → Command
- `network ... area 0` → Command

### 8.9 Historical Term 

|Term|正確名稱|定義|
|---|---|---|
|ARPANET|Advanced Research Projects Agency Network|早期的封包交換網路，也是現代 Internet 發展的重要前身之一。|







----
## References

