echo "Agrego la key pública":
#Si no estaba generada, descomentar la línea de abajo
#ssh-keygen -t ed25519
cat $HOME/.ssh/id_ed25519.pub >> $HOME/.ssh/authorized_keys

echo "Me posiciono en la carpeta ansible: "
cd ~/repogit/UTN-FRA_SO_Examenes/202406/ansible

echo "Creo la carpeta templates en el rol: "
mkdir roles/2do_parcial/templates

echo "Chequeo mi ip, distro y cores: "
hostname -I | awk -F ' ' '{print $2}'
cat /etc/os-release | grep -i "name" | head -n 1
nproc

echo "Creo los templates: "
cat << EOF > roles/2do_parcial/templates/template_a.j2
> Nombre: {{ tu_nombre }} Apellido: {{ tu_apellido }}
> División: {{ tu_division }}
> EOF

cat << EOF > roles/2do_parcial/templates/template_b.j2
> IP: {{tu_ip}}
> Distribución: {{tu_distro}}
> Cantidad de Cores: {{cores}}
> EOF

echo "Agrego las tareas al rol: "
vim roles/2do_parcial/tasks/main.yml

- name: Crear estructura de directorios
  become: true
  vars:
    ansible_become_pass: "pass"
  file:
    path: "{{ item }}"
    state: directory
    mode: '0755'
  with_items:
    - "/tmp/2do_parcial/alumno"
    - "/tmp/2do_parcial/equipo"

- name: Generar datos_alumno.txt
  become: true
  vars:
    ansible_become_pass: "pass"
    tu_nombre: "Esteban Oscar"
    tu_apellido: "Ferreira"
    tu_division: "311"
  template:
    src: template_a.j2
    dest: "/tmp/2do_parcial/alumno/datos_alumno.txt"

- name: Generar datos_equipo.txt
  become: true
  vars:
    ansible_become_pass: "pass"
    tu_ip: "192.168.56.3"
    tu_distro: "Ubuntu 22.04.5 LTS"
    cores: "2"
  template:
    src: template_b.j2
    dest: "/tmp/2do_parcial/equipo/datos_equipo.txt"

- name: Agregar grupo 2PSupervisores a sudoers
  become: true
  vars:
    ansible_become_pass: "pass"
  lineinfile:
    path: /etc/sudoers
    regexp: '^%2PSupervisores'
    line: '%2PSupervisores ALL=(ALL:ALL) NOPASSWD: ALL'
    insertafter: '^# Allow members of group sudo to execute any command'
    validate: 'visudo -cf %s'

echo "Ejecuto el playbook: "
ansible-playbook -i inventory playbook.yml

echo "Verifico que se hayan creado los directorios y archivos: "
tree /tmp

echo "Verifico el contenido de los archivos: "
cat /tmp/2do_parcial/alumno/datos_alumno.txt
cat /tmp/2do_parcial/equipo/datos_equipo.txt

echo "Verifico que el grupo 2PSupervisores no requiere sudoers: "
su - 2P_202406_Supervisor
sudo cat /etc/sudoers
