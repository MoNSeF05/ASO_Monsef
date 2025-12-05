#!/bin/bash

USUARIOS=("Locke" "Celes" "Maria" "Oboe" "Clarinete" "Flauta" "Guitarra" "Corno" "Cello" "Contrabajo" "Sistro" "Timbal" "Conductor")

echo "Verificando usuarios principales..."
# Comprobación de usuarios.
for user in "${USUARIOS}"; do
    if id "$user" >/dev/null; then
        echo "Usuario '$user' ya existe. Se omite la creación."
    else
        useradd -m "$user"
        echo "$user:1234" | chpasswd
        echo "Usuario '$user' creado con contraseña por defecto."
    fi
done

# Creamos el usuario 'Ultros' si no existe
if id Ultros >/dev/null; then
    echo "Usuario 'Ultros' ya existe."
else
    useradd -m Ultros
    echo "Ultros:desantedida" | chpasswd
    echo "Usuario 'Ultros' creado con contraseña por defecto."
fi

echo "Todos los usuarios han sido verificados y creados si era necesario."
echo "Ahora el sistema está listo para ejecutar act03-locke.sh."

