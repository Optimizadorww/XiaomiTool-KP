#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Función de Auto-Actualización
actualizar() {
    echo -e "${YELLOW}[!] Comprobando actualizaciones...${NC}"
    remote_hash=$(curl -sL https://raw.githubusercontent.com/Optimizadorww/XiaomiTool-KP/main/XiaomiTool.sh | md5sum)
    local_hash=$(md5sum $0)
    
    if [ "$remote_hash" != "$local_hash
