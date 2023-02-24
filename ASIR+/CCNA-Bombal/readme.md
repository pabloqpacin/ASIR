# @DavidBombal's [Complete Networking Fundamentals Course. Your CCNA Start](https://www.udemy.com/course/complete-networking-fundamentals-course-ccna-start/)

<!-- > 2023-02-15 -->

> [Curriculum](/ASIR+/CCNA-Bombal/curriculum.md)


<details>
<summary>Table of Contents</summary>

- [@DavidBombal's Complete Networking Fundamentals Course. Your CCNA Start](#davidbombals-complete-networking-fundamentals-course-your-ccna-start)
  - [1. ~~Welcome~~](#1-welcome)
  - [2. Download Recommended Software](#2-download-recommended-software)
    - [7. Packet Tracer Tips and Tricks](#7-packet-tracer-tips-and-tricks)
  - [3. ~~Basic Networking Terms~~](#3-basic-networking-terms)
  - [4. TCP/IP Model](#4-tcpip-model)
    - [17. Practical TCP/IP Model Part 1: Bits, Frames, Packets, Segments and more](#17-practical-tcpip-model-part-1-bits-frames-packets-segments-and-more)
    - [18. Practical TCP/IP Model Part 2: HTTP Captures](#18-practical-tcpip-model-part-2-http-captures)
    - [19. Practical TCP/IP Model Part 3: Port Numbers](#19-practical-tcpip-model-part-3-port-numbers)
    - [20. Practical TCP/IP Model Part 4: E-mail and FTP captures](#20-practical-tcpip-model-part-4-e-mail-and-ftp-captures)
  - [5. ~~Binary~~](#5-binary)
  - [6. ~~Hexadecimal~~](#6-hexadecimal)
  - [7. IP Addressing](#7-ip-addressing)
    - [28. IP Addressing Overview and Demonstration](#28-ip-addressing-overview-and-demonstration)
    - [29. IP Characteristics and IPv4 Address Format](#29-ip-characteristics-and-ipv4-address-format)
    - [30. Network vs Host portion](#30-network-vs-host-portion)
    - [31. IPv4 Address Format (Street Analogy) and Address Classes](#31-ipv4-address-format-street-analogy-and-address-classes)
    - [32. Class A and B addresses](#32-class-a-and-b-addresses)
    - [33. Class C, D, E, A and B addresses](#33-class-c-d-e-a-and-b-addresses)
    - [34. Special IPv4 Addresses and Direct Broadcast Address](#34-special-ipv4-addresses-and-direct-broadcast-address)
    - [35. Local Broadcast Address](#35-local-broadcast-address)
    - [36. Local Loopback Address](#36-local-loopback-address)
    - [37. RFC1918 - Private Addresses](#37-rfc1918---private-addresses)
    - [38. RFC1918 - Class A, B, C and IPv4 Link Local Addresses](#38-rfc1918---class-a-b-c-and-ipv4-link-local-addresses)
    - [39. Subnet Mask](#39-subnet-mask)
    - [40. Subnet Mask demonstrations and Discontinuous Network Mask](#40-subnet-mask-demonstrations-and-discontinuous-network-mask)
    - [41. CIDR Notation Part 1 and Part 2](#41-cidr-notation-part-1-and-part-2)
    - [42.CIDR Notation Part 3](#42cidr-notation-part-3)
  - [8. Initial Device Configuration](#8-initial-device-configuration)
    - [46. Build a Basic Cisco Network (R1-S1-R2)](#46-build-a-basic-cisco-network-r1-s1-r2)
    - [47. Quiz #4](#47-quiz-4)
  - [9. IP Subnetting](#9-ip-subnetting)
  - [10. Subnetting Packet Tracer Lab 1](#10-subnetting-packet-tracer-lab-1)
  - [11. Subnetting Packet Tracer Lab 2](#11-subnetting-packet-tracer-lab-2)
  - [12. IPv4 Subnetting Cheat Sheet](#12-ipv4-subnetting-cheat-sheet)
  - [13. Subnetting VLOGs - do you know the answers?](#13-subnetting-vlogs---do-you-know-the-answers)
  - [14. Cabling and Packet Flows](#14-cabling-and-packet-flows)
  - [15. Physical Terminations Cheat Sheet](#15-physical-terminations-cheat-sheet)
  - [16. Life of a Packet: Packet Tracer Labs](#16-life-of-a-packet-packet-tracer-labs)
  - [17. Broadcast and collision domains](#17-broadcast-and-collision-domains)
  - [18. Duplex and Speed Mismatch Demo](#18-duplex-and-speed-mismatch-demo)
  - [19. What is a loopback?](#19-what-is-a-loopback)
  - [20. TCP UDP](#20-tcp-udp)
  - [21. Wireshark Introduction](#21-wireshark-introduction)
  - [22. Wireshark Basics](#22-wireshark-basics)

</details>


## 1. ~~Welcome~~
## 2. Download Recommended Software

### 7. Packet Tracer Tips and Tricks

- [x] Free Cisco Course: ['Introduction to Packet Tracer'](/ASIR+/CCNA-Bombal/2-CiscoIntroCourse/2-CiscoPTintroCourse.md)
- [x] CPT > Options > Preferences
  - Misc. > Simulation [x] Buffer Filtered Events Only
  - Interface > [x] Always Show Port Labels in Logical Workspace

## 3. ~~Basic Networking Terms~~
## 4. TCP/IP Model

<details>
<summary>Details</summary>

### 17. Practical TCP/IP Model Part 1: Bits, Frames, Packets, Segments and more

> See `17. TCP_IP_OSI_Model.pkt`

| TCP/IP       | Layers | TCP/IP      |
| ---          | ---    | ---         |
| Applications | 5 - 7  | Application |
| *Segments*   | 4      | Transport
| *Packets*    | 3      | Network
| *Frames*     | 2      | Data Link
| *Bits*       | 1      | Physical

### 18. Practical TCP/IP Model Part 2: HTTP Captures

- Simulation >

### 19. Practical TCP/IP Model Part 3: Port Numbers

- 80 HTTP
- 443 HTTPS
- 21 FTP
- 69 TFTP
- 22 SSH


### 20. Practical TCP/IP Model Part 4: E-mail and FTP captures

</details>

## 5. ~~Binary~~
## 6. ~~Hexadecimal~~
## 7. IP Addressing

<details>
<summary>Details</summary>

### 28. IP Addressing Overview and Demonstration

- Layer 3 logical address assigned by an administrator (VS MAC address, built in to NIC)
- Resides at Layer 3 of OSI Model
- Used to uniquely identify specific devices on a network (by routers, etc.)
- Public VS Private 

### 29. IP Characteristics and IPv4 Address Format

- Layer 3 or network layer protocol
- *Connectionless* protocol (no session)
<!-- - {TCP (connection) :: '**3-way handshake**' -> SYN - SYN ACK - ACK} // ability to retransmit missing packets-->
- Packets treated independently
  - may take different paths... {ROUTING PROTOCOLS}
    - Load balancing
    - Bandwidth {OSPF}
    - Hopcount {RIP}
- hierarchical addressing structure
  - Network and Host portion
- *best effort delivery*
- no data recovery features // no built-in session, no retransmission
- NEEDS **TCP** == handle dropped corruped and misdirected packets
- Format == 32bit number

### 30. Network vs Host portion

- IP Address == Network + Host portions
- Network ID
  - Important cuz Routers maintain *Routing Tables*
  - look at destination of IP address and match to network address
- Host ID
  - identifies a specific endpoint of network (device)


### 31. IPv4 Address Format (Street Analogy) and Address Classes

> Historical intro

### 32. Class A and B addresses

- Class A
  - Range: 0.0.0.0 - 127-255.255.255

### 33. Class C, D, E, A and B addresses
### 34. Special IPv4 Addresses and Direct Broadcast Address
### 35. Local Broadcast Address
### 36. Local Loopback Address
### 37. RFC1918 - Private Addresses
### 38. RFC1918 - Class A, B, C and IPv4 Link Local Addresses
### 39. Subnet Mask

- Allows to determine the portion of address which is Host vs Network
- Determine:
  - Remote: thus be reached via **default gateway** -different subnet
  - Local: does not require a default gateway -same subnet

> Convert the address and mask to binary numbers...
> - 1 = Network
> - 0 = Host

### 40. Subnet Mask demonstrations and Discontinuous Network Mask

- Only *contiguous* masks supported:
  - 255.255.192.0 == 11111111.11111111.11000000.00000000 == OK
  - 255.240.0.0 == 11111111.11110000.00000000.00000000 == OK
  - 240.255.3.191 == 11110000.11111111.00000110.11000000 == NOT OK

### 41. CIDR Notation Part 1 and Part 2

> Classless Inter-Domain Routing

- Use `10.0.0.0/8` notation rather than `10.0.0.0 255.0.0.0`
  - Because '255' = 8 bits, '255.255' = 16 bits, '255.255.255' = 24 bits!!

### 42.CIDR Notation Part 3

- Ignore Class A,B,C... now **/X Masks** (THEREFORE Variable Length Subnet Mask THEREFORE N number of Hosts :D)
  - `255.224.0.0` == `11111111.11100000.0.0` ==  `/11`

</details>

## 8. Initial Device Configuration

<!--
- ...
- Need *serial* interfaces...
- ...
-->

### 46. Build a Basic Cisco Network (R1-S1-R2)

<details>
<summary>**Great success!**</summary>

> - [x] Options > Preferences > 'Always Show Port Labels in Logical Workspace'

1. Add `4321 Router` x2
2. Add `3650 Switch`
3. Cable devices with `Straight-Through Copper`
   1. `GigabitEthernet` 1st ports available
4. Give **power** to `Switch`
5. `Switch` > CLI > System Config Dialog

```bash
# Enter the initial config dialog?
YES     # always NO tho

# Enter basic management setup?
y

# Enter host name
S1

# Enter enable secret
cisco

# Enter enable passwd
cisco1

# Enter virtual terminal passwd (to SSH)
cisco

# Configure SNMP Network Management?
no

# Enter interface...
GigabitEthernet1/0/1

# Configure IP
no

# [0] Go IOS command prompt without saving [1] Return to setup without saving [2] Save config and exit
0
```

6. Enable interface... `Router01` > CLI >

```bash
# "Enter the initial config dialog?"
NO

# - Activate 'enable' mode
en

# Access `global configuration'
conf t

# Interface
int?
interface ?

# Select appropiate
interface gigabitEthernet 0/0/0
end
```
```bash
# See 'interfaces' available
show ip int brief

# CONFIG
en
conf t
int g0/0/0
ip ?

# Set IP address (eg.)
ip address 10.1.1.1 ?
ip address 10.1.1.1 255.255.2550

# ACTIVATE!
no shut
exit
```
```bash
# While in 'conf' mode
host?

# Name the router
hostname R1

# SAVE CONFIG
copy running-config st  # startup-config // enter
```

7. Manually change devices' names in topology
8. Config `Router02` >  CLI

```bash
# Enter initial config dialog?
NO

# Config
enable
    # show ip int brief
configure terminal

host?
hostname R2

interface ?
int g0/0/0  # short for interface gigabitEthernet0/0/0

no shut
ip address 10.1.1.2 255.255.255.0

# Finish, save and exit
end
wr
```

9. Ping `R2` from `R1` // **test topology is up!**

```bash
# R1 > CLI
ping 10.1.1.2

# R2 > CLI
ping 10.1.1.1

    # GREAT SUCCESS!
```

</details>

### 47. Quiz #4

| Q                                | A   |
| ---                              | --- |
| Router Prompt in **User Mode**?  | `Router>`
| In **privilege mode**?           | `Router#`
| Global configuration prompt?     | `Router(config)#`
| Command to save config to NVRAM? | `copy running-config startup-config`


## 9. IP Subnetting

> [Subnetting (9.-13.)](/ASIR%2B/CCNA-Bombal/9-13-Subnetting/readme.md)

## 10. Subnetting Packet Tracer Lab 1 
## 11. Subnetting Packet Tracer Lab 2 
## 12. IPv4 Subnetting Cheat Sheet
## 13. Subnetting VLOGs - do you know the answers?



## 14. Cabling and Packet Flows

> [Devices-Packets-Wireshark (14.-22.)](/ASIR%2B/CCNA-Bombal/14-22-Devices%2CPackets%2CWireshark/readme.md)

## 15. Physical Terminations Cheat Sheet
## 16. Life of a Packet: Packet Tracer Labs
## 17. Broadcast and collision domains
## 18. Duplex and Speed Mismatch Demo
## 19. What is a loopback?
## 20. TCP UDP
## 21. Wireshark Introduction
## 22. Wireshark Basics
