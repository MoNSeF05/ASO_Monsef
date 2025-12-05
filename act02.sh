#!/bin/bash

USUARIO="$1"
ACCION="$2"
# Ponemos directrices en caso de que escriban comandos erróneos para que los echen.
if [ $# -ne 2 ]; then
    echo "Uso: $0 <usuario> <Restablecer|Probar|Limpiar>"
    exit 1
fi

if ! id "$USUARIO"; then
    echo "Error: el usuario $USUARIO no existe."
    exit 1
fi

if id -u -ne 0; then
    echo "Usuario $USUARIO sin permisos."
    exit 1
fi

HOME_DIR="/home/$USUARIO"

if [ ! -d "$HOME_DIR" ]; then
    echo "El directorio $HOME_DIR no existe."
    exit 1
fi

#  Hacemos un case para que en caso de las 3 opciones que nos dice el ejercicio ejecutemos la que nos pide el ejercicio.
case "$ACCION" in
    Restablecer)
        echo "Restableciendo estructura para $USUARIO..."
        mkdir -p "$HOME_DIR"/Acto_{I,II,III,IV}
        echo "$USUARIO" > "$HOME_DIR/${USUARIO}.txt"
        for i in I II III IV; do
            echo "$USUARIO" > "$HOME_DIR/Acto_${i}/${USUARIO}_${i}.txt"
        done
        chown -R "$USUARIO:$USUARIO" "$HOME_DIR"
        echo "Estructura restablecida."
        ;;
        
    Probar)
        echo "Verificando archivos de $USUARIO"
        if [ -r "$HOME_DIR/${USUARIO}.txt" ]; then
            echo "Partitura principal accesible."
        else
            echo "No se puede leer la partitura principal."
        fi
        ;;
        
    Limpiar)
        if [ -z "$USUARIO" ] || [ "$USUARIO" = "/" ]; then
            echo "Error: variable USUARIO vacía o inválida."
            exit 1
        fi
        echo "Borrando contenido del home de $USUARIO..."
        rm -rf "$HOME_DIR"/*
        echo "Directorio de $USUARIO limpio."
        ;;
        
    *)
        echo "Acción no reconocida. Usa: Restablecer, Probar o Limpiar."
        exit 1
        ;;
esac
