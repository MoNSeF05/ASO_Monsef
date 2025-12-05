#!/bin/bash

OPC=$1
OBJ=$2

if ! id Ultros >/dev/null; then
    useradd -m Ultros
    echo "Usuario Ultros creado."
fi

if [ "$OPC" = "--instruments" ] || [ "$OPC" = "-i" ]; then
    if id "$OBJ" >/dev/null; then
        userdel -r "$OBJ"
        echo "Instrumento $OBJ eliminado."
    else
        echo "El instrumento $OBJ no existe."
    fi
fi

if [ "$OPC" = "--groups" ] || [ "$OPC" = "-g" ]; then
    if getent group "$OBJ" >/dev/null; then
        groupdel "$OBJ"
        echo "Grupo $OBJ eliminado."
    else
        echo "El grupo $OBJ no existe."
    fi
fi

if [ "$OPC" = "--partitures" ] || [ "$OPC" = "-p" ]; then
    rm -rf /home/*/Acto_$OBJ
    echo "Partituras $OBJ eliminadas."
fi

