# Subredes

Para la dirección de red 192.168.100.0 queremos obtener 4 subredes. Indica la dirección de red, dirección del primer host, dirección del último host y dirección del broadcast de cada una de las subredes.

## Fórmulas

```yaml
X Subnets:
    - 2^n >= x
    - /mask + n
X Hosts:
    - 2^n-2 >= x
    - /32 - n
```


## Resolución

```yaml
# 192.168.100.-0: 4 subredes
2^n >= 4:
    2² >= 4:
        /24 + 2 = /26:
            192.168.100.-00-00000      # 1: 192.168.100.0
            192.168.100.-01-00000      # 2: 192.168.100.64
            192.168.100.-10-00000      # 3: 192.168.100.128
            192.168.100.-11-00000      # 4: 192.168.100.192
```

```yaml
# 1
Direccion red:  192.168.100.0/26
Primer host:    192.168.100.1
Ultimo host:    192.168.100.62
Broadcast:      192.168.100.63

# 2
Direccion red:  192.168.100.64/26
Primer host:    192.168.100.65
Ultimo host:    192.168.100.126
Broadcast:      192.168.100.127

# 3
Direccion red:  192.168.100.128/26
Primer host:    192.168.100.129
Ultimo host:    192.168.100.190
Broadcast:      192.168.100.191

# 4
Direccion red:  192.168.100.192/26
Primer host:    192.168.100.193
Ultimo host:    192.168.100.254
Broadcast:      192.168.100.255
```
