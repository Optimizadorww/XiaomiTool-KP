#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

volver() {
    echo -e "\n${YELLOW}➡ Pulsa Enter para volver...${NC}"
    read
}

while true; do
    clear
    echo -e "${PURPLE}"
    echo "  __  __ _                          _            _ "
    echo "  \ \/ /(_) __ _  ___  _ __ ___ (_) |_ ___   ___ | |"
    echo "   \  / | |/ _' |/ _ \| '_ ' _ \| | __/ _ \ / _ \| |"
    echo "   /  \ | | (_| | (_) | | | | | | | |_ (_) | (_) | |"
    echo "  /_/\_\|_|\__,_|\___/|_| |_| |_|_|\__\___/ \___/|_|"
    echo -e "                ${CYAN}T  O  O  L${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW} Creado por: ${GREEN}@AntiKripis${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN} 1.${NC} Debloat Automático (Quitar Basura)"
    echo -e "${GREEN} 2.${NC} Modo Anti-Lag (Optimizar RAM)"
    echo -e "${GREEN} 3.${NC} Herramientas MTK"
    echo -e "${GREEN} 4.${NC} Reinicios (Submenú)"
    echo -e "${RED} 5. Salir${NC}"
    echo -e "${CY
