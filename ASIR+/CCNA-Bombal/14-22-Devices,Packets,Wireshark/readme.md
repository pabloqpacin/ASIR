# @DavidBombal Packet-stuff

<details>
<summary>Table of Contents</summary>

- [@DavidBombal Packet-stuff](#davidbombal-packet-stuff)
  - [14. Cabling and Packet Flows](#14-cabling-and-packet-flows)
    - [68. How does data flow in hubs, switches and routers?](#68-how-does-data-flow-in-hubs-switches-and-routers)
    - [69. Ethernet history](#69-ethernet-history)
    - [70. 10base2, MAC addresses](#70-10base2-mac-addresses)
    - [71. MAC Addresses, CSMA/CD and Collision domains](#71-mac-addresses-csmacd-and-collision-domains)
    - [72. Broadcast domains UTP \& Cross Over Cables](#72-broadcast-domains-utp--cross-over-cables)
    - [73. Which cable should you use and Cable Categories](#73-which-cable-should-you-use-and-cable-categories)
    - [74. SFPs, DAC, Roll Over cable and How Devices Operate, Hubs](#74-sfps-dac-roll-over-cable-and-how-devices-operate-hubs)
    - [75. How does a Hub forward traffic?](#75-how-does-a-hub-forward-traffic)
    - [76. What is a bridge?](#76-what-is-a-bridge)
    - [77. How does a bridge forward traffic and what is a switch?](#77-how-does-a-bridge-forward-traffic-and-what-is-a-switch)
    - [78. How do switches forward traffic?](#78-how-do-switches-forward-traffic)
    - [79. What is half-duplex and full-duplex?](#79-what-is-half-duplex-and-full-duplex)
    - [80. What is a router?](#80-what-is-a-router)
    - [81. How does a router forward traffic?](#81-how-does-a-router-forward-traffic)
    - [82. How is traffic routed between subnets and routen between subnets](#82-how-is-traffic-routed-between-subnets-and-routen-between-subnets)
    - [83.  Does a router chagne the MAC address or IP address?](#83--does-a-router-chagne-the-mac-address-or-ip-address)
    - [84.  Summary of routing, MAC addresses and IP addresses](#84--summary-of-routing-mac-addresses-and-ip-addresses)
    - [Quiz #6](#quiz-6)
  - [15. Physical Terminations Cheat Sheet](#15-physical-terminations-cheat-sheet)
  - [16. Life of a Packet: Packet Tracer Labs](#16-life-of-a-packet-packet-tracer-labs)
    - [86. Life of  Packet **Q**](#86-life-of--packet-q)
    - [87. Life of  Packet **A**](#87-life-of--packet-a)
  - [17. Broadcast and collision domains](#17-broadcast-and-collision-domains)
    - [88. Can you answer the questions?](#88-can-you-answer-the-questions)
    - [89. Answers (1): ARP](#89-answers-1-arp)
    - [90. Answers (2): Broadcast and Collision domains](#90-answers-2-broadcast-and-collision-domains)
    - [91. Answers (3): Broadcast and Collision domains](#91-answers-3-broadcast-and-collision-domains)
  - [18. Duplex and Speed Mismatch Demo](#18-duplex-and-speed-mismatch-demo)
    - [92. Demo](#92-demo)
    - [93. Introduction](#93-introduction)
    - [94. Late Collisions](#94-late-collisions)
    - [95. Fix Issue between router and switch](#95-fix-issue-between-router-and-switch)
    - [96. Fix Other Switch Issues](#96-fix-other-switch-issues)
    - [97. PC and Switch](#97-pc-and-switch)
  - [19. What is a loopback?](#19-what-is-a-loopback)
    - [98. What is a loopback? Why is it used?](#98-what-is-a-loopback-why-is-it-used)
    - [99. Another reason to use a loopback - OSPF](#99-another-reason-to-use-a-loopback---ospf)
  - [20. TCP UDP](#20-tcp-udp)
    - [100.](#100)
  - [21. Wireshark Introduction](#21-wireshark-introduction)
  - [22. Wireshark Basics](#22-wireshark-basics)
    - [111. Capture frames / frames / segments](#111-capture-frames--frames--segments)
    - [112. Why are no packets captured?](#112-why-are-no-packets-captured)
    - [113. Port SPAN / Mirroring](#113-port-span--mirroring)

</details>

## 14. Cabling and Packet Flows

### 68. How does data flow in hubs, switches and routers?

| Layer | Device | Data |
| ---   | ---    | ---  |
| 3     | Router | Packet
| 2     | Switch | Frame
| 1     | cables | BIN  

- Types of Communication
  - Unicast: one-to-one <!--devices-->
  - Multicast: one-to-some
  - Broadcast: one-to-all (generally restricted // NOT SUPPORTED in IPv6)


### 69. Ethernet history

| Layer         | stuff |
| ---           | ---   |
| 4 - Transport | TCP/UDP protocols,
| 3 - Network   | IP Address, ROUTER, Layer-3-Switch
| 2 - Data Link | MAC Address, BRIDGE, SWITCH
| 1 - Physical  | RJ-45, cable specifications, voltage... // HUB, physical interfaces

- Ethernet
  - Born in 1970s
    - **Bus Topology** <!--single cable--> ~= telephone line; all devices receive frames from any device == collisions!
    - 10base5 == thicknet (500 meters)
    - **10base2** == thinnet (185 meters max)
      - coax-cable, 10 Mbps, *baseband* <!--~~broadband~~-->, 2 for 185m max segment size
        - baseband = single signal IE all frequencies // broadband = multiple signals IE certain freqs (eg. TV)
    - Terminator in cable-end == stop signal bouncing back

### 70. 10base2, MAC addresses

- MAC Address <!--aka Physical Address-->^[Change MAC Address on Windows: NetworkConnections > NetworkCard > Properties > Config > Advanced > Locally Administered Address]
  - Layer-2, built-in by manufacturer
  - 48 bits <!--ie. 6 octets-bytes-->
    - 1st 24 bits == OUI <!--Organizationally Unique Identifier--> == Vendor ID
      - FINDERS: [Wireshark-OUI-Lookup](https://www.wireshark.org/tools/oui-lookup.html), [IEEE](https://standards-oui.ieee.org/)
    - Last 24 bits == Station Address == Vendor assigned end station address (unique ID)

![MAC infograph](/ASIR+/CCNA-Bombal/img/MAC-infograph.png)

- MAC Address
  - b1
    - 0==unicast
    - 1==multicast {Switch will flood!}
  - b2
    - 0==uniqueID
    - 1==locallyChanged

### 71. MAC Addresses, CSMA/CD and Collision domains

- CSMA/CD <!--carrier-sense multiple-access with collision-detection-->
  - carrier-sense == 'anyone speaking?' asks a device in the Bus Topology
  - multiple-access == any device can communicate as long as no other is doing it
  - collision-detection == "Backoff/JAM" alert if so

> Analogy!

- *10base2* Issues
  - The more devices connected, the more collisions
  - Cable Length: the longer, the greater signal degradation
  - Cable Break: meaning Network INOP
  - Bandwidth shared
  - 'Single Collision Domain'
  - 'Single Broadcast Domain': <!--useless CPU interference-->

### 72. Broadcast domains UTP & Cross Over Cables

- **10baseT** <!--not common-->
  - 100m max segment size
  - 10 Mbps
  - Connectors: RJ-45
  - [UTP] Unshielded Twister-Pair (Shielded if noisy environment <!--avoid electro-magnetic interference-->)
    - Outer Jacket > Twister Pair > Color-Coded Plastic Insulation > RJ-45
    - T568A vs **T568B**
    - [STC] Straight-Through-Cables VS [COC] Cross-Over-Cable {Pins Symmetry...}

> Auto MDI/MDIX^[ASIR... ]

### 73. Which cable should you use and Cable Categories

- Cable Categories
  - Higher Category == more twists, less susceptible to electromagnetic interference, stringent for cross-talk and system noise, highter  Freqs & Speeds

| Cable Cat | Bandwidth | Max. Data Rate | Max Distance | Usage |
| ---       | ---       | ---            | ---          | ---   |
| ~~1~~     | 
| ~~2~~     | 
| 3         |           |                |              | Telephonez
| ~~4~~     | 
| 5         | 100 MHz   | 10/100 Mbps    | 100 meters
| 5e        | 100 MHz   | 1 Gbps         | 100 meters
| 6         | 250 MHz   | 1/10 Gbps      | 100 meters
| 6a        | 500 MHz   | 10 Gbps        | 100 meters
| 7         | 600 MHz   | 10 Gbps        | 100 meters
| ~~7a~~    | 1000 MHz  | 100 Gbps       | 100 meters
| 8         |           |                | 30 meters
| 8.1       | 2000 MHz  | 25 Gbps        |
| 8.2       | 2000 MHz  | 40 Gbps        |


### 74. SFPs, DAC, Roll Over cable and How Devices Operate, Hubs

<details>
<summary>DAC, ROC</summary>

- [DAC] Direct-Attachment-Cable (Copper Twinax): 15m max, SFP
- [ROC] Roll-Over-Cable: {PC-COM --x-- Device-Console-Port} 

</details>

> from `10base2-bus` to `10baseT-star`

- 'How do network devices work?'
  - **HUB - 10baseT** <!--as for Wireless!!!!!!-->
    - Layer-1
    - Cat5 UTP-cable (RJ-45)
    - multiple ports == multiple devices OK
    - *multiport repeater* (no intelligence) == amplify frames out to all interfaces!
    - Topology: Physical==Star Logical==Bus <!--because all devices receive-->
      - Single Collision Domain & Single Broadcast Domain <!--meaning all devices/CPUs receive the frame and are interrupted, not good-->
      - 10 Mbps shared = 10/4-devices * 30% performance (case collisions, etc.) = **0.75 Mbps/device** 
    - advantages
      - cable break == network NOT INOP
      - can extend to further distances easily
      - cabling cheaper & easier to manage

### 75. How does a Hub forward traffic?

> EXAMPLE

### 76. What is a bridge?

- BRIDGE
  - Layer-2
  - has a MAC address table (Software) // {CAM table for SWITCHES (Content Addressable Memory)}
    - *Software* (slow!)
    - doesn't repeat to all...once has learnt the MACs!
      - meaning that it won't use bandwidth of other ports
  - Topology==Star // but Limited number of ports
  - each port == Separate Collision Domain
  - still Single Broadcast Domain <!--NOT OK aka Broadcast Storm-->

> EXAMPLE [SA:A DA:C] == macA=port1 macC=port3; now it has learnt!

### 77. How does a bridge forward traffic and what is a switch?

- SWITCHEZ
  - MAC table > Hardware > ASICs (Application Specific Integrated Circuits)
  - Topology==Star
  - advantages
    - many ports {scalability}
    - no degradation performance between two devices
    - wire speed switching of frames (high traffic)
  - same issues as BRIDGES but better performance!!
  - Separate-Collision-Domain && Single-Broadcast-Domain
    - `DA:FFFFFF` == Switch floods ALL ports EXCEPT the one received {`Broadcast` }
  - dedicated bandwidth -> 10 Mbps / device

> NOTE...

| Throughput | Type        | this    | note |
| ---        | ---         | ---     | ---  |
| 10 Mbps    | Half-Duplex | CSMA/CD |
| 20 Mbps    | Full-Duplex | CSMA    | assume devices can send-receive at the same time // both sides should be enabled!

### 78. How do switches forward traffic?

>   EXAMPLE -> first packet to all —but Source— cuz dunno MACz; then learns!!


### 79. What is half-duplex and full-duplex?

- half-duplex: 'walkie-talkie' // one side at any given time; ELSE collisions!
  - **HUBS use CSMA/CD**
- full-duplex
  - **SWITCHES can use full-duplex**
  - usually auto-set (negotiated) by network devices =D

### 80. What is a router?

- ROUTERZ
  - Layer-3
  - Interfaces: Ethernet==MAC, Serial==PPP
  - Decision Making: **IP addresses**

### 81. How does a router forward traffic?

- From IP to MAC ==> `ARP` (Address Resolution Protocol)

> EXAMPLE == A pings C (IP), hence first map MAC with **ARP** (`FFFFFF` broadcast if not entry yet!)

![Routers-firstPing](/ASIR+/CCNA-Bombal/img/Router-Traffic--firstPing.png)

> DO THE *CMD* `arp` + *Wireshark* in **VM**

```bash
# BROADCAST DEMO
arp -a
arp -d
ping <tal>
arp -a
    # wireshark
```

### 82. How is traffic routed between subnets and routen between subnets

- Device Communication in subnet -> send broadcast to local segment to find MAC according with target IP
  - router can forward broadcast if MACs match!
  - eventually devices know MACs associated with IPs {via ARP}

### 83.  Does a router chagne the MAC address or IP address?

- Device Comm to different subnet (ping)
  - A checks its IP address VS B's with mask (same or not subnet AKA local or remote)

> **EXAMPLE** <!--complicated but good--> + Wireshark Demo

### 84.  Summary of routing, MAC addresses and IP addresses

- From within subnet OR one subnet to another; headers contain Layer2+Layer3 (Source,DestMAC+Source,DestIP)
  - frames are sent, received and dropped or replied to!
  - **Layer2 info is UPDATED in each segment!!** - whereas Layer3 remains the same

### Quiz #6

> good

## 15. [Physical Terminations Cheat Sheet](https://d3gvvapon6fqzo.cloudfront.net/pdf_viewer/web/viewer.html?file=https://www.filepicker.io/api/file/CYTDZiLTD6K6GK6Rmu9U)
## 16. Life of a Packet: Packet Tracer Labs

### 86. Life of  Packet **Q**
### 87. Life of  Packet **A**

## 17. Broadcast and collision domains

### 88. Can you answer the questions?
### 89. Answers (1): ARP
### 90. Answers (2): Broadcast and Collision domains
### 91. Answers (3): Broadcast and Collision domains

## 18. Duplex and Speed Mismatch Demo

### 92. Demo
### 93. Introduction
### 94. Late Collisions
### 95. Fix Issue between router and switch
### 96. Fix Other Switch Issues
### 97. PC and Switch

## 19. What is a loopback?

### 98. What is a loopback? Why is it used?
### 99. Another reason to use a loopback - OSPF

---

## 20. TCP UDP

### 100. 

## 21. Wireshark Introduction

> Default installation

> [ERROR - Windows11](https://github.com/nmap/npcap/issues/628)

## 22. Wireshark Basics

### 111. Capture frames / frames / segments



### 112. Why are no packets captured?
### 113. Port SPAN / Mirroring