#!/data/data/com.termux/files/usr/bin/bash

echo -e "\e[32mInstalando XiaomiTool-KP de @AntiKripis...\e[0m"

# Instalar dependencias necesarias
pkg update && pkg upgrade -y
pkg install android-tools curl python -y

# Descargar el script principal y meterlo en el sistema
# NOTA: Cambia 'TU_USER' por tu nombre real de GitHub abajo
curl -sL https://raw.githubusercontent.com/TU_USER/XiaomiTool-KP/main/XiaomiTool.sh -o $PREFIX/bin/XiaomiTool-KP

# DAR TODOS LOS PERMISOS (Lectura, Escritura, Ejecución)
chmod 777 $PREFIX/bin/XiaomiTool-KP

echo -e "\e[36m--------------------------------------------------\e[0m"
echo -e "\e[32m¡INSTALACIÓN COMPLETADA CON ÉXITO!\e[0m"
echo -e "Ya puedes usar la herramienta escribiendo: \e[33mXiaomiTool-KP\e[0m"
echo -e "\e[36m--------------------------------------------------\e[0m"
