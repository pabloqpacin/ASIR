# Redes UD1 - EJERCICIOS

## 1. Conversión Numérica

### BIN to DEC

| BIN       | DEC |
| ---       | --- |
| 10000     | 16
| 110011    | 51
| 100010    | 34
| 1100 0000 | 192
| 1010 1000 | 168
| 0000 1010 | 10
| 1111 1111 | 255

### DEC to BIN and OCT

| DEC | BIN         | OCT |
| --- | ---         | --- |
| 1   | 1           | 1
| 8   | 1000        | 10
| 10  | 1010        | 12
| 100 | 0110 0100   | 144
| 256 | 1 0000 0000 | 400
| 127 | 0111 1111   | 177
| 198 | 1100 0110   | 306
| 225 | 1110 0001   | 341

> NOTE (BIN to OCT): 11000110=11|000|110=306

## 2. Direccionamiento IP

> Ojo [ipcalc](https://github.com/kjokjo/ipcalc) + `sudo apt install ipcalc`

### (2.1)

- Dadas las máscaras de subred siguientes completar la tabla indicando el formato estándar y
el formato CDIR.

| Formato Estándar | Formato CDIR |
| ---              | ---          |
| 255.0.0.0        | /8
| 255.192.0.0      | /10
| 255.255.192.0    | /18
| 255.255.224.0    | /23
| 255.255.255.224  | /27
| 255.255.255.240  | /28
| 255.252.0.0      | /14
| 255.255.255.252  | /30
| 255.128.0.0      | /9

### (2.2)

- Dadas las direcciones IP siguientes indicar: su clase, su máscara de red en los dos formatos y si son privadas, públicas o reservadas.

> [Redes privadas (RFC 1918)](https://www.rfc-editor.org/rfc/rfc1918)

<!-- (Classful Ranges)

| Class | First Octet Address
| ---   | ---                
| A     | 001 - 126          
| B     | 128 - 191          
| C     | 192 - 223          
| D     | 224 - 239          
| E     | 240 - 255          
-->


| Dirección IP   | Clase | Tipo     | Mask (std)    | Mask (CIDR) |
| ---            | ---   | ---      | ---           | ---         |
| 194.192.215.84 | C     | Pública  | 255.255.255.0 | /24
| 215.74.159.48  | C     | Pública  | 255.255.255.0 | /24
| 19.154.78.221  | A     | Pública  | 255.0.0.0     | /8
| 168.75.59.201  | B     | Pública  | 255.255.0.0   | /16
| 17.45.75.195   | A     | Pública  | 255.0.0.0     | /8
| 192.168.12.152 | C     | RFC 1918 | 255.255.255.0 | /24
| 172.31.15.159  | B     | RFC 1918 | 255.255.0.0   | /16
| 191.15.95.45   | B     | Pública  | 255.255.0.0   | /16
| 10.15.158.48   | A     | RFC 1918 | 255.0.0.0     | /8

<!-- - [ ] ¿¿DE VERDAD SON ESTAS LAS MÁSCARAS DE RED?? ¿¿NO HAY SUBREDES NI NADA RARO?? -->

```markdown
**ASKING ChatGPT "Hi, if I give you the IP address '194.192.215.84', could tell me what Class of IP it is and what is its Subnet Mask?"**
- The IP address '194.192.215.84' belongs to Class C of IP addresses because the first octet (194) falls within the range of 192 to 223.
- The default subnet mask for Class C IP addresses is 255.255.255.0, which means that the network portion of the IP address is the first three octets (194.192.215) and the host portion is the last octet (84).
- If the network has been subnetted, the subnet mask will be different from the default mask. However, without additional information, I can't determine the subnet mask for this IP address.

**"I feel like its subnet mask is not the default, is there any way to know the actual mask assuming it's been subnetted?"**
- Yes, it is possible to determine the subnet mask for the given IP address if it has been subnetted, but I would need additional information about the network configuration to do so.
- If you have access to the network configuration, you can look for the subnet mask setting in the router or other network devices. Alternatively, you can use a network scanning tool such as nmap or Advanced IP Scanner to scan the network and detect the subnet mask.
- If you don't have access to the network configuration, you can try using the IP address to ping the network and analyze the results. If the ping is successful, you can analyze the responses to see if any of them are from a different subnet. This can give you an idea of the subnet mask in use. However, this method is not foolproof and may not provide an accurate result.
- In general, determining the subnet mask for a network requires additional information about the network configuration, such as the number of subnets and the number of hosts per subnet. Without this information, it is difficult to determine the subnet mask with certainty.
```

### (2.3)

- Dadas las siguientes direcciones IP, calcular su dirección de red y su dirección de host. Para
ello, realizar los correspondientes cálculos.

| Dirección IP       | Dirección Red       | Dirección Host |
| ---                | ---                 | ---            |
| 172.45.75.142/26   | 172.45.75.10xxxxxx  | xx001110
| 192.168.12.185/27  | 192.168.12.101xxxxx | xxx11001
| 84.23.175.47/19    | 84.23.101xxxxx.X    | xxx01111.47
| 10.45.127.89/12    | 10.0010xxxx.X.X     | xxxx1101.89
| 192.168.159.208/19 | 192.168.100xxxx.X   | xxx11111.208


<!-- CALCULATION
172.45.75.142/26 >> 172.45.75.10 > 172.45.75.128

ASK ChatGPT "Hi, if I give you the IP address '172.45.75.142/26', could you tell me the Network and the Host portions?" > DEC results
-->

### (2.4)

- Dadas las siguientes direcciones IP, a partir de su dirección de red calcular la dirección de
broadcast, el primer host y el último host de la red.

| Dirección IP       | Dirección Red  | Primer Host | Último Host   | Broadcast
| ---                | ---            | ---         | ---           | ---
| 172.45.75.142/26   | 172.45.75.128  | n.n.n.129   | n.n.n.190     | n.n.n.191
| 192.168.12.185/27  | 192.168.12.160 | n.n.n.161   | n.n.n.190     | n.n.n.191
| 84.23.175.47/19    | 84.23.160.0    | n.n.160.1   | n.n.191.254   | n.n.191.255
| 10.45.127.89/12    | 10.32.0.0      | 10.32.0.1   | 10.47.255.254 | 10.47.255.255
| 192.168.159.208/19 | 192.168.128.0  | n.n.128.1   | n.n.159.254   | n.n.159.255