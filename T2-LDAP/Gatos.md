# Tarea: Instalación de OpenLDAP

Vamos a realizar la instalación y configuración del servicio de OpenLDAP. Para ello prepararemos una maquina con GNU/LinuX que funcione como nuestro servidor LDAP en el cual almacenaremos usuarios y grupos a los que asignaremos permisos y configuraciones sobre recursos en nuestra red mas adelante.

Esta tarea se va a completar usando Ubuntu Server *sin entorno gráfico* puesto que se utilizaran destrezas relevantes para puestos de **Administración de Sistemas**.

Existen muchos servidores LDAP Open Source, pero nosotros usaremos OpenLDAP.

## Instalación del servicio

En la máquina Ubuntu Server instalaremos `slapd` que contiene el *daemon* o servidor de ldap y ldap-utils.

````shell
sudo apt install slapd ldap-utils
````

Durante la instalación nos preguntará por la contraseña de administrador del LDAP (que no tiene porque ser la misma que la de nuestro administrador)

Con el fin de configurar OpenLDAP, instalaremos un gestor Web que nos permitirá administrar el LDAP siempre que conozcamos el nombre o IP de nuestro servidor. Este tipo de herramientas son útiles en entornos empresariales pues permiten administrar de forma remota nuestros servicios utilizando herramientas gráficas, sin necesidad de instalar un servidor de X en las maquinas que contienen los servicios.

```shell
sudo apt search ldapadmin
```

Si ejecutamos la orden anterior podemos ver que que aparece `phpldapadmin`, pero requiere de un servidor de bases de datos para gestionarlo, asi que antes de configurar slapd vamos a instalar MySQL Server.

## Instalación de MySQL Server

Instalaremos MySQL Server

````shell
sudo apt install mysql-server
````

Una vez finalizada la descarga, comenzaremos con la de `phpldapadmin`

## Instalación de phpLDAPadmin y LDAPAcountManager

````shell
sudo apt install phpldapadmin ldap-account-manager
````

Lo usaremos al final para agilizar la gestión de elementos.

# Noche en Ulthal

![Gatos](/img/gatos.png)

Práctica ambientada en el siguiente relato: [Los Gatos de Uthal](https://mrpoecrafthyde.wordpress.com/wp-content/uploads/2016/02/h-p-lovecraft-los-gatos-de-ulthar.pdf)

## Ejercicio I: Ulthal

Se dice que en Ulthal, una villa más allá del rio Skai no se pueden matar gatos. Esta historia suele ser narrada generalmente por el burgomaestre, Kranon el Anciano y aunque ya ha quedado como una historia que se le cuenta a los niños antes de irse a la cama, se puede ver un ápice de terror en los ojos de dos ciudadanos Shang, el herrero y Thul, un cortador de piedras.

Crea un dominio `ulthal.skai.world` y dos unidades organizativas `ciudadanos` y `gatos`.

Entrega un fichero `base.ldif` donde se muestre la creación de ambas unidades organizativas e indica el comando empleado. Recuerda usar `ldapadd` para añadirlos.

## Ejercicio II: Ciudadanos

Crea una contraseña cifrada usando el comando `slappasswd` y utilízala para los distintos usuarios que crearemos en esta práctica.

Crea un `posixAccount` y un `posixGroup` para los siguientes usuarios:
- `Kranon el Anciano` con  `UID = 1920`
- `Shang` con `UID = 1921`
- `Thul` con `UID = 1922`

Entrega un user.ldif con la creación de los usuarios.

## Ejercicio III: Kranon el Anciano

Crea un certificado ssl autofirma [Más info](https://www.server-world.info/en/note?os=Ubuntu_24.04&p=ssl&f=1)

Configura el servidor y el cliente LDAP para usar conexión segura. Accede al usuario Kranon el Anciano y escribe un historia.txt en su directorio home con el primer párrafo de la historia.

Configura un proveedor y un consumidor para que si se cae el LDAP master continue el directorio con Kranon el Anciano.

## Ejercicio IV: Gatos

Crea un script que cree 11 usuarios Gato en el servidor utilizando `useradd`. Cada uno de los usuarios deberá tener la siguiente estructura: `gatoXX`, con contraseña `XX` y uid `90XX`.

> Por ejemplo, **Gato 7** tendría el usuario gato07, la contraseña 07 y la uid 9007.

Una vez creado los usuarios, crea otro script llamado ldapcat.sh que añada los usuarios con una uid comprendida entre 9000 y 9011 al directorio LDAP dentro de la unidad organizativa `gatos`. 

> **Tip:** Puedes crear un fichero `ldapcat.ldif` con el script para ayudarte en la creación de los distintos usuarios utilizando después `ldapadd`.


# La Leyenda

Shang y Thul cuentan como hace varios años una pareja que vivía en una cabaña proxima al bosque se dedicaba a matar los gatos que se acercaban a su cabaña.
No fue hasta que apareció una caravana proveniente del Sur con un extraño niño llamado Menes el cual cuidaba un gato negro.

## Ejercicio V: La Cabaña del Bosque

Crea un script llamado cabaña.sh que borre el usuario LDAP de la unidad organizativa Gato con la UID más alta. Luego programa una tarea para que ejecute el programa cada hora.

## Ejercicio VI: La Caravana

Crea dos nuevos usuarios, `Menes` y `gatomenes` cada uno en su unidad organizativa correspondiente.

# La oración

Cunado el gato negro de Menes desapareció este entonó unas extrañas plegarias al cielo de las cuales aparecieron extrañas figuras sombrias. Cuando termino, la caravana se marcho y con su despedida, volvieron todos los gatos a la aldea.

## Ejercicio VII: Sombras en el Cielo

Crea un script `oración.sh` que revise si falta algún usuario Gato.

Si `gatomenes` existe deberá imprimir ***"miau"***. Si no existe creará todos los usuarios gato que faltan salvo `gatomenes`, quitará `cabaña.sh` del crontab y borrará al usuario `Menes` del directorio LDAP y de los usuarios.

## Ejercicio VIII: Otras historias

Accede a las siguientes direcciones para configurar el directorio LDAP

````
http://[IP]/lam
````

````
http://[IP]/phpldapadmin
````






