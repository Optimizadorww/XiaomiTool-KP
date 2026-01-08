#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Instalación automática de dependencias
instalar_herramientas() {
    if ! command -v fastboot &> /dev/null || ! command -v adb &> /dev/null; then
        echo -e "${YELLOW}[!] Instalando Platform Tools...${NC}"
        pkg update && pkg upgrade -y
        pkg install android-tools curl -y
    fi
}

volver() {
    echo -e "\n${YELLOW}➡ Pulsa Enter para volver al menú...${NC}"
    read
}

instalar_herramientas

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
    echo -e "${GREEN} 1.${NC} Debloat Automático (ADB)"
    echo -e "${GREEN} 2.${NC} Quitar FRP (Fastboot)"
    echo -e "${GREEN} 3.${NC} Mi Unlock (Bootloader)"
    echo -e "${GREEN} 4.${NC} Menú de Reinicios"
    echo -e "${RED} 5. Salir${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    read -p " >> Selecciona una opción: " opt

    case $opt in
        1) clear
           echo -e "${YELLOW}[!] Iniciando Debloat...${NC}"
           adb start-server > /dev/null 2>&1
           if [[ $(adb devices | wc -l) -lt 3 ]]; then
               echo -e "${RED}[✘] ERROR: No hay dispositivos ADB conectados.${NC}"
           else
               echo -e "${GREEN}[✔] Dispositivo detectado.${NC}"
               adb shell pm uninstall -k --user 0 com.miui.analytics
               adb shell pm uninstall -k --user 0 com.miui.msa.global
               echo -e "${GREEN}[✔] Aplicaciones eliminadas.${NC}"
           fi
           volver ;;
        2) clear
           echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
           echo -e "${YELLOW}               QUITAR FRP - FASTBOOT                ${NC}"
           echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
           echo -e "${YELLOW}[!] Buscando dispositivo en modo Fastboot...${NC}"
           fb_dev=$(fastboot devices | awk '{print $1}' | head -n 1)
           if [ -z "$fb_dev" ]; then
               echo -e "${RED}[✘] ERROR: Dispositivo no detectado.${NC}"
               echo -e "Entra en modo FASTBOOT ${RED}(logo Fastboot)${NC}."
           else
               echo -e "${GREEN}[✔] Detectado: $fb_dev${NC}"
               echo -e "${CYAN}[*] Intentando resetear partición config (FRP)...${NC}"
               fastboot erase config
               fastboot erase frp
               echo -e "${GREEN}[✔] Operación finalizada. Reinicia el móvil.${NC}"
           fi
           volver ;;
        3) clear
           echo -e "${YELLOW}[!] Verificando Mi Unlock...${NC}"
           dispositivo=$(fastboot devices | awk '{print $1}' | head -n 1)
           if [ -z "$dispositivo" ]; then
               echo -e "${RED}[✘] Error: Conecta en modo Fastboot.${NC}"
           else
               fastboot getvar product; fastboot getvar token
               echo -e "${RED}⚠ Error: Requiere tiempo de espera (168h).${NC}"
           fi
           volver ;;
        4) clear
           echo -e "${PURPLE}--- REINICIOS ---${NC}"
           echo -e "1. Fastboot | 2. Recovery | 3. Sistema"
           read -p ">> " r
           [ "$r" == "1" ] && adb reboot bootloader
           [ "$r" == "2" ] && adb reboot recovery
           [ "$r" == "3" ] && adb reboot
           volver ;;
        5) exit ;;
        *) sleep 1 ;;
    esac
done
