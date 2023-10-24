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
2^n >= 8:
    2³ >= 8:
        /24 + 3 = /27:
            192.168.100.-000-00000      # 1: 192.168.100.0
            192.168.100.-001-00000      # 2: 192.168.100.32
            192.168.100.-010-00000      # 3: 192.168.100.64
            192.168.100.-011-00000      # 4: 192.168.100.96
```

```yaml
# 1
Direccion red:  192.168.100.0/27
Primer host:    192.168.100.1
Ultimo host:    192.168.100.30
Broadcast:      192.168.100.31

# 2
Direccion red:  192.168.100.32/27
Primer host:    192.168.100.33
Ultimo host:    192.168.100.62
Broadcast:      192.168.100.63

# 3
Direccion red:  192.168.100.64/27
Primer host:    192.168.100.65
Ultimo host:    192.168.100.94
Broadcast:      192.168.100.95

# 4
Direccion red:  192.168.100.96/27
Primer host:    192.168.100.97
Ultimo host:    192.168.100.126
Broadcast:      192.168.100.127
```