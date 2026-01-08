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
    echo -e "${GREEN} 1.${NC} Debloat Automático"
    echo -e "${GREEN} 2.${NC} Modo Anti-Lag"
    echo -e "${GREEN} 3.${NC} Herramientas MTK"
    echo -e "${GREEN} 4.${NC} Estado Bootloader"
    echo -e "${GREEN} 5.${NC} Reinicios (Submenú)"
    echo -e "${RED} 6. Salir${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    read -p " >> Selecciona una opción: " opt

    case $opt in
        1) echo -e "${YELLOW}Limpiando aplicaciones innecesarias...${NC}"
           adb shell pm uninstall -k --user 0 com.miui.analytics
           adb shell pm uninstall -k --user 0 com.miui.msa.global
           echo -e "${GREEN}Proceso terminado.${NC}"; volver ;;
        2) echo -e "${YELLOW}Optimizando memoria RAM...${NC}"
           adb shell settings put global adaptive_battery_management_enabled 1
           echo -e "${GREEN}Optimizado.${NC}"; volver ;;
        3) echo -e "${YELLOW}Instalando MTK Client...${NC}"
           pip install mtkclient; volver ;;
        4) echo -e "${CYAN}Verificando Bootloader...${NC}"
           fastboot getvar unlocked; volver ;;
        5) clear
           echo -e "${PURPLE}--- OPCIONES DE REINICIO ---${NC}"
           echo -e "${GREEN} 1.${NC} Fastboot"
           echo -e "${GREEN} 2.${NC} Recovery"
           echo -e "${GREEN} 3.${NC} EDL (Qualcomm)"
           echo -e "${RED} 0. Volver${NC}"
           read -p " >> Elija: " r
           if [ "$r" == "1" ]; then adb reboot bootloader; elif [ "$r" == "2" ]; then adb reboot recovery; elif [ "$r" == "3" ]; then adb reboot edl; fi ;;
        6) echo -e "${CYAN}¡Saliendo! By: @AntiKripis${NC}"; exit ;;
        *) echo -e "${RED}Error: Opción no válida.${NC}"; sleep 1 ;;
    esac
done
