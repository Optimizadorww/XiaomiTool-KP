#!/data/data/com.termux/files/usr/bin/bash

# Cores
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
    echo -e "${GREEN} 4.${NC} Desbloquear Bootloader (MTK Bypass)"
    echo -e "${GREEN} 5.${NC} Desbloquear Bootloader (Método Oficial)"
    echo -e "${GREEN} 6.${NC} Reinicios (Submenú)"
    echo -e "${RED} 7. Salir${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    read -p " >> Selecciona unha opción: " opt

    case $opt in
        1) echo -e "${YELLOW}Limpando sistema...${NC}"
           adb shell pm uninstall -k --user 0 com.miui.analytics
           adb shell pm uninstall -k --user 0 com.miui.msa.global
           echo -e "${GREEN}Feito.${NC}"; volver ;;
        2) echo -e "${YELLOW}Optimizando RAM...${NC}"
           adb shell settings put global adaptive_battery_management_enabled 1
           echo -e "${GREEN}Optimizado.${NC}"; volver ;;
        3) echo -e "${YELLOW}Instalando MTK Client...${NC}"
           pip install mtkclient; volver ;;
        4) echo -e "${CYAN}Comando recomendado para MTK (Modo BROM):${NC}"
           echo -e "${GREEN}python3 mtk bt_unlock${NC}"
           volver ;;
        5) echo -e "${RED}⚠ MÉTODO OFICIAL XIAOMI:${NC}"
           echo -e "1. Activa o 'Desbloqueo OEM' e 'Depuración USB' no móbil."
           echo -e "2. Vincula a túa Conta Mi en 'Estado de Mi Unlock'."
           echo -e "3. Descarga 'Mi Unlock Tool' no teu PC."
           echo -e "4. Agarda o tempo indicado (normalmente 168h)."
           echo -e "${YELLOW}Este proceso non se pode facer directamente desde Termux.${NC}"
           volver ;;
        6) clear
           echo -e "${PURPLE}--- REINICIOS ---${NC}"
           echo "1. Fastboot | 2. Recovery | 3. EDL | 0. Volver"
           read -p ">> " r
           if [ "$r" == "1" ]; then adb reboot bootloader; elif [ "$r" == "2" ]; then adb reboot recovery; elif [ "$r" == "3" ]; then adb reboot edl; fi ;;
        7) echo -e "${CYAN}¡Adeus @AntiKripis!${NC}"; exit ;;
        *) echo -e "${RED}Error.${NC}"; sleep 1 ;;
    esac
done
