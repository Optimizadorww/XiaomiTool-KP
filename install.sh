#!/data/data/com.termux/files/usr/bin/bash

echo -e "\033[0;32mInstalando XiaomiTool KP de @AntiKripis...\033[0m"

# Dar permisos de almacenamiento a Termux
termux-setup-storage

# Instalar dependencias necesarias
pkg update && pkg upgrade -y
pkg install android-tools git python wget -y

# Descargar el script principal desde tu repo
# REEMPLAZA TU_USER Y TU_REPO con tus datos reales de GitHub
curl -sL https://raw.githubusercontent.com/TU_USER/TU_REPO/main/XiaomiTool.sh -o XiaomiTool.sh

# DAR TODOS LOS PERMISOS
chmod 777 XiaomiTool.sh

# Mover a la carpeta de ejecución global
mv XiaomiTool.sh $PREFIX/bin/XiaomiTool
chmod +x $PREFIX/bin/XiaomiTool

echo -e "\033[0;36m--------------------------------------------------\033[0m"
echo -e "\033[0;32m¡TODO LISTO Y CON PERMISOS!\033[0m"
echo -e "Ahora solo escribe: \033[1;33mXiaomiTool\033[0m"
echo -e "\033[0;36m--------------------------------------------------\033[0m"

