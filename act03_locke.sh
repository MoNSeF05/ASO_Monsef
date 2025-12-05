#!/bin/bash

# Ruta del archivo
ACTO2="/opt/jidoor/act02.sh"

if [ ! -f "$ACTO2" ]; then
    echo "Error: El script act02.sh no se ha localizado en $ACTO2"
    exit 1
fi

# Ejecutamos los tres scripts

bash "$ACTO2" Restablecer
bash "$ACTO2" Probar
bash "$ACTO2" Limpiar

# Mensaje de que todo se ha restaurado
echo "Sistema restaurado por act03_locke.sh a la fecha: $(date)"

# En el fichero de chronetab hay que añadir lo siguiente al final del archivo: */15 * * * * /