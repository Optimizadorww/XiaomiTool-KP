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
    echo -e "${GREEN} 1.${NC} Debloat Automático"
    echo -e "${GREEN} 2.${NC} Modo Anti-Lag"
    echo -e "${GREEN} 3.${NC} Herramientas MTK"
    echo -e "${GREEN} 4.${NC} Desbloquear Bootloader (Fastboot)"
    echo -e "${GREEN} 5.${NC} Reinicios (Submenú)"
    echo -e "${RED} 6. Salir${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    read -p " >> Selecciona una opción: " opt

    case $opt in
        1) echo -e "${YELLOW}Limpiando sistema...${NC}"
           adb shell pm uninstall -k --user 0 com.miui.analytics
           adb shell pm uninstall -k --user 0 com.miui.msa.global
           echo -e "${GREEN}Hecho.${NC}"; volver ;;
        2) echo -e "${YELLOW}Optimizando RAM...${NC}"
           adb shell settings put global adaptive_battery_management_enabled 1
           echo -e "${GREEN}Optimizado.${NC}"; volver ;;
        3) echo -e "${YELLOW}Instalando MTK Client...${NC}"
           pip install mtkclient; volver ;;
        4) echo -e "${RED}⚠ ADVERTENCIA: El dispositivo debe estar en modo Fastboot.${NC}"
           echo -e "${YELLOW}Intentando desbloqueo oem...${NC}"
           fastboot oem unlock
           fastboot flashing unlock
           echo -e "${CYAN}Si el dispositivo no es antiguo, usa la herramienta oficial Mi Unlock.${NC}"
           volver ;;
        5) clear
           echo -e "${PURPLE}--- OPCIONES DE REINICIO ---${NC}"
           echo "1. Fastboot | 2. Recovery | 3. EDL | 0. Volver"
           read -p ">> " r
           if [ "$r" == "1" ]; then adb reboot bootloader; elif [ "$r" == "2" ]; then adb reboot recovery; elif [ "$r" == "3" ]; then adb reboot edl; fi ;;
        6) echo -e "${CYAN}¡Adiós @AntiKripis!${NC}"; exit ;;
        *) echo -e "${RED}Error.${NC}"; sleep 1 ;;
    esac
done
