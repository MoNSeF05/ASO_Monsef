#Banner
if id "espectador" >/dev/null; then
    echo "Usuario espectador existe".
else    
    useradd -m -s /bin/bash espectador
    echo "espectador:1234" | chpasswd
    echo "Espectador creado"
fi

#Generamos y copiamos el banner

cp banner.txt /etc/banner.txt

# Confiracion ssh
echo "Banner /etx/banner.txt" >> /etc/ssh/sshd_config

echo "ls /srv/jidoor/opera; exit" > /home/espectador/bash_profile
