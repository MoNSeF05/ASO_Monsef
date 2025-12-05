#!/bin/bash

ARGUM=$1
# Comprobacion de Locke.

if grep -q "Locke:"

#Sino existe lo creemos
if ! id Locke >/dev/null; then
    useradd -m -s /bin/bash Locke
fi

# Método de borrado según el enunciado

if ["$ARGUM" = "--all"];  then
    rm -rf /home/*/Act0*

elif [ "$ARGUM" = "--01"]; then 
    rm -rf /home/*/Act01

elif [ "$ARGUM" = "--02"]; then 
    rm -rf /home/*/Act02

elif [ "$ARGUM" = "--03"]; then 
    rm -rf /home/*/Act03

elif [ "$ARGUM" = "--04"]; then 
    rm -rf /home/*/Act04

else
    echo "Argumento incorrecto. Usa: --all --01 --02 --03 --04"
fi
# También hay que configurar el fichero de Chrontab y poner cada 10 minutos con un argumento aleatorio.