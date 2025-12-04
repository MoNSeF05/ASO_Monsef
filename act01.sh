#!/bin/bash

#Creación de grupos
groupadd orquesta
groupadd artista

#Creación de variables y ficheros
ORQUESTA="/srv/jidoor/opera/Il_barbiere_di_Siviglia/orquesta"
ARTISTAS="/srv/jidoor/opera/Il_barbiere_di_Siviglia/artistas"
ARTISTA="Maria Draco Ralse Narrador"
INSTRUMENTOS="Oboe Clarinete Flauta Guitarra Corno Cello Contrabajo Sistro Timbal Conductor"

mkdir -p $ARTISTAS
mkdir -p $ORQUESTA


# Orquesta
for u in $INSTRUMENTOS; do
    mkdir -p $ORQUESTA/$u
    echo "$u" > $ORQUESTA/$u/$u.txt
    chown $u:Orquesta $ORQUESTA/$u/$u.txt
    chmod 600 $ORQUESTA/$u/$u.txt
done


for a in $ARTISTA; do
    mkdir -p $ARTISTAS/$a
    echo "$a" > $ARTISTAS/$a/$a.txt
    chown $a:Artista $ARTISTAS/$a/$a.txt
    chmod 600 $ARTISTAS/$a/$a.txt
done

chmod -R 750 "/srv/jidoor/opera/Il_barbiere_di_Siviglia/"

echo "ACTO I acabado"