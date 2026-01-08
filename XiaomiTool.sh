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
    echo "  __  __ _                      _            _  _______  "
    echo "  \ \/ /(_) __ _  ___  _ __ ___ (_)_   _ __  | |/ /  _  \ "
    echo "   \  / | |/ _' |/ _ \| '_ ' _ \| | | | | | | | ' /| |_) | "
    echo "   /  \ | | (_| | (_) | | | | | | | |_| | |_| | . \|  __/  "
    echo "  /_/\_\|_|\__,_|\___/|_| |_| |_|_|\__,_|\__,_|_|\_\_|     "
    echo -e "${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW} Creado por: ${GREEN}@AntiKripis${NC} (XiaomiTool KP)"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e " 1. Debloat Automático     2. Modo Anti-Lag"
    echo -e " 3. Herramientas MTK       4. Estado Bootloader"
    echo -e " 5. Reinicios (Submenú)    6. Salir"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    read -p " >> Selecciona: " opt

    case $opt in
        1) echo -e "${Y}Limpiando sistema...${NC}"
           adb shell pm uninstall -k --user 0 com.miui.analytics
           adb shell pm uninstall -k --user 0 com.miui.msa.global
           echo -e "${GREEN}Hecho.${NC}"; volver ;;
        2) echo -e "${Y}Optimizando RAM...${NC}"
           adb shell settings put global adaptive_battery_management_enabled 1
           echo -e "${GREEN}Optimizado.${NC}"; volver ;;
        3) echo -e "${Y}Instalando MTK Client...${NC}"
           pip install mtkclient; volver ;;
        4) fastboot getvar unlocked; volver ;;
        5) clear
           echo -e "${PURPLE}--- REINICIOS ---${NC}"
           echo "1. Fastboot | 2. Recovery | 3. EDL | 0. Volver"
           read -p ">> " r
           if [ "$r" == "1" ]; then adb reboot bootloader; elif [ "$r" == "2" ]; then adb reboot recovery; elif [ "$r" == "3" ]; then adb reboot edl; fi ;;
        6) echo -e "${CYAN}¡Adiós @AntiKripis!${NC}"; exit ;;
        *) echo -e "${RED}Error.${NC}"; sleep 1 ;;
    esac
done
