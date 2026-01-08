#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

volver_menu() {
    echo -e "\n${YELLOW}Presiona Enter para volver al menú principal...${NC}"
    read
}

show_menu() {
    clear
    echo -e "${PURPLE}"
    echo "  __  __ _                      _            _  _______  "
    echo "  \ \/ /(_) __ _  ___  _ __ ___ (_)_   _ __  | |/ /  _  \ "
    echo "   \  / | |/ _' |/ _ \| '_ ' _ \| | | | | | | | ' /| |_) | "
    echo "   /  \ | | (_| | (_) | | | | | | | |_| | |_| | . \|  __/  "
    echo "  /_/\_\|_|\__,_|\___/|_| |_| |_|_|\__,_|\__,_|_|\_\_|     "
    echo -e "${NC}"
    echo -e "${CYAN}=======================================================${NC}"
    echo -e "${YELLOW} Creado por: ${GREEN}@AntiKripis${NC}"
    echo -e "${CYAN}=======================================================${NC}"
    echo -e "1.  ${GREEN}Debloat Automático${NC} (Eliminar basura)"
    echo -e "2.  ${GREEN}Modo Anti-Lag${NC} (Optimizar RAM)"
    echo -e "3.  ${GREEN}Instalar Herramientas MTK${NC}"
    echo -e "4.  ${GREEN}Verificar Estado del Bootloader${NC}"
    echo -e "5.  ${RED}Submenú de Reinicio${NC}"
    echo -e "6.  Salir"
    echo -e "${CYAN}=======================================================${NC}"
}

while true; do
    show_menu
    read -p "Selecciona una opción: " opcion
    case $opcion in
        1) echo -e "${YELLOW}Limpiando MIUI...${NC}"
           adb shell pm uninstall -k --user 0 com.miui.analytics
           adb shell pm uninstall -k --user 0 com.miui.msa.global
           echo -e "${GREEN}Hecho.${NC}"; volver_menu ;;
        2) echo -e "${YELLOW}Optimizando...${NC}"
           adb shell settings put global adaptive_battery_management_enabled 1
           echo -e "${GREEN}Hecho.${NC}"; volver_menu ;;
        3) pkg install python-pip -y && pip install mtkclient; volver_menu ;;
        4) fastboot getvar unlocked; volver_menu ;;
        5) clear
           echo -e "1. Fastboot | 2. Recovery | 3. EDL | 0. Volver"
           read -p ">> " r_opt
           [ "$r_opt" == "1" ] && adb reboot bootloader
           [ "$r_opt" == "2" ] && adb reboot recovery
           [ "$r_opt" == "3" ] && adb reboot edl ;;
        6) echo "¡Adiós!"; break ;;
        *) echo "Inválido"; sleep 1 ;;
    esac
done
