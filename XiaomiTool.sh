#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

volver_menu() {
    echo -e "\n${YELLOW}Presiona Enter para volver...${NC}"
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
    echo -e "${CYAN}=======================================================${NC}"
    echo -e "${YELLOW} Creado por: ${GREEN}@AntiKripis${NC} (XiaomiTool KP)"
    echo -e "${CYAN}=======================================================${NC}"
    echo -e "1. Debloat | 2. Anti-Lag | 3. MTK Tools | 4. Bootloader | 5. Reboot | 6. Salir"
    read -p "Selecciona: " opcion
    case $opcion in
        1) adb shell pm uninstall -k --user 0 com.miui.analytics; echo "Hecho"; volver_menu ;;
        2) adb shell settings put global adaptive_battery_management_enabled 1; echo "Optimizado"; volver_menu ;;
        3) pkg install python-pip -y && pip install mtkclient; volver_menu ;;
        4) fastboot getvar unlocked; volver_menu ;;
        5) echo "1.Fastboot 2.Recovery"; read r; [ "$r" == "1" ] && adb reboot bootloader || adb reboot recovery ;;
        6) exit ;;
        *) echo "Error"; sleep 1 ;;
    esac
done
