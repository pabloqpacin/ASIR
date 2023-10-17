# SUBNETTING

<details>
<summary>Table of Contents</summary>

- [SUBNETTING](#subnetting)
  - [9. IP Subnetting](#9-ip-subnetting)
    - [47. IP Subnetting Part 1](#47-ip-subnetting-part-1)
      - [Intro](#intro)
      - [Typical Example 01](#typical-example-01)
        - [Q](#q)
        - [A1-BinaryMethod](#a1-binarymethod)
      - [**Typical Example 02**](#typical-example-02)
    - [48. IP Subnetting Part 2](#48-ip-subnetting-part-2)
      - [Example 03](#example-03)
      - [**QUICK METHOD**](#quick-method)
    - [49. IP Subnetting Part 3](#49-ip-subnetting-part-3)
    - [50. IP Subnetting Part 4](#50-ip-subnetting-part-4)
      - [Example 01](#example-01)
    - [51. IP Subnetting Part 5](#51-ip-subnetting-part-5)
      - [Example 02](#example-02)
    - [Quiz #5](#quiz-5)
  - [10. Subnetting Packet Tracer Lab 1](#10-subnetting-packet-tracer-lab-1)
    - [52. Can you complete the lab?](#52-can-you-complete-the-lab)
    - [53. Answers - Part 1 \[Subnetting\]](#53-answers---part-1-subnetting)
    - [54. Answers - Part 2 \[Subnet01: R1 \> GigabitEthernet0/0/0\]](#54-answers---part-2-subnet01-r1--gigabitethernet000)
    - [55. Answers - Part 3 \[Subnet02: R1 \> Serial0/1/0\]](#55-answers---part-3-subnet02-r1--serial010)
    - [56. Answers - Part 4 \[S2 + R2 (ALT)\]](#56-answers---part-4-s2--r2-alt)
  - [11. Subnetting Packet Tracer Lab 2](#11-subnetting-packet-tracer-lab-2)
    - [57. Can you complete the lab?](#57-can-you-complete-the-lab)
    - [58. Answers Part 1](#58-answers-part-1)
    - [59. Answers Part 2](#59-answers-part-2)
  - [12. IPv4 Subnetting Cheat Sheet](#12-ipv4-subnetting-cheat-sheet)
  - [13. ~~Subnetting VLOGs - do you know the answers?~~](#13-subnetting-vlogs---do-you-know-the-answers)

</details>

## 9. IP Subnetting

### 47. IP Subnetting Part 1

#### Intro
- Part 1
  - Two Methods [2]
    - Method 1 == **Binary Method**
    - Method 2 == **Quick Method**
  - What subnet is this host on?
  - What is a last host?
- Part 2
  - Multiple Subnets
  - 'Subnet this network into at least 10 subnets'
  - 'Subnet this network into subnets each having 10 hosts'
- Part 1 Overview
  - Given IP Address (determine)
    - Subnet Address
    - 1st Host Address
    - Last Host Address
    - Broadcast Address
  - Two Methods
    - Binary Method
    - Quick Method

#### Typical Example 01

##### Q
- Given `PC1==192.168.1.18/24`j ~- `R1`
  - What IP Address would `R1` be configured with (if it is to use the *first* IP Address in the same subnet as `PC1`)? --> `192.168.1.1/24` <!--1st host aye-->
  - What Broadcast Address is used by `PC1`?
  - What IP Address would `R1` be configured with (if it is to use the *last* IP Address in the same Subnet as `PC1`)?
  - What Subnet is `PC1` part of?


##### A1-BinaryMethod

> Binary Rules

| Do                     | How |
| ---                    | --- |
| Network/Subnet Address | Fill host portion with binary 0s
| Broadcast Address      | Fill host portion with binary 1s
| First Host             | Fill host portion with binary 0s except last bit=1
| Last Host              | Fill host portion with binary 1s execpt last bit=0

- Therefore IP `192.168.1.18/24` (192.168.1.18 255.255.255.0) where `18==HOST`

| Do        | a                  | b   |
| ---       | ---                | --- |
| Subnet    | 192.168.1.00000000 | 192.168.1.0
| 1st Host  | 192.168.1.00000001 | 192.168.1.1
| Last Host | 192.168.1.11111110 | 192.168.1.254
| Broadcast | 192.168.1.11111111 | 192.168.1.255


#### **Typical Example 02**

- IP == `172.16.35.123/20` (172.16.35.123 255.255.240.0)
  - therefore 172.16.0010*0010.01111011* <!--because the split network/host is somewhere in the 3rd option-->


| Do        | a                        | b   |
| ---       | ---                      | --- |
| Subnet    | 172.16.00100000.00000000 | 172.16.32.0
| 1st Host  | 172.16.00100000.00000001 | 172.16.32.1
| Last Host | 172.16.00101111.11111110 | 172.16.47.254
| Broadcast | 172.16.00101111.11111111 | 172.16.47.255


### 48. IP Subnetting Part 2

#### Example 03

- IP == `172.16.129.1/17` (255.255.128.0)
  - therefore 172.16.1*0000001.00000001*

| Do        | a                        | b   |
| ---       | ---                      | --- |
| Subnet    | 172.16.10000000.00000000 | 172.16.128.0
| 1st Host  | 172.16.10000000.00000001 | 172.16.128.1
| Last Host | 172.16.11111111.11111110 | 172.16.255.254
| Broadcast | 172.16.11111111.11111111 | 172.16.255.255


#### **QUICK METHOD**

> Shortcut Table

| DEC value in octet | 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
| ---                | --- | --- | --- | --- | --- | --- | --- | --- |
| 256 - above        | 128 | 192 | 224 | 240 | 248 | 252 | 254 | 255 |

- So if `172.16.35.123/20` (255.255.240.0)
  - **{256 - 240 == 16}**
  - <!--meaning Networks increment in values of 16 (0, 16,32, 48...)-->
  - "network in multiples of 16 --> 0 - 16 - 32 - 48 - ..."
    - 35 is between 32 and 48
    - therefore `172.16.32.0`


### 49. IP Subnetting Part 3

> IP == `172.16.35.123/20` (255.255.240.0)

- Is in subnet `172.16.32.0`
- Next network == `172.16.48.0`

| Do        | a                        | b   |
| ---       | ---                      | --- |
| Subnet    | {256-240=16} 0,16,32,48; | 172.16.32.0
| 1st Host  | Subnet + 1               | 172.16.32.1
| Broadcast | Next Network - 1         | 172.16.47.255
| Last Host | Broadcast - 1            | 172.16.47.254


### 50. IP Subnetting Part 4

- How to subdivide a network/subnet when given
  - a) Specific number of host required
  - b) Specific number of subnets

> MIND: MAX 254 Hosts per Network/Subnet

```markdown
**SUBNETTING** == ...
1. "Stealing" or "taking away" bits from the host portion of an address
2. Allocating the "stolen" bits to the network portion of a new address
```

- Two Subnetting rules [2]
  -  `Hosts = 2^n - 2` [n == nº of host bits R to L]
  -  `Networks = 2^n` [network bits L to R]

<!--REMEMBER POWERZ-->

| Power | Power |
| ---   | ---   |
| 2^1   | 2
| 2^2   | 4
| 2^3   | 8
| 2^4   | 16
| 2^5   | 32
| 2^6   | 64
| 2^7   | 128
| 2^8   | 256
| 2^9   | 512
| 2^10  | 1024


#### Example 01

- ABC Ltd has been allocated Subnet `10.1.1.0/24` for a small office in London. Split it into smaller subnets, supporting 14 machines each.
  - Decide formula --> `Hosts = 2^n - 2` need to account for 14... so **2^4-2==14** thus OK!!
  - Convert host portion of original network into BIN (0 = 00000000)
  - 'Host portion is 8-bits, **only 4-bits required to support 14 hosts**'
    - 10.1.1.0000*0000*
  - New Subnet Mask ==> Bits in network-subnet (*10.1.1.0000*0000) == ***28***

> New subnets...

| Network               | **Subnet** | Host | COMPLETE |
| ---                   | ---        | ---  | ---      |
| 1st network = 10.1.1  | 0000       | 0000 | 10.1.1.0/28 (255.255.255.240)
| 2nd network = 10.1.1  | 0001       | 0000 | 10.1.1.16/28 (255.255.255.240)
| 3rd network = 10.1.1  | 0010       | 0000 | 10.1.1.32/28 (255.255.255.240)
| 4th network = 10.1.1  | 0011       | 0000 | 10.1.1.48/28 (255.255.255.240)
| ...                   
| Last network = 10.1.1 | 1111       | 0000 | 10.1.1.240/28 (255.255.255.240)


> How many subnets??? `Subnets==2^n` thus **2^4=16**

| Summary            |
| ---                |
| Subnets: 2^4 = 16  |
| Hosts: 2^4 -2 = 14 |

### 51. IP Subnetting Part 5

#### Example 02

- "ABC Ltd have been allocated the subnet `10.128.192.0/18`. To-do: 30 Subnets with as many hosts as possible".
  - Formula ==> `Networks=2^n` // **2^5=32** (OK for 30) {Nº Bits required}
  - "Reallocate **5 bits** from Host portion into Network portion"
  - Convert host to BIN
    - 10.128.192.0/18 (255.255.192.0)
    - 10.128.11*000000.00000000*
    - Now 5-bits from Host to Network ==> 10.128.11**00000**0.00000000
    - THEREFORE: bits Network==23 Host==9
    - NEW SUBNETS:

| Network                  | Subnet | Host       | Complete |
| ---                      | ---    | ---        | ---      | 
| 1st Network = 10.128.11  | 00000  | 0.00000000 | 10.128.192.0/23 (255.255.254.0)
| 2nd Network = 10.128.11  | 00001  | 0.00000000 | 10.128.194.0/23 (255.255.254.0)
| 3rd Network = 10.128.11  | 00010  | 0.00000000 | 10.128.196.0/23 (255.255.254.0)
| 4th Network = 10.128.11  | 00011  | 0.00000000 | 10.128.198.0/23 (255.255.254.0)
| ...
| Last Network = 10.218.11 | 11111  | 0.00000000 | 10.128.254.0/23 (255.255.254.0)


### Quiz #5

1. What is the network address for host `172.16.1.1` (255.255.192.0)?
  - 172.16.00*00000001.1*
  - Subnet -> all Host are 0s -> **172.16.0.0/18**
2. What is the broadcast address for host `172.16.1.1` (255.255.192.0)?
  - Broadcast -> Fill Host with 1s -> 172.16.00111111.255 = **172.16.63.255**
  -  

---


## 10. Subnetting Packet Tracer Lab 1

```markdown
Configure the network as follows:
1. You have been allocated subnet 192.168.1.0/24. Subnet this into four subnets as follows 
2. Subnet 1 for site 1 <!--Switch1~R1-->
3. Subnet 2 for the link between R1 and the Internet Router
4. Subnet 3 for site 2
5. Subnet 4 for the link between R2 and the Internet Router
6. Configure the routers per the instructions in the diagram.
7. {Configure the switches with the second last IP address in the subnet}
8. {Configure the DHCP servers with teh third last IP address in the subnet. Configure the DHCP server to allocate IP addresses to the clients.}
9. Verify that PCs can access cisco.com and facebook.com using their browsers
```

### 52. Can you complete the lab?

- subnets=2^n; need 4 subnets so 2^**2**=n
- `192.168.1.0/24` (255.255.255.**00***000000*) // need 2 bits from Host to Network
  - now Network=26 Host=6

| Network            | Subnet | Host   | Complete |
| ---                | ---    | ---    | ---      |
| 1st == 192.168.1.  | 00     | 000000 | 192.168.1.0/26 (255.255.255.192)
| 2nd == 192.168.1.  | 01     | 000000 | 192.168.1.64/26 (255.255.255.192)
| 3rd == 192.168.1.  | 10     | 000000 | 192.168.1.128/26 (255.255.255.192)
| 4th == 192.168.1.  | 11     | 000000 | 192.168.1.192/26 (255.255.255.192)

### 53. Answers - Part 1 [Subnetting]

| Subnet           | Location in Topology |
| ---              | --- |
| 192.168.1.0/26   | Switch1 -- x -- R1
| 192.168.1.64/26  | R1 -- x -- IntRouter
| 192.168.1.128/26 | Switch2 -- x -- R2
| 192.168.1.192/26 | R2 -- x -- IntRouter

### 54. Answers - Part 2 [Subnet01: R1 > GigabitEthernet0/0/0]

| Do            | a                    | b   |
| ---           | ---                  | --- |
| Subnet        | 192.168.1.00*000000* | 192.168.1.0
| 1st Host      | 192.168.1.00*000001* | 192.168.1.1
| **2nd Last**  | .                    | 192.168.1.61
| **Last Host** | 192.168.1.00*111110* | 192.168.1.62
| Broadcast     | 192.168.1.00*111111* | 192.168.1.63

```bash
# R1 > CLI
en
sh ip int brief
conf t

int g0/0/0
no shut

ip address 192.168.1.62 255.255.255.192
end

sh ip int brief
ping 192.168.1.62
exit
```

> Following configs, already done in `.pkt` file =D

```bash
# S1 > CLI
en
sh ip int brief
    # Vlan1 = 192.168.1.61 ALREADY!!
```

```bash
# Server1 > Config > FastEthernet0 (Static)
    # IPv4 Address == 192.168.1.60 
    # Subnet Mask == 255.255.255.192

# Server1 > Config > Settings
    # Default Gateway == 192.168.1.62
    # DNS Server == 8.8.8.8

ping <else>

# Server > Services > DHCP
<tal>

# PCs > CMD
ipconfig
    # Private IPs allocated yay!
```

### 55. Answers - Part 3 [Subnet02: R1 > Serial0/1/0]

| Do            | a                    | b   |
| ---           | ---                  | --- |
| Subnet        | 192.168.1.01*000000* | 192.168.1.64/26
| 1st Host      | 192.168.1.01*000001* | 192.168.1.65/26
| **2nd Last**  | .                    | 192.168.1.125/26
| **Last Host** | 192.168.1.01*111110* | 192.168.1.126/26
| Broadcast     | 192.168.1.01*111111* | 192.168.1.127/26

```bash
# R1 > CLI
en
sh ip int brief
conf t

int Serial0/1/0
no shut

ip add dress 192.168.1.65 255.255.255.192
end

sh ip int brief

wr
exit
```

```bash
# IntRouter > CLI
en
sh ip int brief

conf t
int s0/1/0
no shut

ip address 192.168.1.126 255.255.255.192    # last subnet address (broadcast -1)
end

ping 192.168.1.65
wr
```

```bash
# R1
ping 8.8.8.8    # DNS server

# PC0 || PC1 || PC2
ping 8.8.8.8
tracert 8.8.8.8
# web browser > cisco.com || facebook.com

# IntRouter
sh ip nat translations
```

<!--OJO 'tracert' command-->



### 56. Answers - Part 4 [S2 + R2 (ALT)]

```bash
# R2 > CLI
en
conf t
int g0/0/0
no shut
ip address 192.168.1.128 255.255.255.192    # last ip
wr

# Switch2 & Server done by DavidBombal (vlan1, etc etc.)
```

```bash
# R2
conf t
int s0/1/0
no shut
ip address 192.168.1.193 255.255.255.192    # first ip (in Last Subnet!!)
end
```

```bash
# IntRouter
en
sh ip int brief
conf t
int s0/1/1
no shut
ip add 192.168.1.254 255.255.255.192
end
ping 8.8.8.8
```

> - [ ] SIMULATION MODE BELOW!

```bash
# PCs
ping cisco.com
ping <other-PCs>
tracert cisco.com
tracert <other-PCs>

```

## 11. Subnetting Packet Tracer Lab 2

```markdown
In a previous lab, 192.168.1.0/24 was broken up to support the subnets in this lab.
Now you need to subnet the network to extend and conserve IP addresses:

1. Break up 192.168.1.64/26 to support as many subnets as possible with 8 hosts per subnet. 
2. Allocate the first new subnet to site 3. 
3. Manually configure all devices in the subnet.
- Router with last IP address in subnet
{- Switch with the 2nd last IP address}
- Hosts from first IP address
4. Subnet the last new subnet you got from 192.168.1.64/26 with /30 masks 
and then allocate the subnets to the serial links. Configure the routers appropriately.
5. Verify that PCs can access cisco.com and facebook.com using their browsers

{NOTE: Switch3 has already been preconfigured. You can omit that step from the video}
```

### 57. Can you complete the lab?

> NOTE: `site 3' == LAN between Switch3 and R4

- formula{Hosts}: `2^n-2` // `2^4-2=14` so 8==OK!
- `192.168.1.64/26` (255.255.255.192) == 192.168.1.00**00***0000* <!--HOSTS::R to L!!!!!-->
  - network=28 host=4

| Network              | Subnet | Host | Complete |
| ---                  | ---    | ---  | ---      |
| 1st == 192.168.1.01  | 00     | 0000 | 192.168.1.64/28 (255.255.255.240)
| 2nd == 192.168.1.01  | 01     | 0000 | 192.168.1.80/28 (255.255.255.240)
| 3rd == 192.168.1.01  | 10     | 0000 | 192.168.1.96/28 (255.255.255.240)
| 4th == 192.168.1.01  | 11     | 0000 | 192.168.1.112/28 (255.255.255.240)

- `192.168.1.112/28` into `/30`

| Network               | Subnet | Host | Complete |
| ---                   | ---    | ---  | ---      |
| 1st == 192.168.1.0111 | 00     | 00   | 192.168.1.112/30 (255.255.255.252)
| 2nd == 192.168.1.0111 | 01     | 00   | 192.168.1.116/30 (255.255.255.252)
| 3rd == 192.168.1.0111 | 10     | 00   | 192.168.1.120/30 (255.255.255.252)
| 4th == 192.168.1.0111 | 11     | 00   | 192.168.1.124/30 (255.255.255.252)


### 58. Answers Part 1

```bash
# R1 --x-- IntRouter > RENAME 192.168.1.112/30 (~1.64/26)

# R1 > CLI
en
sh run
conf t
int s0/1/0
ip add 192.168.1.113 255.255.255.252

# IntRouter
<...>
ip add 192.168.1.114 255.255.255.252
ping 192.168.1.113
ping cisco.com
```


### 59. Answers Part 2

> - [ ] UNDONE

```bash
R4# sh cdp neighbors
```



## 12. [IPv4 Subnetting Cheat Sheet](/ASIR+/CCNA-Bombal/IPv4_Subnetting.pdf)
## 13. ~~Subnetting VLOGs - do you know the answers?~~

