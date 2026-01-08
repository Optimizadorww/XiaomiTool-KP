#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

check_tools() {
    if ! command -v fastboot &> /dev/null || ! command -v adb &> /dev/null; then
        echo -e "${YELLOW}[!] Platform Tools no detectadas. Instalando...${NC}"
        pkg update && pkg upgrade -y
        pkg install android-tools -y
    fi
}

actualizar() {
    echo -e "${YELLOW}[!] Verificando actualizaciones...${NC}"
    remote_hash=$(curl -sL https://raw.githubusercontent.com/Optimizadorww/XiaomiTool-KP/main/XiaomiTool.sh | md5sum | awk '{print $1}')
    local_hash=$(md5sum $0 | awk '{print $1}')
    
    if [ "$remote_hash" != "$local_hash" ]; then
        echo -e "${RED}[!] Nueva versión detectada. Reinstalando...${NC}"
        cd $HOME && rm -rf XiaomiTool && rm -f $PREFIX/bin/XiaomiTool
