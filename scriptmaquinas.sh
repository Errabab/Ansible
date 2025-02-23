#!/bin/bash

clear

#Para actualizar los repositorios antes de las instalaciones necesarias
apt update -y 

#instalar ssh 
apt install ssh -y

#instalar python 
apt install python3 -y 

# Instalar sudo
apt install sudo -y 

# Archivo sudoers
SUDOERS_FILE="/etc/sudoers"

# Línea a agregar
USER_LINE="usuario ALL=(ALL:ALL) NOPASSWD:ALL"

# Añadir la línea al final del archivo sudoers
echo "$USER_LINE" | sudo tee -a "$SUDOERS_FILE" > /dev/null
