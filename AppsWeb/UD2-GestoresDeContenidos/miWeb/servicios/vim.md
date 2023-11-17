# vim

- [vim](#vim)
  - [1. instalación](#1-instalación)
  - [2. Primeros pasos](#2-primeros-pasos)


## 1. instalación

- Comprobar si existen vim o vi

```bash
which vim || which vi
vim --version || vi --version
```

- Instalar neovim y aplicar configuración
  - Usar mi script [DebUbu-base.sh](https://github.com/pabloqpacin/dotfiles/blob/main/scripts/autosetup/DebUbu-base.sh) pero cuidado con npm. Mejor seguir [mi documentación](https://github.com/pabloqpacin/dotfiles/blob/main/docs/linux/Pop!_OS.md) o completar estos pasos directamente:


```bash
# Build nvim from source on Ubuntu
```
```bash
# Install Packer, npm, etc.
```

## 2. Primeros pasos

- Abrir un nuevo archivo con neovim

```bash
cd ~/YT/cursos
mkdir vim && cd $_
tmux

nvim --version
nvim holamundo
```
- Demo rápida

```vim
" Editor modal basado en atajos de teclado
" Ratón funcionalidad limitada (luego lo veremos)
" Vim-motions universales para programas de terminal (man, popshell, tmux,alacritty, lf,btop)
i     == INSERT     --> hola\nmundo
Esc   == NORMAL
Vy    == VISUAL LINE + yank/copiar --> mundo
                       "yy   == yank line
p     == paste/pegar
O     == i anterior --> \nhola
kj    == NORMAL --configuracion--
Vj    == VISUAL LINE + abajo
K|J   == mover líneas --atajo personal--

d     == delete/eliminar
u     == undo/deshacer
C-R   == redo/rehacer
:q    == quit/salir ... no podemos por los cambios
  opciones
:w    == write/guardar
:q    == quit/salir
:wq   == guardar y salir
:q!   == salir sin guardar
:qa!  == quit all sin guardar
```

<!-- - Explicar `:qa` -- *aunque en general no usaremos, con una pestaña basta*

```bash
la  # 0
fortune | tee fortune1.txt
fortune | tee fortune2.md

nvim .
j k
Enter
C-w C-w
C-x # nvimtree horizontal
nt  # --personal por plugins--
C-w C-w
o   # ...
/foo
:qa!
``` -->

- Demo nvimtree, telescope

```bash
# Tmux new tab
cd
nvim dotfiles
j k 5j 5j
/vim
# .vimrc
C-P > remap

# nvimtree
C-X
Alt-.
nt nt

# Demo Raton
```


- Demo [marksman LSP](https://github.com/artempyanykh/marksman) y [peek.nvim](https://github.com/toppair/peek.nvim)

```bash
nvim holamundo.md
```
```md
# titulo del documento

un párrafo
otro

> aquí resaltamos algo

## primera parte

- primeros pasos

``bash
echo 'APT::Get::Show-Versions "true";' | sudo tee /etc/apt/apt.conf.d/99show-versions

sudo apt-get update && \
    sudo apt-get upgrade -y
``
```

- Enseñar `cheat` vim y algunas **vim-motions**; en las próximas lecciones veremos atajos mientras editamos un script de bash

```bash
cheat vim
jjj 10j kkk
C-D
C-U
G
gg

# ~~tmux C-A v~~
# tmux C-A Alt-j
# alacritty C-Shift-Space kkk 10k Y C-C
nvim foo
p
```

- [ ] Demo dhcp (UbuntuServerVM)