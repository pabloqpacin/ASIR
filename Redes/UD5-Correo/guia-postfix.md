# guía

## DNS

- DOMINIO==`mercurio.test`
  - entrada `MX`
  - instalación MTA (**Postfix**)
  - correos con cliente en terminal
- 3 aplicaciones MTA con 97% de instalaciones:
  - Exim4 (60%)
  - Postfix (34%)
  - Sendmail (3%)

---

```bash
sudo vim /etc/bind/db.universidad.com
# @       IN      MX 10     correo.universidad.com.
    # Este es el registro que indica que el correo dirigido a @universidad.com debe entregarse al servidor correo.universidad.com.
```



```bash
sudo netstat -lnp | grep named

resolvectl status
host correo.universidad.com
host 192.168.100.33
```

## MTA: Postfix


```bash
sudo apt-get install postfix

# 1. Please select the mail server configuration type:
    # Internet site

# 2. System mail name:
    # universidad.com

# # Volver a invocar el asistente
# dpkg-reconfigure postfix
```
<!-- ```log
Adding group `postfix' (GID 123) ...
Adding new user `postfix' (UID 117) with group `postfix' ...
Not creating home directory `/var/spool/postfix'.
Creating /etc/postfix/dynamicmaps.cf
Adding group `postdrop' (GID 124) ...

setting myhostname: ubuntu-server
setting alias maps
setting alias database
changing /etc/mailname to universidad.com
setting myorigin
setting destinations: $myhostname, universidad.com, ubuntu-server, localhost.localdomain, localhost
setting relayhost:
setting mynetworks: 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
setting mailbox_size_limit: 0
setting recipient_delimiter: +
setting inet_interfaces: all
setting inet_protocols: all
/etc/aliases does not exist, creating it.
WARNING: /etc/aliases exists, but does not have a root alias.

Postfix (main.cf) is now set up with a default configuration.  If you need to make changes, edit /etc/postfix/main.cf (and others) as needed.  To view
Postfix configuration values, see postconf(1).

After modifying main.cf, be sure to run 'systemctl reload postfix'.
``` -->

```bash
grep -e 'mydestination' -e 'alias_maps' -e 'smtpd_relay_restrictions' /etc/postfix/main.cf

bat /etc/aliases
    # postmaster: root
```

- Escribir correo

```bash
sudo apt-get install mailutils

mail $USER
# Cc:
# Subject: prueba
# ¡hola!
# [CTRL + D]

# Login
# 'You have new mail'
bat /etc/mail/$USER

mail
```


```bash
apt install alpine
alpine
    # E
    # L > Enter (Inbox) 
    # M
    # S > C > UserDomain==universidad.com > E > Y
    # C > 
        # To: pabloqpacin@protonmail.com
        # Cc: pquevedo267@gmail.com
        # Attchmnt:
        # Subject: probando
        # Message Text: Hola desde Alpine.
        # > Ctrl+X > Y
    # I
```

---

# JAVIER


```bash
sudo apt install courier-imap courier-pop

# 1. Create directories for web-based administration?
    # No (use /etc/courier files instead)

