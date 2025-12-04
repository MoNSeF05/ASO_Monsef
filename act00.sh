#!/bin/bash

INSTRUMENTOS="Oboe Clarinete Flauta Guitarra Corno Cello Contrabajo Sistro Timbal Conductor"
GRUPOS="Cuerda Viento_madera Viento_metal Percusion Conductor Orquesta Artistas"

echo "Creando grupos de la orquesta"

for grupo in $GRUPOS; do
    if cat /etc/group | grep monsef &>/dev/null; then
        echo "El grupo $grupo ya está creado."
    else
        groupadd "$grupo"
        echo "Grupo $grupo creado correctamente."
    fi
done

echo "Creando usuarios e instrumentos"

for usuario in $INSTRUMENTOS; do
    if id "$usuario" &>/dev/null; then
        echo "El usuario $usuario ya existe."
    else
        useradd -m -s /bin/bash "$usuario" 
        echo "$usuario:1234" | chpasswd
        echo "Usuario $usuario añadido con su contraseña por defecto."
        usermod -aG Orquesta "$usuario"
    fi
    
done

#Añadimos usuarios
usermod -aG Cuerda Cello
usermod -aG Cuerda Contrabajo
usermod -aG Cuerda Guitarra

usermod -aG Viento_madera Oboe
usermod -aG Viento_madera Clarinete
usermod -aG Viento_madera Flauta
usermod -aG Viento_metal Corno

usermod -aG Percusion Sistro
usermod -aG Percusion Timbal

usermod -aG Conductor Conductor

usermod -aG Orquesta Oboe
usermod -aG Orquesta Clarinete
usermod -aG Orquesta Corno
usermod -aG Orquesta Flauta
usermod -aG Orquesta Cello
usermod -aG Orquesta Contrabajo
usermod -aG Orquesta Guitarra
usermod -aG Orquesta Sistro
usermod -aG Orquesta Timbal
usermod -aG Orquesta Conductor



for artista in Maria Draco Ralse Narrador; do
    if ! id "$artista" &>/dev/null; then
        useradd -m -s /bin/bash "$artista"
        echo "$artista:1234" | chpasswd
        echo "Artista $artista creado."
        usermod -aG Artistas "$artista"
    fi
   
done

echo "Tarea 1 finalizada con exito."
