# Redes UD2 - Subnetting 01

## 1. Crea 8 subredes a partir de la dirección de red 192.168.0.0/24

- 8 subredes = 2^n // n=3 ... 2^3=8
  - 24 + 3 = `/27`
  - 192.168.0.**000**00000 (mask==`/27`) // **increasing by 32**

| Index | Subnetting             | IPs
|---    | ---                    | ---
| 1     | 192.168.0.**000**00000 | 192.168.0.0
| 2     | 192.168.0.**001**00000 | 192.168.0.32
| 3     | 192.168.0.**010**00000 | 192.168.0.64
| 4     | 192.168.0.**011**00000 | 192.168.0.96
| 5     | 192.168.0.**100**00000 | 192.168.0.128
| 6     | 192.168.0.**101**00000 | 192.168.0.160
| 7     | 192.168.0.**110**00000 | 192.168.0.192
| 8     | 192.168.0.**111**00000 | 192.168.0.224

```bash
# Verify via linux terminal
ipcalc 192.168.0.0/24 /27
    # https://www.howtogeek.com/823503/find-subnet-masks-on-linux-ipcalc/
```


## 2. Dada la IP de red base 170.85.56.0 /23, ¿Seríais capaces de deducir las IPs de subred en subneting FLSM con máscara adaptada 255.255.255.128 Y **4 subredes**? 

- [FLSM vs VLSM](https://www.techtarget.com/searchnetworking/definition/variable-length-subnet-mask) <!--FLSM creates subnets of the same size and an equal number of host identifiers, while VLSM creates subnets with varying sizes with a variable number of hosts; FLSM is a better choice for private IP addresses, while VLSM is more suitable for public IP addresses.-->
- 255.255.255.128 == **/25**
- 2^**2**=4 // 170.85.0011100**0.0**0000000

| index | subnetting                   | IPs
| ---   | ---                          | ---
| 1     | 170.85.0011100**0.0**0000000 | 170.85.56.0
| 2     | 170.85.0011100**0.1**0000000 | 170.85.56.128
| 3     | 170.85.0011100**1.0**0000000 | 170.85.57.0
| 4     | 170.85.0011100**1.1**0000000 | 170.85.57.128


## 3. Crea 3 subredes para la red 192.168.11.0/24 con estas características (Subnet01==30hosts) (Subnet02==10hosts) (Subnet03==5hosts)

- `2^n=subnets` & `2^n-2=hosts`

<!--
```markdown
# WRONG APPROACH
- 2^*2*=4 OK (mask==26)

| index | subnetting              | IPs
| ---   | ---                     | ---
| 1     | 192.168.11.**00**000000 | 192.168.11.0
| 2     | 192.168.11.**01**000000 | 192.168.11.64
| 3     | 192.168.11.**10**000000 | 192.168.11.128
| ~~4~~ | 192.168.11.**11**000000 | 192.168.11.192
```
-->

- 2^*5*-2=30 OK (/27)
- 2^*4*-2=14 OK (/28)
- 2^*3*-2=6 OK (/29)

| index | subnetting              | IPs
| ---   | ---                     | ---
| 1     | 192.168.11.000**00000** | 192.168.11.0/27 - 192.168.11.31/27
| 2     | 192.168.11.0010**0000** | 192.168.11.32/28 - 192.168.11.47/28
| 3     | 192.168.11.00110**000** | 192.168.11.48/29 - 192.168.11.55/29

<details>
<summary>ipcalc</summary>

WATCH OUT `ipcalc` throws error as 2nd subnet should be `/28`!!
![ipcalc-ejer3](/Redes/UD2-Redes101/ipcalc-ejer3.png)

</details>