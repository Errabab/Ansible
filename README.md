# Estudio del módulo Ansible: `package`

## Introducción a Ansible

![h](img/ansible.png)

Ansible es una herramienta de automatización de configuración y gestión de sistemas que permite administrar servidores de manera eficiente y sin agentes. Funciona utilizando SSH para conectarse a los nodos y ejecutar tareas definidas en playbooks escritos en YAML. Su sintaxis simple y su capacidad de trabajar en múltiples sistemas operativos lo hacen una opción ideal para la automatización de tareas repetitivas en entornos de TI.

## **1. Nombre del módulo**

### Módulo: `ansible.builtin.package`

El módulo `package` se utiliza para administrar paquetes en sistemas Linux de manera agnóstica al gestor de paquetes. Es compatible con `apt`, `yum`, `dnf`, `zypper` y otros, lo que lo hace útil para entornos heterogéneos.

 **Parámetros**

| Parámetro   | Descripción |
|------------|-------------|
| `name` | Nombre del paquete o lista de paquetes a instalar, actualizar o eliminar. |
| `state` | Estado deseado del paquete: `present`, `latest` o `absent`. |
| `use` | Especifica el gestor de paquetes a utilizar (`apt`, `yum`, `dnf`, etc.). |

 **Estados admitidos**

 **`present`**: Asegura que el paquete esté instalado.
- **`latest`**: Instala o actualiza el paquete a la última versión disponible.
- **`absent`**: Elimina el paquete del sistema.

## **2. Ejemplos de funcionamiento**

### Ejemplo 1: Instalación de un paquete

Este playbook instala el paquete `htop` en cualquier distribución de Linux sin necesidad de especificar el gestor de paquetes.

```yaml
- name: Instalar htop
  hosts: servidores
  become: yes
  tasks:
    - name: Instalar el paquete htop
      ansible.builtin.package:
        name: htop
        state: present
```

**Captura del playbook:**  
![Playbook Instalación](./imagenes/playbook_instalacion.png)

**Captura del resultado:**  
![Resultado Instalación](./imagenes/resultado_instalacion.png)

---

### Ejemplo 2: Actualización de un paquete

Este playbook actualiza el paquete `nano` en cualquier sistema Linux.

```yaml
- name: Actualizar nano
  hosts: servidores
  become: yes
  tasks:
    - name: Actualizar el paquete nano
      ansible.builtin.package:
        name: nano
        state: latest
```

**Captura del playbook:**  
![Playbook Actualización](./imagenes/playbook_actualizacion.png)

**Captura del resultado:**  
![Resultado Actualización](./imagenes/resultado_actualizacion.png)

---

### Ejemplo 3: Eliminación de un paquete

Este playbook elimina el paquete `apache2` o `httpd`, dependiendo de la distribución.

```yaml
- name: Eliminar Apache
  hosts: servidores
  become: yes
  tasks:
    - name: Desinstalar Apache
      ansible.builtin.package:
        name: apache2
        state: absent
```

**Captura del playbook:**  
![Playbook Eliminación](./imagenes/playbook_eliminacion.png)

**Captura del resultado:**  
![Resultado Eliminación](./imagenes/resultado_eliminacion.png)

## **3. Referencias**

- Documentación oficial de Ansible: [https://docs.ansible.com/ansible/latest/collections/ansible/builtin/package_module.html](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/package_module.html)

