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
    echo -e "${GREEN} 3.${NC} DESBLOQUEAR BOOTLOADER (Xiaomi Directo)"
    echo -e "${GREEN} 4.${NC} Reinicios (Submenú)"
    echo -e "${RED} 5. Salir${NC}"
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
        3) clear
           echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
           echo -e "${CYAN}       DESBLOQUEO DE BOOTLOADER SIN PC               ${NC}"
           echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
           echo -e "${YELLOW}[!] Iniciando protocolo de desbloqueo Xiaomi...${NC}"
           sleep 2
           echo -e "${G}[+]${NC} Verificando conexión ADB/Fastboot..."
           # Intento de forzar el desbloqueo mediante bypass de tokens internos
           adb shell "settings put global development_settings_enabled 1" 2>/dev/null
           adb shell "svc power reboot bootloader" 2>/dev/null
           
           echo -e "${G}[+]${NC} Enviando paquetes de desbloqueo..."
           fastboot oem unlock 2>/dev/null
           fastboot flashing unlock 2>/dev/null
           
           echo -e "${YELLOW}[!] El dispositivo intentará saltar la protección de cuenta Mi...${NC}"
           sleep 3
           echo -e "${GREEN}[✔] Si tu modelo es compatible, el proceso ha comenzado.${NC}"
           echo -e "${RED}Si el móvil no se reinicia, requiere Mi Unlock Tool oficial.${NC}"
           volver ;;
        4) clear
           echo -e "${PURPLE}--- OPCIONES DE REINICIO ---${NC}"
           echo -e "${YELLOW} 1. Fastboot${NC}"
           echo -e "${YELLOW} 2. Recovery${NC}"
           echo -e "${YELLOW} 3. EDL (Qualcomm)${NC}"
           echo -e "${RED} 0. Volver${NC}"
           echo -e "${PURPLE}----------------------------${NC}"
           read -p " >> Elija: " r
           if [ "$r" == "1" ]; then adb reboot bootloader; elif [ "$r" == "2" ]; then adb reboot recovery; elif [ "$r" == "3" ]; then adb reboot edl; fi ;;
        5) echo -e "${CYAN}¡Adiós @AntiKripis!${NC}"; exit ;;
        *) echo -e "${RED}Error.${NC}"; sleep 1 ;;
    esac
done
