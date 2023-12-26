{ grabar teclas pulsadas en pantalla + yo en una esquina (tipo Prime o Chuck)}


((ingles cuando se pueda, pqra las iniciales (igual que bash)))

$ nvim --version

 { instalacion ?? script pero ojo con node, yo recomiendo nvm y popos}
 para algo como DebUbu, mejor vscode, pero bueno, depende del comfort
 para algo rapido, un script rapido para probar unos comandos, editar un /etc/foo,
 tweak .zshrc, etc.

extra: vim motions en todos lados, man, less, window managers, tmux,vscode plugin
extra: importante si ssh


## intro

... $ mv .config/nvim-bak

$ nvim holamundo... == archivo vacio


;interfaz

terminal config (tranparente, fuente)
neovim config (lua como py, mas adelante) (color, atajos, etc, mucho, super-personalizable)
    ejempmo, lineas largas (no wrap). tb en vscode pero aqui es rollo artesanal
    pestañas, git, etc.
    pero nombre archivo, lineas y columnas, si 
    realmente plugins son poco comparado con lo nativo


;demo

i

Esc:: remap to kj porque los dedos siempre ahi ;)

o (luego NOMBRO las teclas)

Esc

u

C-R

:q

:w

o Esc

:wq

up,enter
o Esc
:q
:q!

nvim . (nvimtree, sin plugin es feo pero ok)
       (luego, DEMO de remap :Ex a leader-pv)

j k

enter
:q
enter
:qa

$ cheat vim, etc

turra: hace poco, idea sobre una movida, sin pc pero movil, no G Drive simo Github... TERMUX!!
       pues git clone, nvim y super rapido con los atajos


## fundamentos


;intro

INOP $ fortune > tmp.md | nvim

cd ASIR

nvim .

leader-pf (sistemas...)

leader-nt

> editor de texto, muy rapido

MODAL
- normal (comandos)
- visual
- editor


;navegacion

b e w

j j k

G gg

10j

$ 0 (broma regex)


; edicion

$ cheat -e ASIR

i a

A I

o O

dd (repeticiones)

Vd (intro Visual)


;seleccion visual

ved

vbbbbbs

v5bs

S

(kj o Esc)


leader-vb (wsl...)
  jls


;acciones

y

Vy

Vd

p

u C-R

(ctrl+z nanay, perfe como Quiz)


;comandos

(yo sé pocos.., no hacen mucha falta y lo importante/habitual esta automatizado)

:%s/tres/dos/gc

:! pwd (shell, aunque mejor estar en tmux o tener panes como en WinTer)


;plugins

...


;conclusion

tres letras, tres acciones, 3 segundos (mano en teclado, y atajos para tb gestionar ventanas)

luego, peña que virguerias...los propios desarrolladores, como TJ o Prime



## configuracion + quiz

configuracion dotfiles por encima:
- lua.init
- remaps, ajustes comodos
- plugins: theme, tree, telescope, gitsigns, peek, matching-pairs
- LSP: langs ...bash OK: variables, definiciones, incluso debug...
- DAP: laberinto :(


mi config (dotfiles):
- remaps comentados
- neovim lua mejor que vimscript


DEMO: 



## quiz

1. practica

escribir un bash script que haga 'echo "hola mundo" | lolcat'
  si es que lolcat existe, si no solo el echo.
  Ejemplo error = &>/dev/null (mas en aquel curso)
  Demostrar LSP stuff

> con tmux, renombrar lolcat en el path para demostrar 0 1 2

2. Personaliza un atajo

con la referencia de :Ex to leader-pv...
remap ctrl-z (provide key name bs) to ':! bash ~/scripts/lolcat.sh'

3. vimtutor... pacvim (likely shi)

4. clone n symlink dotfiles, run nvim, lil bit sometimes

5. ask me anything (sesiones interactivas)

6. mis refes: Prime, makigas?



=============)))%
