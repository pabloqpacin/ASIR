# @PowerCertAnimatedVideos: [CompTIA Network+ Certification Video Course](https://youtu.be/vrh0epPAC5w&ab_channel=PowerCertAnimatedVideos)

> 2016

<details>
<summary>Table of Contents</summary>

- [@PowerCertAnimatedVideos: CompTIA Network+ Certification Video Course](#powercertanimatedvideos-comptia-network-certification-video-course)
  - [Topologies:  00:08](#topologies--0008)
  - [Connectors:  7:49](#connectors--749)
  - [Cable Standards:  15:50](#cable-standards--1550)
  - [Firewalls:  23:35](#firewalls--2335)
  - [Wiring Standards:  30:38](#wiring-standards--3038)
  - [Media Types:  34:03](#media-types--3403)
  - [**Network Components**^\[OJO\]:  39:26](#network-componentsojo--3926)
  - [Wireless Technologies:  51:32](#wireless-technologies--5132)
  - [MAC Address:  54:07](#mac-address--5407)
  - [OSI Model:  55:30](#osi-model--5530)
  - [IP Address^\[OJO\]:  59:46](#ip-addressojo--5946)
  - [Subnetting:  1:46:09](#subnetting--14609)
  - [IP Addressing Methods:  1:16:56](#ip-addressing-methods--11656)
  - [TCP/IP Protocol Suites:  1:24:38](#tcpip-protocol-suites--12438)
  - [Ports:  1:37:30](#ports--13730)
  - [Networking Services:  1:39:00](#networking-services--13900)
  - [Routing Protocols:  1:47:36](#routing-protocols--14736)
  - [~~WAN Technologies:  1:55:55 (...)~~](#wan-technologies--15555-)
  - [Network Types:  2:06:58](#network-types--20658)
  - [Remote Access Protocols \& Services:  2:12:09](#remote-access-protocols--services--21209)
  - [Authentication Protocols:  2:19:34](#authentication-protocols--21934)
  - [Networking Tools \& Safety:  2:23:03](#networking-tools--safety--22303)
  - [Cloud \& Virtualization:  2:35:04](#cloud--virtualization--23504)
  - [Wiring Distribution:  2:45:24](#wiring-distribution--24524)
  - [VLAN \& Intranet / Extranet:  2:49:44](#vlan--intranet--extranet--24944)
  - [Optimization \& Fault Tolerance:  2:52:34](#optimization--fault-tolerance--25234)
  - [Security Protocols:  3:03:45](#security-protocols--30345)
  - [SOHO Routers:  3:07:26](#soho-routers--30726)
  - [Network Utilities:  3:19:22](#network-utilities--31922)
  - [Networking Issues:  3:32:13](#networking-issues--33213)
  - [Troubleshooting Steps:  3:41:52](#troubleshooting-steps--34152)

</details>

<!-- ## Intro:  00:00 -->


## Topologies:  00:08

- Star (single point of failure)
- Bus (outdated)
- Ring (outdated)
- Mesh (each to each)
- HYBRID (multiple hub/switch)
  - Star ring
  - Star bus
- Point to Point
- **Client-Server**
- Point to Multipoint (outdoors)
- Peer to Peer

## Connectors:  7:49

- RJ-11: <!--Registered Jack--> telephone & modems
- RJ-45: twisted pair cabling; LAN
- RJ-48c: shielded tw. pair; T1 lines
- UPT-Coupler: adapter/extender
- BNC-Connector
- BCN Coupler
- Fiber-coupler VS fiber-adapter
- F-Type: coaxial, cable modems
- USB-connector <!--Universal Serial Bus-->
- IEEE 1394: 'D' shape, peripherals (camera, etc.)
- MT-RJ: *fiber*
- ST-connector: single-mode fiber
- LC-connector: fiber, between Floors in building
- SC-connector: same as LC
- RS-232
- APC vs UPC
  - UPC: reflection, data loss
  - APC: angle, no signal loss

## Cable Standards:  15:50

- Ethernet over HDMI
- Ethernet over powerline
- 10BASE-T,10BASE-2,100BASE-T,100BASE-FX,1000BASE-T,1000BASE-TX,10GBASE-T,10GBASE-SR,10GBASE-ER,10GBASE-SW

## Firewalls:  23:35

- Intro
  - Either software or hardware
  - Designed to prevent unauthorized access from entering a private network
  - Blocks unwanted traffic and permits wanted traffic
- **ACL**: Access Control List
  - lists IP address and allows/denies access
- Implicit Deny (default config, ports)
- Types
  - Host-based: software; single-computer; OS or 3rd party
  - Network-based: soft+hard
- Stateful VS Stateless
  - Stateful: monitors all connections, keeps record; dynamic protection
  - Stateless: only ACL to allow/deny, no record
- Content filtering (content not-source, email)
- Signature identification: viruses bc behavior pattern
- IDS/IDP: intrusion detection or Prevention system (hard/soft), alert and prevent outside attacks (virus, malware, hackers)

## Wiring Standards:  30:38

- 568 Wiring

## Media Types:  34:03

> Cable **Categories**

| Cat | Speed Mbps | Standard  |
| --- | ---        | ---       |
| 3   | 10         | 10 Base-T 
| 5   | 100        | 100 Base-T & TX
| 5e  | 1000       | 1000 Base-T
| 6   | 1000-10k   | 1000-10G Base-T
| 6a  | 10k        | 10G Base-T

- UTP [Unshielded Twisted Pair]
  - +twists,+better
  - LAN
- STP [Shielded ...]
  - metal shieldin
- Coaxial
  - By providers
  - RG-6 == long distances (TV + internet)
  - RG-59 == short distances (HD)
- FIBER
  - SMF [Single Mode Fiber]: light enters at one angle; long distances
  - MMF [Multi Mode Fiber]: light reflects on wallz; short dist
- *Media Converter*

## **Network Components**^[OJO]:  39:26

- DOCSIS Modem [Data Over Cable Service Interface Specifications]
  - Supports speeds of 10 GB downstream & 1 Gigabit upstream
- Hub: copies to all ports
- Switch (smart) {Layer 2}
  - learns addresses and directs data to INTENDED port
  - *Multilayer Switch* {Layers 2-3} as a Router
  - *Content Switch* {L 4-7} load balancing & advanced filtering

- PoE (Power over Ethernet)
- Spanning Tree (protocol; multiple switchez)
- Bridges (filters traffic based on MAC)
- Router (routes Packets across networkz per IP address) "gateway"
- Gateway (joins 2 networks; changes format, not data) {protocols}
- CSU/DSU: converts Data from LAN to WAN (Channel-Data Service Unit)
- NICs (Network Interface Card) == *MAC address*
- Transceiver: receives and sends data [device]
- WAPs (Wireless Access Point)
- Modem: internet via telephone; converts analog to digital 

## Wireless Technologies:  51:32

- 802.11: Wireless -- Standards (A,B,G,N,AC; diff speed n frequency)
- Infrared: rays of light (~~radiolights~~)
- Bluetooth: **2.4 GHz** & *24 Mbps*

## MAC Address:  54:07

- Media Access Control
- Unique ID for device
- 6 byte hex num in NIC
- Two parts
  - 3 bytes = manufacturer
  - 3 bytes = unique device

## OSI Model:  55:30

- Open Systems Interconnect
- 7 Layers 
    1. Application: supports email, HTTP, FTP; human readable data
    2. Presentation: compressed/decompressed, encrypted/decrypted (translation)
    3. Session: directs traffic, manages connection between local/remote app
    4. Transport: resend packages, ensures packets are sent/received
    5. Network: routes packets based on IP address, fragments packets, defines destination
    6. Data Link: send data to physical, *packets-bits*, flow control and frames sync, two sublayers (MAC and LLC)
    7. Physical: network standards, physical features (connectors, media, cables, voltages), topology!

## IP Address^[OJO]:  59:46

- intro
  - numeric address
  - id for device on network
  - two parts IPv4 (eg. `192.168.1.39`)
    - network address == `192.168.1` because Subnet Mask
    - host address == `39` in this case
  - two types
    - IPv4: 32-bit numeric address, 4 octets in ranges 0-255 {BIN}
    - IPv6: next-gen, 128-bit hex address {HEX}
  - Subnet Mask (eg. `255.255.255.0`)
    - classes: A=255x1, B=255x2, C=255x3
  - IP Classes and Ranges

| Class | First Octet Address | Default Subnet Mask |
| ---   | ---                 | ---                 |
| A     | 001 - 126           | 255.0.0.0
| B     | 128 - 191           | 255.255.0.0
| C     | 192 - 223           | 255.255.255.0
| D?
| E?

> 127 is reserved for 'loopback testing'

- Public VS Private IP address
  - Private == not publicly registered; can't access the internet directly
  - EG. 10 computers, 10 private IPs, **1 public IP** from ISP
  - Ranges

| Class | IP Range                      | Subnet Mask |
| ---   | ---                           | ---         |
| A     | 10.0.0.0 - 10.255.255.255     | 255.0.0.0
| B     | 172.16.0.0 - 172.31.255.255   | 255.255.0.0
| C     | 192.168.0.0 - 192.168.255.255 | 255.255.255.0

## Subnetting:  1:46:09

- EG. `173.16.0.0` == `255.255.0.0`
  - Formula `2^n-n` (`n` = number of bits)
  - `255.255.224.0`

> ...

## IP Addressing Methods:  1:16:56

- Dynamic IP
  - auto-assigned by DHCP Server (Dynamic Host Config Protocol)
  - Dynamic IP + Subnet Mask + Default Gateway + DNS Server
- Static IP
  - manually assigned
- Self-assigned
  - APIPA == Automatic Private IP Address Assignment (if NOT DHCP Server)

- Scope (DHCP)
  - 'Group and range of consecutive IP addresses for computers that get their IP address from a DHCP server'
- Reservation
  - Ensures device (MAC address) always gets same IP from DHCP
- Lease
  - amount of time an IP is assigned to a computer
- DHCP Relay = IP Helper
  - Same VS Different subnets

## TCP/IP Protocol Suites:  1:24:38

- **TCP** (Transmission Control Protocol)
  - Connection oriented protocol (first session, then comm)
    - SYN message, SYN ACK message back, ACK RECEIVED to complete setup

- **UDP** (User Datagram Protocol)
  - Connection-less (no session, doesn't guarantee delivery)
    - Only-sends, doesn't check; faster tho

- FTP (File Transfer Protocol)
  - Standard web protocol to upload-download files (via browsers/other software)
  - Connection oriented using **TCP**

- TFTP (Trivial File Transfer Protocol)
  - Not over the internet but over the *same network*
  - Connectionless (UDP)

- SFTP (Secure File Transfer Protocol)
  - similar to FTP; +security (*encryption*)

- SMTP (Simple Mail Transfer Protocol) <!--Sending Mail To People-->
  - **TCP** (ensures delivery)

- POP3 (Post Office Protocol ver.3)
  - Downloads email if any (only receive); likely remove from server if downloaded

- IMAP4 (Internet Message Access Protocol ver.4)
  - Receive email & keep copy in server!
  - Syncs email server WITH local computer files

- HTTP (Hypertext Transfer Protocol) & HTTPS (Secure tal)
  - View webpages on the internet
  - S = encryption for sensitive data

- Telnet (Terminal emulation program)
  - 'send commands remotely'; not secure bc clear text
  - LAN only!!

- SSH (Secure Shell)
  - Encryption

- ARP (Address Resolution Protocol)
  - Used to resolve IP add. into MAC add.
  - ARP cache provides MAC address, else broadcast message to find out

- RARP (Reverse ...)
  - Resolve MAC into IP

- NTP (Network Time Protocol)
  - 'US Naval Observatory master clock' to sync time

- SCP (Secure Copy Protocol)
- SNMP (Simple Network Management Protocol)
  - peripherals in LAN

## Ports:  1:37:30

- How to receive data? // Two [2] protocols: TCP and UDP
- '**Logical connection** to exchange information'
- Unique number {0 - 65535}

| Port Number | Service | Port Number | Service |
| ---         | ---     | ---         | ---     |
| 80          | *HTTP*  | 20,21       | *FTP*
| 443         | *HTTPS* | 161         | SNMP
| 137-139     | NetBIOS | 22          | *SSH*
| 110         | *POP*   | 23          | *TELNET*
| 143         | IMAP    | 53          | *DNS*
| 25          | *SMTP*  | 67,68       | DHCP
| 5060/5061   | SIP     | 69          | TFTP
| 2427/2727   | MGCP    | 445         | SMB
| 1720        | H.323   | 5004/5005   | RTP

## Networking Services:  1:39:00

- DNS (Domain Name Systems)
  - DNS Database == Domain Name = IP Address

- WINS (Windows Internet Name Service)
  - Computer = IP

- NAT (Network Address Translation)
  - Private IP to public & viceversa

- PAT (Port Address Translation)
- SNAT (Static Network Address Translation): links public to private permanently
- *Proxy* Service
  - 'Cached Web Page Database on Proxy Server'
  - Benefits: Speed, Bandwidth, Security
- RDP (Remote Desktop Protocol) {Microsoft}
- *CSMA/CD* (Carrier Sense Multiple Accesss with Collision Detection) {Wired networks}
- CSMA/CA (... with Collision Avoidance) {WIRELESS} Test, then comm
- Broadcast: single transmitter, multiple receivers
- Unicast VS Multicast: one VS multiple destinations

## Routing Protocols:  1:47:36

- Loopback Interface: virtual interface on router, IP address assigned, used for testing and admin purposes
- Routing Table: set of rules for Packets' path to dest
  - network dest (IP add), Subnet mask, Gateway, Interface (outgoing IP), Next hop, Metric

## ~~WAN Technologies:  1:55:55 (...)~~
## Network Types:  2:06:58
## Remote Access Protocols & Services:  2:12:09
## Authentication Protocols:  2:19:34
## Networking Tools & Safety:  2:23:03
## Cloud & Virtualization:  2:35:04
## Wiring Distribution:  2:45:24
## VLAN & Intranet / Extranet:  2:49:44
## Optimization & Fault Tolerance:  2:52:34
## Security Protocols:  3:03:45
## SOHO Routers:  3:07:26
## Network Utilities:  3:19:22
## Networking Issues:  3:32:13
## Troubleshooting Steps:  3:41:52