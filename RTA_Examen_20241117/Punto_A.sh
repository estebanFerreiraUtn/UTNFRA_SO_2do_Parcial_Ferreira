#!/bin/bash

echo "Chequeo si existen los puntos de montaje y creo los que falten: "
ls -l /var/lib
sudo mkdir /var/lib/docker
sudo mkdir /work

echo "Creo particiones: "
#Disco sdc: 3 particiones físicas de 200mb, 1 extendida, 6 particiones lógicas de 200mb, una de 240mb
sudo fdisk -l
sudo fdisk /dev/sdc
n
p
+200mb

n
e

n
+200mb

n
+240mb
w

#Disco sdd: 3 particiones físicas de 200mb, 1 extendida, 2 particiones lógicas de 200mb, una de 257mb
sudo fdisk /dev/sdd
n
p
+200mb

n
e

n
+200mb

n
+257mb

n
+240mb
w

echo "Cambio todas las particiones creadas (salvo extendidas) a lvm: "
sudo fdisk /dev/sdd
t
1 #Aquí de 1 a 6 exceptuando la 4 que es extendida
8E
p
w

sudo fdisk /dev/sdc
t
1 #Aquí de 1 a 11 exceptuando la 4 que es extendida
8E
p
w

echo "Limpio las particiones para lvm: "
sudo wipefs -a /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6 /dev/sdc7 /dev/sdc8 /dev/sdc9 /dev/sdc10 /dev/sdc11 /dev/sdd1 /dev/sdd2 /dev/sdd3 /dev/sdd5 /dev/sdd6

echo "Creo los volúmenes físicos y verifico el estado: "
sudo pvcreate /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6 /dev/sdc7 /dev/sdc8 /dev/sdc9 /dev/sdc10 /dev/sdc11 /dev/sdd1 /dev/sdd2 /dev/sdd3 /dev/sdd5 /dev/sdd6
sudo pvs

echo "Creo los grupos de volúmenes y verifico que se hayan creado correctamente: "
sudo vgcreate vg_datos /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6 /dev/sdc7 /dev/sdc8 /dev/sdc9 /dev/sdc10 /dev/sdc11
sudo vgcreate vg_temp /dev/sdd1 /dev/sdd2 /dev/sdd3 /dev/sdd5 /dev/sdd6
sudo vgs

echo "Creo los volúmenes: "
sudo lvcreate -L 5MB vg_datos -n lv_docker
#En este punto lo crea de 8 mb porque redondea hacia arriba
sudo lvcreate -L 1.5GB vg_datos -n lv_workareas
sudo lvcreate -L 512MB vg_temp -n lv_swap
sudo lvs

echo "Formateo los volúmenes creados":
sudo fdisk -l
sudo mkfs -t ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs -t ext4 /dev/mapper/vg_datos-lv_workareas
sudo mkswap /dev/mapper/vg_temp-lv_swap

echo "Monto los volúmenes":
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker
sudo mount /dev/mapper/vg_datos-lv_workareas /work
sudo swapon /dev/mapper/vg_temp-lv_swap

echo "Chequeo que se montó todo donde corresponde: "
df -h
free -h
