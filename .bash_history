cd ..
cd esteban.ferreira
mkdir repogit
cd repogit
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
cd UTN-FRA_SO_Examenes/
ls -l
cd 202406
ls -l
./script_Precondicion.sh 
source ~/.bashrc
cd ..
ls -l
cd ..
ls -l
ssh-keygen -t ed25519
cat /home/esteban.ferreira/.ssh/id_ed25519.pub
cd repogit
ls -l
git clone git@github.com:estebanFerreiraUtn/UTNFRA_SO_2do_Parcial_Ferreira.git
[200~ls -l /var/lib
sudo mkdir /var/lib/docker
ls -l /var/lib
sudo mkdir /var/lib/docker
ls -l /var/lib
ls -l /
sudo mkdir /work
ls -l /
sudo fdisk -l
sudo fdisk /dev/sdc
sudo fdisk -l
sudo fdisk /dev/sdd
sudo fdisk -l
sudo fdisk /dev/sdd
sudo fdisk /dev/sdc
sudo wipefs -a /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6 /dev/sdc7 /dev/sdc8 /dev/sdc9 /dev/sdc10 /dev/sdc11 /dev/sdd1 /dev/sdd2 /dev/sdd3 /dev/sdd5 /dev/sdd6
sudo pvcreate /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6 /dev/sdc7 /dev/sdc8 /dev/sdc9 /dev/sdc10 /dev/sdc11 /dev/sdd1 /dev/sdd2 /dev/sdd3 /dev/sdd5 /dev/sdd6
sudo vgcreate vg_datos /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6 /dev/sdc7 /dev/sdc8 /dev/sdc9 /dev/sdc10 /dev/sdc11
vgs
sudo vgs
sudo vgcreate vg_temp /dev/sdd1 /dev/sdd2 /dev/sdd3 /dev/sdd5 /dev/sdd6
sudo vgs
sudo lvcreate -L 5MB vg_datos -n lv_docker
sudo lvcreate -L 1.5GB vg_datos -n lv_workareas
sudo lvcreate -L 512MB vg_temp -n lv_swap
sudo lvs
sudo pvs
sudo fdisk -l
sudo mkfs -t ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs -t ext4 /dev/mapper/vg_datos-lv_workareas
sudo mkswap /dev/mapper/vg_temp-lv_swap
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker
sudo mount /dev/mapper/vg_datos-lv_workareas /work
sudo swapon /dev/mapper/vg_temp-lv_swap
df -h
free -h
sudo vgs
sudo systemctl restart docker
docker version
sudo apt update
sudo apt install docker
sudo apt install ansible
sudo apt list --installed | grep ansible
sudo apt list --installed | grep docker
docker version
sudo docker version
sudo systemctl restart docker
sudo systemctl status docker
ls -l
CD ..
cd ..
ls -l
cd RTA_Examen_20241117/
touch Punto_A.sh
ls -l
cat Punto_A.sh 
cat Punto_B.sh 
vim Punto_A.sh
cat Punto_A.sh 
ls -l
cd ..
ls -l
ls -l /usr/local/bin
ls -l /usr/local
touch /usr/local/bin/FerreiraAltaUser-Groups.sh
sudo touch /usr/local/bin/FerreiraAltaUser-Groups.sh
swapon -s
ls -l /usr/local/bin
ls -l
ls -l repogit
cat repogit/UTN-FRA_SO_Examenes/202406
ls -l repogit/UTN-FRA_SO_Examenes/202406
ls -l repogit/UTN-FRA_SO_Examenes/202406/bash_script/
cat repogit/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
ls -l
sudo FerreiraAltaUser-Groups.sh
echo $PATH
ls -l /usr/local/bin
sudo FerreiraAltaUser-Groups.sh esteban.ferreira /home/esteban.ferreira/repogit/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
sudo cat /usr/local/bin/FerreiraAltaUser-Groups.sh 
ls -l /usr/local/bin
sudo chmod 755 /usr/local/bin/FerreiraAltaUser-Groups.sh
FerreiraAltaUser-Groups.sh
rm -r /usr/local/bin/FerreiraAltaUser-Groups.sh 
vim RTA_Examen_20241117/Punto_B.sh 
./RTA_Examen_20241117/Punto_B.sh
sudo chmod 755 RTA_Examen_20241117/Punto_B.sh 
./RTA_Examen_20241117/Punto_B.sh
sudo cat << 'EOF' > /usr/local/bin/FerreiraAltaUser-Groups.sh
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
        #sudo usermod -p "$PASS" "$USUARIO"
done
IFS=$ANT_IFS
EOF

ls -l /usr/local/bin
cat /usr/local/bin/FerreiraAltaUser-Groups.sh 
rm -r /usr/local/bin/FerreiraAltaUser-Groups.sh 
sudo rm -r /usr/local/bin/FerreiraAltaUser-Groups.sh
sudo cat << 'EOF' > /usr/local/bin/FerreiraAltaUser-Groups.sh
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
        #sudo usermod -p "$PASS" "$USUARIO"
done
IFS=$ANT_IFS
EOF

ls -l /usr/local/bin
sudo cat > /usr/local/bin/crear_usuarios.sh << 'EOF'
test
EOF

ls -ld /usr/local/bin
sudo -l
sudo touch /usr/local/bin/FerreiraAltaUser-Groups.sh
sudo vim /usr/local/bin/FerreiraAltaUser-Groups.sh
sudo chmod 755 /usr/local/bin/FerreiraAltaUser-Groups.sh
FerreiraAltaUser-Groups.sh esteban.ferreira /home/esteban.ferreira/repogit/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
cat etc/pass
cat etc/passwd
cat /etc/passwd
sudo grep -E 'esteban.ferreira|2P_202406_Prog1' /etc/shadow |awk -F ':' '{print $2}'
sudo grep -E 'esteban.ferreira|2P_202406_Prog2' /etc/shadow |awk -F ':' '{print $2}'
sudo grep -E 'esteban.ferreira|2P_202406_Test1' /etc/shadow |awk -F ':' '{print $2}'
sudo grep -E 'esteban.ferreira|2P_202406_Supervisor' /etc/shadow |awk -F ':' '{print $2}'
vim RTA_Examen_20241117/Punto_B.sh 
cat RTA_Examen_20241117/Punto_B.sh 
sudo usermod -a -G docker $(whoami)
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
ls -l
cd repogit
cd ..
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
sudo usermod -a -G docker $(whoami)
grep docker /etc/group
id
exit
id
sudo systemctl status docker
cd repogit
ls -l
cd ..
cd esteban.ferreira/
cd repogit
ls -l
cd UTN-FRA_SO_Examenes/
cd 202406
ls -l
cd docker
ls -l
vim index.html
cat index.html 
exit
ls -l
cd repogit
ls -l
cd UTN-FRA_SO_Examenes/
ls -l
cd ..
ls -l
cd repogit
ls -l
cd utn-
cd UTN-
cd UTN-FRA_SO_Examenes/
ls -l
cd 202406
ls -l
cd docker
docker login -u estebanqaautomation
vim ~/repogit/UTN-FRA_SO_Examenes/202406/docker/index.html
docker build -t estebanqaautomation/web1-ferreira
docker build -t estebanqaautomation/web1-ferreira .
touch dockerfile
vim dockerfile
cat dockerfile
vim dockerfile
docker build -t estebanqaautomation/web1-ferreira .
df -h
sudo lvextend -L +500M /dev/mapper/vg_datos-lv_docker
sudo lvextend -L +400M /dev/mapper/vg_datos-lv_docker
sudo resize2fs /dev/mapper/vg_datos-lv_docker
docker build -t estebanqaautomation/web1-ferreira .
cd /home/esteban.ferreira/
cd ~/repogit/UTN-FRA_SO_Examenes/202406/docker
docker image list
docker run -d -p 8080:80 estebanqaautomation/web1-ferreira
curl local host:80
sudo netstat -putona | grep ':80'
netstat
apt install net-tools
sudo apt install net-tools
sudo netstat -putona | grep ':80'
curl localhost:80
ls -l /usr/share
sudo apt install nginx
ls -l /usr/share
docker ps
docker stop cd3
docker ps
docker run -d -p 8080:80 estebanqaautomation/web1-ferreira
docker ps
ipconfig
ifconfig | grep inet
docker ps
docker stop 38f
docker images
docker rmi 3affa6fd67a3
docker ps
docker rmi -f 3affa6fd67a3
docker images
docker build -t estebanqaautomation/web1-ferreira .
docker run -d -p 81:80 estebanqaautomation/web1-ferreira
ifconfig | grep inet
docker push estebanqaautomation/web1-ferreira
cat << 'EOF' > run.sh
docker run -d -p 81:80 estebanqaautomation/web1-ferreira
EOF

cat run.sh
cd ..
cd RTA_Examen_20241117/
ls -l
cat Punto_C.sh 
vim Punto_C.sh 
cat Punto_C.sh 
vim Punto_C.sh 
cd ~/repogit/UTN-FRA_SO_Examenes/202406/ansible
ls -l
cat README.md 
ls -l
cat playbook.yml 
sudo apt list --installed
sudo apt list --installed | grep ansible
sudo apt update
ls -l
cat playbook.yml 
ls -l /tmp
sudo rm -r /tmp/2do_parcial/
ls -l
cat playbook.yml 
cd roles
ls -l
cd 2do_parcial/
ls -l
cd tasks
ls -l
cat main.yml
cd ..
cd vars
ls -l
cat main.yml
cd ..
cd tasks
vim main.yml
ls -l
cd ..
ls -l
cd tasks
ls -l
cat main.yml
vim main.yml
cd ..
ls -l
ansible-playbook -i playbook.yml
cat /home/esteban.ferreira/.ssh/id_ed25519.pub >> /home/esteban.ferreira/.ssh/authorized_keys
cat /home/esteban.ferreira/.ssh/authorized_keys
ansible-playbook playbook.yml
ls -l
ansible-playbook -i inventory playbook.yml
cd roles
cd tasks
cd task
ls -l
cd 2do_parcial/
cd tasks/
vim main.yml 
cd ..
ansible-playbook -i inventory playbook.yml
vim roles/2do_parcial/tasks/main.yml 
ansible-playbook -i inventory playbook.yml
vim roles/2do_parcial/tasks/main.yml 
vim playbook.yml 
vim roles/2do_parcial/tasks/main.yml 
ansible-playbook -i inventory playbook.yml
vim playbook.yml 
ansible-playbook -i inventory playbook.yml
vim playbook.yml 
ansible-playbook -i inventory playbook.yml
vim roles/2do_parcial/tasks/main.yml 
ansible-playbook -i inventory playbook.yml
ls -l /tmp
vim roles/2do_parcial/tasks/main.yml
ls -l /tmp/2do_parcial/
ls -l
cd roles
ls -l
cd 2do_parcial
ls -l
mkdir templates
rm -r templates
cd ..
mkdir roles/2do_parcial/templates
vim roles/2do_parcial/tasks/main.yml
ls -l
cd inventory/
ls -l
cd ..
cat << EOF > roles/2do_parcial/templates/template_a.j2
Nombre: Esteban Apellido: Ferreira
eof
EOF

rm roles/2do_parcial/templates/template_a.j2 
cat << EOF > roles/2do_parcial/templates/template_a.j2
Nombre: {{ tu-nombre }} Apellido: {{ tu-apellido }}
División: {{ 311 }}
EOF

ls -l roles/2do_parcial/
ls -l roles/2do_parcial/vars
vim roles/2do_parcial/vars
vim roles/2do_parcial/tasks/main.yml
clear
sudo rm -r /tmp/2do_parcial
ls -l /tmp
ansible-playbook -i inventory playbook.yml
vim roles/2do_parcial/tasks/main.yml
ansible-playbook -i inventory playbook.yml
vim roles/2do_parcial/tasks/main.yml
vim roles/2do_parcial/templates/template_a.j2 
ansible-playbook -i inventory playbook.yml
ls -l /tmp/2do_parcial/alumno
cat /tmp/2do_parcial/alumno/datos_alumno.txt
vim roles/2do_parcial/tasks/main.yml
tree /tmp
grep inet
inet
hostname -I
ifconfig | grep inet
hostname -I | awk -F ' ' '{print $2}'
cat /etc/os-release | grep -i "name"
cat /etc/os-release | grep -i "pretty_name"
cat /etc/os-release | grep -i "name" | head -n 1 | cut -d= -f2 | tr -d '"'
cat /etc/os-release | grep -i "name" | head -n 1
nproc
vim roles/2do_parcial/tasks/main.yml
sudo rm -r /tmp/2do_parcial
ansible-playbook -i inventory playbook.yml
vim roles/2do_parcial/tasks/main.yml
ansible-playbook -i inventory playbook.yml
cat << EOF > roles/2do_parcial/templates/template_b.j2
IP: {{tu_ip}}
Distribución: {{tu_distro}}
Cantidad de Cores: {{cores}}
EOF

sudo rm -r /tmp/2do_parcial
ansible-playbook -i inventory playbook.yml
vim roles/2do_parcial/tasks/main.yml
sudo rm -r /tmp/2do_parcial
ansible-playbook -i inventory playbook.yml
sudo rm -r /tmp/2do_parcial
vim roles/2do_parcial/tasks/main.yml
clear
ansible-playbook -i inventory playbook.yml
cat /tmp/2do_parcial/equipo/datos_equipo.txt
sudo rm -r /tmp/2do_parcial
vim roles/2do_parcial/tasks/main.yml
ansible-playbook -i inventory playbook.yml
sudo cat/etc/sudoers
sudo cat /etc/sudoers
sudo vim /etc/sudoers
sudo cat /etc/sudoers
vim roles/2do_parcial/tasks/main.yml
sudo rm -r /tmp/2do_parcial
ansible-playbook -i inventory playbook.yml
sudo cat /etc/sudoers
sudo rm -r /tmp/2do_parcial
sudo cat /etc/sudoers
sudo vim /etc/sudoers
vim roles/2do_parcial/tasks/main.yml
sudo rm -r /tmp/2do_parcial
ansible-playbook -i inventory playbook.yml
sudo cat /etc/sudoers
sudo rm -r /tmp/2do_parcial
sudo vim /etc/sudoers
vim roles/2do_parcial/tasks/main.yml
sudo rm -r /tmp/2do_parcial
ansible-playbook -i inventory playbook.yml
sudo cat /etc/sudoers
su - 2P_202406_Supervisor
vim roles/2do_parcial/tasks/main.yml
cd ..
ls -l
cd ..
ls -l
cd RTA_Examen_20241117/
ls -l
cat Punto_C.sh 
vim Punto_D.sh 
cd ..
cd repogit/
ls -l
cd UTN-FRA_SO_Examenes/
cd 202406/ansible/
vim playbook.yml 
sudo rm -r /tmp/2do_parcial
ansible-playbook -i inventory playbook.yml
vim playbook.yml 
ansible-playbook -i inventory playbook.yml
cd ..
ls -l
cd ..
ls -l
cd RTA_Examen_20241117/
vim Punto_D.sh 
cat Punto_C.sh
cat Punto_B.sh
cp Punto_B.sh Punto_Bis.sh
ls -l
vim Punto_Bis.sh
rm Punto_Bis.sh 
touch Punto_Bis.sh
vim Punto_Bis.sh 
cat Punto_Bis.sh 
vim Punto_Bis.sh 
sudo chmod 755 Punto_Bis.sh 
ls -l
./Punto_Bis.sh 
vim Punto_Bis.sh 
sestatus
ls -l
vim Punto_Bis.sh 
./Punto_Bis.sh 
vim Punto_Bis.sh 
./Punto_Bis.sh 
vim Punto_Bis.sh 
rm Punto_Bis.sh
ls -l
cat Punto_D.sh 
ls -l
cd ..
ls -l
cd repogit
ls -l
cd UTNFRA_SO_2do_Parcial_Ferreira/
cp ~/repogit/UTN-FRA_SO_Examenes/202406
cp ~/repogit/UTN-FRA_SO_Examenes/202406 | pw
pw
pwd
cp ~/repogit/UTN-FRA_SO_Examenes/202406 | pwd
cp ~/repogit/UTN-FRA_SO_Examenes/202406 ~/repogit/UTNFRA_SO_2do_Parcial_Ferreira
cp -r ~/repogit/UTN-FRA_SO_Examenes/202406 ~/repogit/UTNFRA_SO_2do_Parcial_Ferreira
ls -l
ls -l 202406
ls -l 202406/ansible
ls -l 202406/ansible/roles
ls -l 202406/ansible/roles/2do_parcial/
cd ..
ls -l
cd RTA_Examen_20241117/
touch Punto_bis.sh
vim Punto_bis.sh
vim Punto_B.sh
vim Punto_bis.sh
sudo rm -r /usr/local/bin/FerreiraAltaUser-Groups.sh
./Punto_bis.sh
sudo chmod 755 Punto_bis.sh 
./Punto_bis.sh
ls -l
echo > Punto_bis.sh 
cat Punto_bis.sh 
vim Punto_bis.sh 
./Punto_bis.sh
ls -l
cat FerreiraAltaUser-Groups.sh 
ls -l
rm FerreiraAltaUser-Groups.sh 
rm Punto_bis.sh 
ls -l
./Punto_B.sh 
cat Punto_B.sh 
cat /usr/local/bin/FerreiraAltaUser-Groups.sh
vim /usr/local/bin/FerreiraAltaUser-Groups.sh
sudo vim /usr/local/bin/FerreiraAltaUser-Groups.sh
FerreiraAltaUser-Groups.sh esteban.ferreira /home/esteban.ferreira/repogit/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
sudo grep -E 'esteban.ferreira|2P_202406_Prog1' /etc/shadow |awk -F ':' '{print $2}'
sudo grep -E 'esteban.ferreira|2P_202406_Prog2' /etc/shadow |awk -F ':' '{print $2}'
sudo grep -E 'esteban.ferreira|2P_202406_Test' /etc/shadow |awk -F ':' '{print $2}'
sudo grep -E 'esteban.ferreira|2P_202406_Supervisor' /etc/shadow |awk -F ':' '{print $2}'
clear
cat Punto_A.sh 
cat Punto_B.sh 
cat Punto_C.sh 
cat Punto_D.sh 
cd ..
cd repogit
ls -l
cd UTNFRA_SO_2do_Parcial_Ferreira/
ls -l
cp -r \$HOME/RTA_Examen_20241117/ ~/repogit/UTNFRA_SO_2do_Parcial_Ferreira
cp -r ~/RTA_Examen_20241117/ ~/repogit/UTNFRA_SO_2do_Parcial_Ferreira
ls -l
history -a
