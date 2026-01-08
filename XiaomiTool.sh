#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

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
    echo -e "${GREEN} 1.${NC} Debloat Automático"
    echo -e "${GREEN} 2.${NC} Quitar FRP (Fastboot)"
    echo -e "${GREEN} 3.${NC} Mi Unlock (Desbloquear Bootloader)"
    echo -e "${GREEN} 4.${NC} Reinicios (Submenú)"
    echo -e "${RED} 5. Salir${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    read -p " >> Selecciona una opción: " opt

    case $opt in
        1) clear
           echo -e "${YELLOW}[!] Verificando conexión ADB...${NC}"
           adb start-server > /dev/null 2>&1
           if [[ $(adb devices | wc -l) -lt 3 ]]; then
               echo -e "${RED}[✘] ERROR: No hay dispositivos conectados.${NC}"
           else
               echo -e "${GREEN}[✔] Dispositivo detectado.${NC}"
               adb shell pm uninstall -k --user 0 com.miui.analytics
               adb shell pm uninstall -k --user 0 com.miui.msa.global
               echo -e "${GREEN}[✔] Hecho.${NC}"
           fi
           volver ;;
        2) clear
           echo -e "${YELLOW}[!] Buscando modo Fastboot...${NC}"
           fb_dev=$(fastboot devices | awk '{print $1}' | head -n 1)
           if [ -z "$fb_dev" ]; then
               echo -e "${RED}[✘] ERROR: Dispositivo no detectado.${NC}"
           else
               echo -e "${GREEN}[✔] Detectado: $fb_dev${NC}"
               fastboot erase config
               fastboot erase frp
               echo -e "${GREEN}[✔] FRP Eliminado.${NC}"
           fi
           volver ;;
        3) clear
           echo -e "${YELLOW}[!] Verificando Mi Unlock...${NC}"
           dispositivo=$(fastboot devices | awk '{print $1}' | head -n 1)
           if [ -z "$dispositivo" ]; then
               echo -e "${RED}[✘] ERROR: No se encontró dispositivo conectado.${NC}"
               echo -e "1. Entra en modo FASTBOOT ${RED}(logo Fastboot)${NC}."
           else
               echo -e "${GREEN}[✔] Detectado: $dispositivo${NC}"
               fastboot getvar product; fastboot getvar token
               echo -e "${RED}⚠ Error: El servidor requiere validación manual (168h).${NC}"
           fi
           volver ;;
        4) clear
           echo -e "${YELLOW}" # Cambiado a Amarillo
           echo "--- OPCIONES DE REINICIO ---"
           echo " 1. Fastboot"
           echo " 2. Recovery"
           echo " 3. EDL (Qualcomm)"
           echo " 0. Volver"
           echo -e "${NC}" 
           read -p " >> Elija: " r
           if [ "$r" == "1" ]; then adb reboot bootloader; 
           elif [ "$r" == "2" ]; then adb reboot recovery; 
           elif [ "$r" == "3" ]; then adb reboot edl; 
           fi ;;
        5) exit ;;
    esac
done
