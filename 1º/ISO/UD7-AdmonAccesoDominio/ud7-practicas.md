# ISO UD7: Admon Acceso Dominios (+ Linux Práctica)


> `wc` &emsp; `!$` &emsp; `sort` &emsp; `cut` &emsp; `awk`



```bash
# 1.
mkdir ~/Documents/iso-ud7/pajarracos && cd $_

# 2. & 3. Alternatively 'touch *.txt' and 'vim *'
echo "El halcón es un pajarraco que caza ratones. También es utilizado por el ser humano para asustar a otras aves que se comen los cultivos." > halcon.txt
echo "El jilguero es un pajarraco de tamaño pequeño. Los machos tienen la cabeza más negra y las hembras más verde" > jilguero.txt
echo "El canario es un pajarraco doméstico de gran popularidad" > canario.txt
echo "Cuidado te atacará si estás moribundo" > buitre.txt
echo "Este pajarraco por las noches parece que no duerme" > buho.txt
echo "Este pajarraco repite lo que dices" > loro.txt


# 4.
wc -l * 

# 5.
mkdir ../results


# 6. OJO 'wc' y 'sort'
wc * | sort && echo "loro.txt es el más corto"
wc * | sort > ../results/cuentalineas.txt


# 7.
cat !$

# 8. & 9. DONE ALREADY
# 10. EAZ (11. ?)


# 12.
mkdir ../misficheros && cd $_
touch mobiliario.txt

# 13.
echo "2015-11-05,silla
2015-11-05,mesa
2015-11-05,escritorio
2015-11-06,encimera
2015-11-06,banqueta
2015-11-06,lampara
2015-11-07,sillon
2015-11-07,butaca" > mobiliario.txt

# 14.
cat mobiliario.txt | cut -d”,” -f2
awk -F, '{print $2}' mobiliario.txt
```



