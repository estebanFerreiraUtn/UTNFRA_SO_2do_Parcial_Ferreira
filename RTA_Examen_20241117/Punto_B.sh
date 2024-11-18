#!/bin/bash

echo "Creo el archivo a ser ejecutado: "
sudo touch /usr/local/bin/FerreiraAltaUser-Groups.sh

echo "Lo edito con vim y agrego el script: "
sudo vim /usr/local/bin/FerreiraAltaUser-Groups.sh

#!/bin/bash

USUARIO_PARAMETRO=$1
LISTA=$2

PASS=$(sudo grep "$USUARIO_PARAMETRO" /etc/shadow |awk -F ':' '{print $2}')

ANT_IFS=$IFS
IFS=$'\n'
for LINEA in `cat $LISTA |  grep -v ^#`
do
        USUARIO=$(echo  $LINEA |awk -F ',' '{print $1}')
        GRUPO=$(echo  $LINEA |awk -F ',' '{print $2}')
        HOME=$(echo  $LINEA |awk -F ',' '{print $3}')
        sudo groupadd "$GRUPO"
        sudo useradd -m -d "$HOME" -s /bin/bash -g "$GRUPO" -p "$PASS" "$USUARIO"        
done
IFS=$ANT_IFS

echo "Doy permisos de ejecución"
sudo chmod 755 /usr/local/bin/FerreiraAltaUser-Groups.sh

echo "Ejecuto el script: "
FerreiraAltaUser-Groups.sh esteban.ferreira /home/esteban.ferreira/repogit/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt

echo "Verifico que el pass sea igual: "
sudo grep -E 'esteban.ferreira|2P_202406_Prog1' /etc/shadow |awk -F ':' '{print $2}'
sudo grep -E 'esteban.ferreira|2P_202406_Prog2' /etc/shadow |awk -F ':' '{print $2}'
sudo grep -E 'esteban.ferreira|2P_202406_Test' /etc/shadow |awk -F ':' '{print $2}'
sudo grep -E 'esteban.ferreira|2P_202406_Supervisor' /etc/shadow |awk -F ':' '{print $2}'
