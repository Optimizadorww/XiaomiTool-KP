#!/data/data/com.termux/files/usr/bin/bash

# Colores
G='\033[0;32m'
B='\033[0;34m'
Y='\033[1;33m'
C='\033[0;36m'
NC='\033[0m'

clear
echo -e "${B}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${C}                XIAOMITOOL KP                        ${NC}"
echo -e "${Y}             By: @AntiKripis                         ${NC}"
echo -e "${B}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e "\n${G}[+]${NC} Configurando entorno..."
mkdir -p $HOME/XiaomiTool
cd $HOME/XiaomiTool

echo -e "${G}[+]${NC} Descargando archivos..."
curl -sL https://raw.githubusercontent.com/Optimizadorww/XiaomiTool-KP/main/XiaomiTool.sh -o XiaomiTool

echo -e "${G}[+]${NC} Aplicando permisos de sistema..."
chmod 777 XiaomiTool
cp XiaomiTool $PREFIX/bin/XiaomiTool
chmod +x $PREFIX/bin/XiaomiTool

echo -e "\n${G}¡Instalación completa!${NC}"
echo -e "Escribe ${Y}XiaomiTool${NC} para empezar."
echo -e "${B}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
