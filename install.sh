#!/data/data/com.termux/files/usr/bin/bash

echo -e "\e[32mIniciando instalación de XiaomiTool-KP...\e[0m"

# Crear carpeta y entrar (CD)
mkdir -p $HOME/XiaomiTool-KP
cd $HOME/XiaomiTool-KP

# Descargar el script usando CURL
# REEMPLAZA "TU_USER" con tu usuario de GitHub
curl -sL https://raw.githubusercontent.com/TU_USER/XiaomiTool-KP/main/XiaomiTool.sh -o XiaomiTool-KP

# Dar todos los permisos
chmod 777 XiaomiTool-KP

# Hacerlo comando global
cp XiaomiTool-KP $PREFIX/bin/
chmod +x $PREFIX/bin/XiaomiTool-KP

echo -e "\e[32mInstalación terminada. Escribe 'XiaomiTool-KP' para iniciar.\e[0m"