# 2. SSL certificate required
```

```log
Generating a 3072 bit RSA private key...
Generating a self signed certificate...
X.509 Certificate Information:
        Version: 3
        Serial Number (hex): 01
        Validity:
                Not Before: Fri Mar 29 16:43:15 UTC 2024
                Not After: Sat Mar 29 16:43:15 UTC 2025
        Subject: CN=localhost,OU=Automatically-generated POP3 SSL key,O=Courier Mail Server,L=New York,ST=NY,C=US
        Subject Public Key Algorithm: RSA
        Algorithm Security Level: High (3072 bits)
                Modulus (bits 3072):
                        00:e1:28:09:f4:55:06:f5:30:b8:9c:06:a1:77:a4:5d
                        83:23:e9:b7:67:62:03:3e:99:c1:85:ca:23:04:0f:56
                        c2:3f:74:64:29:4f:f6:91:ba:8d:ec:a0:d6:2d:e1:5a
                        b9:6b:58:77:a0:40:e5:72:67:eb:88:f5:d0:79:c1:b7
                        01:07:a2:ca:c7:f0:c4:bb:7e:b5:f3:8a:80:6b:e0:96
                        b3:0c:a1:b7:cc:5c:f3:fe:cf:46:b5:c1:96:68:0c:2e
                        a3:2e:80:e7:1e:f6:f6:6e:32:74:b3:db:b6:f1:17:fd
                        73:30:a1:be:88:ff:b6:6b:d7:1e:ca:c5:19:ae:0a:80
                        a7:d4:e7:5d:40:5a:99:07:c1:0e:37:3e:f9:b1:7b:4d
                        58:9b:a0:98:8f:6a:f1:13:4d:92:1e:65:05:92:90:16
                        c4:d4:84:36:47:86:56:cf:29:b1:17:d3:80:11:bf:2f
                        bb:cc:b3:a4:dd:02:43:47:84:53:c4:f1:fe:ca:4e:17
                        43:4d:5e:77:dd:4b:25:ef:91:d9:b3:eb:e3:07:b0:0a
                        72:c3:c7:da:18:25:4c:91:f4:03:49:35:80:be:44:82
                        75:88:95:77:99:79:27:02:50:9f:ce:2d:07:7e:b7:59
                        3a:6d:47:db:b5:8a:5c:5c:bf:77:dc:67:60:ee:fd:e2
                        99:31:a5:e9:a9:f7:b1:7b:6b:c3:f2:b2:64:39:7f:d0
                        e0:bb:69:3a:44:7e:03:a3:83:d5:78:5c:af:a3:fa:ed
                        84:b1:15:fe:c5:86:8e:ff:5d:ed:af:e1:4b:e6:9b:ec
                        8b:c9:86:67:ed:41:e3:50:fa:f6:7f:3c:3a:f4:13:8c
                        16:ed:f0:72:2b:5d:e3:a6:70:f2:74:d0:66:e6:a9:f8
                        3e:88:46:93:a2:33:97:11:25:e0:c0:f4:b6:a0:44:e2
                        25:2b:e9:7a:d0:bb:92:11:81:f3:82:66:e1:87:b5:39
                        a1:67:fa:cb:ac:11:94:09:74:27:71:4f:4d:18:0f:29
                        2b
                Exponent (bits 24):
                        01:00:01
        Extensions:
                Basic Constraints (critical):
                        Certificate Authority (CA): FALSE
                Subject Alternative Name (not critical):
                        RFC822Name: postmaster@example.com
                Subject Key Identifier (not critical):
                        51b61dabe6d3ec00fe1d7a9c7b561b1df08deb06
Other Information:
        Public Key ID:
                sha1:51b61dabe6d3ec00fe1d7a9c7b561b1df08deb06
                sha256:baa98557d10ca555d665642ccdc2fafaf567b10907cc664879c3698a29e9d7f4
        Public Key PIN:
                pin-sha256:uqmFV9EMpVXWZWQszcL6+vVnsQkHzGZIecNpiinp1/Q=



