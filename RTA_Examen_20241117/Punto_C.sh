echo "Me posiciono en la carpeta docker: "
cd ~/repogit/UTN-FRA_SO_Examenes/202406/docker

echo "Edito index.html con los datos solicitados: "
vim ~/repogit/UTN-FRA_SO_Examenes/202406/docker/index.html

echo "Me logueo a docker hub con mi user: "
docker login -u estebanqaautomation

echo "Creo el archivo dockerfile y lo edito con vim: "
touch dockerfile
vim dockerfile

echo "Le agrego las siguientes líneas: "
FROM nginx
COPY index.html /usr/share/nginx/html

echo "Genero la imagen: "
docker build -t estebanqaautomation/web1-ferreira .

echo "Obtengo error por falta de espacio, expando el volumen de docker: "
sudo lvextend -L +400M /dev/mapper/vg_datos-lv_docker
sudo resize2fs /dev/mapper/vg_datos-lv_docker

echo "Genero la imagen: "
docker build -t estebanqaautomation/web1-ferreira .

echo "Chequeo que se creo bien y está listada: "
docker image list

echo "Chequeo que funciona"
docker run -d -p 81:80 estebanqaautomation/web1-ferreira
ifconfig | grep inet
#En una ventana del navegador pego la ip de mi maquina vagrant y el puerto, en mi caso "http://192.168.56.3:81"
#Debería mostrar la página web ya modificada

echo "Me logueo a dockerhub: "
docker login -u estebanqaautomation

echo "Subo la imagen: "
docker push estebanqaautomation/web1-ferreira

echo "Chequeo que se subió correctamente en mi navegador: "
https://hub.docker.com/repositories/estebanqaautomation

echo "Creo el script con el ejecutable para levantar la imagen: "
cat << 'EOF' > run.sh
> docker run -d -p 81:80 estebanqaautomation/web1-ferreira
> EOF
