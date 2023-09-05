# ISO UD5: AdmonInformación — PRÁCTICAS

- [ISO UD5: AdmonInformación — PRÁCTICAS](#iso-ud5-admoninformación--prácticas)
  - [1. Linux: Archivos \& Permisos](#1-linux-archivos--permisos)
  - [2. Windows: Archivos \& Permisos](#2-windows-archivos--permisos)


## 1. Linux: Archivos & Permisos

> [ASIR: AdmonArchivosPermisosLinux](/ISO/UD5-AdmonInformacion/EXC-ud5-ejer-permisosLinux.pdf)


- documentation
  - @LinuxConfig: [Linux File Types (- d c b s p l)](https://linuxconfig.org/identifying-file-types-in-linux)
  - @AskUbuntu: [How can I share a directory with an another user?](https://askubuntu.com/questions/313089/how-can-i-share-a-directory-with-an-another-user)
  - @NERSC: [umask (Unix File Permissions)](https://docs.nersc.gov/filesystems/unix-file-permissions/)
  - groups and such ([src1](https://linuxize.com/post/how-to-list-groups-in-linux/), [src2](https://www.ibm.com/docs/en/ibm-mq/9.1?topic=windows-creating-managing-groups-linux))

<details>
<summary>ChatGPT on Linux File Types</summary>

```markdown
# ChatGPT on File Types in /dev...
When you run the `ls -l` command in a Linux system, the output displays file or directory permissions in the first character of each line. The first character represents the file type, and it can be one of the following:

- `-`: The first character will be a hyphen (`-`) for regular files. Regular files contain data such as text, images, or program code. They can be executed, read, or written to, depending on the permissions granted to the user.
- `d`: The first character will be a `d` for directories. Directories are files that contain lists of other files and directories. They are used to organize files into a hierarchical structure.
- `c`: The first character will be a `c` for character devices. Character devices provide access to devices that work with streams of characters, such as keyboards and mice.
- `b`: The first character will be a `b` for block devices. Block devices provide access to devices that work with fixed-size blocks of data, such as hard drives.
- `l`: The first character will be an `l` for symbolic links. Symbolic links are files that act as pointers to other files or directories. They are often used to create shortcuts or aliases.
```

</details>

<br>

| `chmod`   | r   | w   | x   |
| :-:       | :-: | :-: | :-: |
| _Octal_   | 4   | 2   | 1   |



```bash
# 1 - 9
cd /dev
sudo fdisk -l

cd ~/Desktop
touch prueba
ls -l prueba
file prueba                     # -P (...)
    # man magic

echo 'hola mundo' > prueba
file prueba
stat prueba
# wc prueba

cd ~
ls -l Desktop
file Desktop
stat Desktop

find ~ -name prueba
sudo find / -name prueba

cd /dev
ls -l | less


# 10 - 20
mkdir ~/ASIR-ISO/ud5-archivosPermisos && cd $_
echo supdawg > mensaje
echo f1 > f1
echo f2 > f2
echo f3 > f3
ls -l

chmod o-rwx f1 f2 f3
chmod 000 f1

cat f1
sudo cat f1
sudo vim f1                 # OJO — SUDO HAS DIFF .VIMRC
    # read-only!

chmod u+r f1
vim f1                      # override read-only permission with ':w!'

chmod ug+rx-w f1 f2
chmod 550 mensaje
chmod 000 mensaje
    ./mensaje
    sudo ./mensaje

chmod 743 mensaje
chmod 676 mensaje


# 21 - 26
mkdir dir1 dir2 dir3
echo fich11 > dir1/fich11
echo fich22 > dir2/fich22
echo fich33 > dir3/fich33

cp mensaje dir3/
tree || ls -lR

chmod a-r -R dir1
chmod a-w -R dir2
chmod a-x -R dir3

ls -lR
ls dir1
    # permission denied

cd dir2
cat fich22
vim fich22              # :w! to override read-only permissions
vim fich99              # can't write nor override permissions!
rm fich22
    no  # warning prompt!

cd ..
cd dir3
    # can't
sudo cd dir3
    # CAN'T EASILY!! // Interesting prompt


# 27 - n
sudo addgroup groupUD5 --force-badname

sudo adduser ud5gang --ingroup groupUD5     # NO SELF GROUP!
sudo usermod -aG groupUD5 pblqvdpcn
getent group groupUD5 || cat /etc/group | grep groupUD5
    # REBOOT (?!) & login as main user
    # Open two terminal windows...

groups || id
su ud5gang
groups || id

sudo mkdir /home/Shared
sudo chown :groupUD5 /home/Shared
ls -l /home
sudo chmod 3775 /home/Shared
ls -l /home && file /home/Shared
    # 3775... (https://askubuntu.com/questions/313089/how-can-i-share-a-directory-with-an-another-user)

cd /home/Shared

    # now each groupUD5 user creates a dir in /home/Shared
    # then each user creates files in all such directories
    # verify permissions and so on

# TO-DO 28 - n ...
```

## 2. Windows: Archivos & Permisos

```powershell

```