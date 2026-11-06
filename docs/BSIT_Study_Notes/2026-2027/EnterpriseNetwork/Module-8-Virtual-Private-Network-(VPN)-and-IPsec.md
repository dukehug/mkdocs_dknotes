
# Module - 8  Virtual  Private Network  (VPN) and IPsec

2026-11-06 22:03

Tags: #enterpriseNetwork 

Author:  Duke Hsu

---

## Topic

1. VPN Technology
2. Types of VPNs
3. IPsec

## 1. VPN Technology

Virtual Private Networks - VPN

- VPNs to create end-to-end private network connections.
- A VPN is virtual in that it carries information within a private network, but that information is actually ==transported over a public network==.
- A VPN is private in that the ==traffic is encrypted== to keep the data confidential while it is transported across the ==public network== . 

### 1.1  VPN Benefits

- Modern VPNs now support encryption features, such as Internet Protocol Security (IPsec) and Secure Sockets Layer(SSL). VPNs to secure network traffic betwwen sites. 
- Major benefits of VPNs
	- Security:   Encryption , Authentication
	- Scalability
	- Compatibility

### 1.2 Site-to-Site  VPN

- A site-to-site VPN is terminated on VPN gateways
- VPN traffic is only encrypted between the gateways
- Internal hosts have no knowledge that a VPN is being used or exists

![](https://img.dukehsu.com/blackboard/Site-to-Site_VPN.webp)

### 1.3 Remote Access VPN

- A remote-access VPN is dynamically created to establish a secure connection between a client and a VPN terminating device.

![](https://img.dukehsu.com/study_note/Remote-Access-VPN.webp)


#### a. 什麼是 VPN Gateway？

VPN gateway 是「負責建立、終止 VPN 隧道的設備」，通常是路由器、防火牆，或是專用的 VPN 設備。它做兩件事：

- 對外送出的封包：加密並封裝後，送進隧道
- 對內收到的封包：解密、拆封裝後，轉交給內部網路

**L2TP VPN 的 server 是 VPN gateway 嗎？** 是的，但要看用在哪種場景。「VPN gateway」是角色名稱，不是特定協定。L2TP/IPsec 只是隧道使用的協定，跑這個協定的設備就扮演 gateway 的角色。

- 在 remote access VPN 中：你的手機或筆電連到公司的 L2TP server，這個 server 就是 VPN gateway（只是它的另一端是單一個 client，不是另一個網路）。
- 在 site-to-site VPN 中：兩端都是 gateway，彼此建立隧道。

你家的 MikroTik hAP ac2 同時可以扮演這兩種角色，既能當 L2TP server 讓外出的你撥入，也能和另一台路由器建立 IPsec 或 WireGuard site-to-site 隧道。

####  b. Site-to-Site VPN 的應用場景

核心用途：**把兩個以上的固定網路，安全地連成一個邏輯上的大網路**，而且不需要拉專線（專線很貴）。

真實案例：

- **連鎖店與總部**：一家在馬尼拉有總部、在宿霧和達沃各有分店的公司，分店的 POS 要連回總部的 PostgreSQL 資料庫。每間分店的路由器與總部路由器建立 site-to-site VPN，分店的 POS 就像在總部內網一樣存取資料庫。
- **你的客戶場景**：你幫企業客戶做維護與監控，如果客戶有兩個辦公室，兩邊各有 NAS，要做異地備份，site-to-site VPN 讓兩台 Synology 用內網 IP 直接互相同步，不必把 NAS 暴露在公網上。
- **雲端與地端**：公司機房的內網連到 AWS VPC，讓雲端的伺服器能存取地端的內部系統。

簡單比較：

|       | Site-to-Site | Remote Access     |
| ----- | ------------ | ----------------- |
| 連接對象  | 網路 ↔ 網路      | 單一裝置 ↔ 網路         |
| 誰建立連線 | 兩端 gateway   | 使用者的裝置（需裝 client） |
| 連線狀態  | 通常常駐         | 用的時候才撥            |
| 例子    | 分店連總部        | 你在咖啡廳連回家裡         |


#### c. 「Client has no knowledge of VPN」是什麼意思？

意思是：**內部的電腦不知道、也不需要設定任何 VPN**。圖中左邊的筆電只是普通地把封包送給預設閘道（也就是左邊那台路由器），VPN 的工作全由 gateway 代勞。

用郵局當類比：

> 你（筆電）寫一封信，丟進公司的收發室（gateway）。收發室把信裝進一個上鎖的保險箱（加密並封裝），再交給快遞（Internet）送到對方公司的收發室。對方收發室開鎖、取出信，交給收件人。你從頭到尾只做了「寫信、交給收發室」，完全不知道中間用了保險箱。

具體流程：

1. 左邊筆電要連右邊網路的伺服器 `10.2.0.10`，封包照常送給預設閘道。
2. 左邊 gateway 發現目的地在對方網路，於是加密封包並封裝成新的封包（外層 IP 是兩台 gateway 的公網 IP），送進 Internet。
3. 右邊 gateway 收到後解密，還原成原本的封包，交給 `10.2.0.10`。
4. 回程反向處理。

這也解釋了投影片第二點：**加密只存在於兩台 gateway 之間**。筆電到 gateway 那一小段（圖中的黑線）以及右邊 gateway 到伺服器那一段，都是明文，因為它們都在各自的內網裡，被視為可信任。

這也是和 remote access VPN 最大的差別：remote access 時，你的筆電上要裝 VPN client（或系統內建的 L2TP 設定），所以 client「知道」VPN 的存在。

如果想進一步練習，可以試著在 Packet Tracer 或 GNS3 上用兩台 Cisco 路由器做一次 IPsec site-to-site 實作，這樣對 gateway 的角色會更有感覺。


### 1.4 Enterprise VPN

- Common solution for securing enterprise traffic across the internet. 
- Site-to-Site and remote access VPNs are created and managed by the enterprise using IPsec and SSL VPNs

Site-to-Site VPNs
- IPsec
- GRE
- GRE over IPsec
- Cisco Dynamic Multipoint Virtual Private Network (DMVPN)
- IPsec Virtual Tunnel Interface(VTI)

Remote Access VPNs

- Client-based IPsec VPN connection
- Clientless SSL connection
### 1.5 Service Provider VPNs

- ISP created and managed  the network. 
- The ISP uses Multipotocol Label Switching (MPLS) at Layer 2 or Layer 3 to create secure channels between and enterprise's sites, effectively segregating the traffic from other customer traffic. 


## 2. Types of VPNs

-





----
## References