Signing certificate...
Created symlink /etc/systemd/system/multi-user.target.wants/courier-pop.service → /lib/systemd/system/courier-pop.service.
Created symlink /etc/systemd/system/multi-user.target.wants/courier-pop-ssl.service → /lib/systemd/system/courier-pop-ssl.service.
Setting up courier-imap (5.0.13+1.0.16-3build3) ...
'/dev/null' -> '/etc/courier/imapd.cert'
Generating a 3072 bit RSA private key...
Generating a self signed certificate...
X.509 Certificate Information:
        Version: 3
        Serial Number (hex): 01
        Validity:
                Not Before: Fri Mar 29 16:43:18 UTC 2024
                Not After: Sat Mar 29 16:43:18 UTC 2025
        Subject: CN=localhost,OU=Automatically-generated IMAP SSL key,O=Courier Mail Server,L=New York,ST=NY,C=US
        Subject Public Key Algorithm: RSA
        Algorithm Security Level: High (3072 bits)
                Modulus (bits 3072):
                        00:cc:0c:63:f7:4f:96:6b:42:44:48:cc:45:3c:4e:23
                        94:0f:a5:49:79:ea:f9:8f:ee:c6:cf:e8:1d:fd:50:7b
                        2e:f5:ab:fc:1c:f0:b9:ec:57:21:77:8e:b8:33:03:17
                        cb:99:40:d9:7a:6d:fb:3d:31:82:8a:8c:b7:13:d1:95
                        e3:1c:a3:b4:b3:ab:65:f4:70:91:22:d4:c0:e4:f2:e9
                        76:4e:71:bb:bc:91:23:56:ff:a6:0e:d6:69:35:fa:8b
                        4b:f6:6b:db:c7:f7:13:86:75:b7:af:53:bc:5f:1f:4d
                        8a:02:3d:1c:4f:20:e2:47:2a:87:4c:dd:59:ec:e9:a8
                        c9:20:9c:af:51:e5:a7:8a:3d:48:3d:05:a9:cf:c8:fa
                        26:38:27:58:87:6d:fd:0e:fa:12:2b:34:79:3d:d3:b6
                        3f:31:32:a4:d1:a6:1c:17:5b:43:95:d0:f7:cc:7b:62
                        10:44:27:b0:6d:85:70:9c:27:8e:cf:81:57:97:01:8d
                        fd:5d:ea:59:e6:cf:93:dc:87:39:e2:8c:a4:f2:42:a7
                        e1:83:b2:5f:b6:9c:f9:12:8d:43:51:98:91:c7:75:f3
                        34:6c:ea:d3:35:4f:6e:b6:c5:5a:4e:89:37:57:76:c1
                        46:97:fe:79:62:cc:67:14:bc:3c:65:7a:14:a0:10:46
                        02:c5:9a:65:b4:3c:94:19:de:21:36:2e:ca:b7:15:08
                        2a:cf:37:1b:cc:5e:70:aa:53:72:26:74:8e:e3:66:49
                        42:7e:d7:06:0f:05:19:58:11:e1:43:53:41:f9:48:0d
                        b8:a1:b1:24:d6:d0:57:0d:5f:2d:2d:04:58:e9:ab:2d
                        2d:30:9a:c6:24:3e:d4:be:86:6d:ed:37:b4:73:1d:04
                        68:cc:2b:43:79:d0:02:d8:46:81:8e:21:5c:bd:d2:f3
                        99:b5:47:bc:f9:ab:89:2b:2a:61:a9:eb:d8:da:07:cb
                        6e:da:b7:33:9d:ea:45:55:74:33:53:1f:81:2b:08:49
                        71
                Exponent (bits 24):
                        01:00:01
        Extensions:
                Basic Constraints (critical):
                        Certificate Authority (CA): FALSE
                Subject Alternative Name (not critical):
                        RFC822Name: postmaster@example.com
                Subject Key Identifier (not critical):
                        609bf4e71c1368d2bec583af7af225082051b570
Other Information:
        Public Key ID:
                sha1:609bf4e71c1368d2bec583af7af225082051b570
                sha256:368c1bf5e63079866ec28d7ca1333923ec0f5f1dca2b35c254d64bf48cac705c
        Public Key PIN:
                pin-sha256:Nowb9eYweYZuwo18oTM5I+wPXx3KKzXCVNZL9IyscFw=



Signing certificate...
```

```bash
telnet correo.universidad.com 25
# MAIL FROM: pabloqpacin@universidad.com
# RCPT TO: pabloqpacin@universidad.com
# DATA <enter>
# Probando lo del profe
# .
# QUIT

# Login
# 'You have mail'
mail
```


