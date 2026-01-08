#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
NC='\033[0m'

# Instalación automática de dependencias
instalar_herramientas() {
    if ! command -v fastboot &> /dev/null || ! command -v adb &> /dev/null; then
        echo -e "${YELLOW}[!] Instalando Platform Tools...${NC}"
        pkg update && pkg upgrade -y
        pkg install android-tools curl -y
    fi
}

# Auto-reinstalación desde GitHub
actualizar() {
    echo -e "${YELLOW}[!] Verificando actualizaciones en GitHub...${NC}"
    REMOTE_URL="https://raw.githubusercontent.com/Optimizadorww/XiaomiTool-KP/main/XiaomiTool.sh"
    REMOTE_HASH=$(curl -sL "$REMOTE_URL" | md5sum | awk '{print $1}')
    LOCAL_HASH=$(md5sum "$0" | awk '{print $1}')

    if [ "$REMOTE_HASH" != "$LOCAL_HASH" ] && [ ! -z "$REMOTE_HASH" ]; then
        echo -e "${RED}[!] Nueva versión detectada. Reinstalando...${NC}"
        cd $HOME
        rm -rf XiaomiTool
        rm -f $PREFIX/bin/XiaomiTool
        curl -sL https://raw.githubusercontent.com/Optimizadorww/XiaomiTool-KP/main/install.sh -o install.sh
        chmod +x install.sh
        ./install.sh
        exit
    fi
}

volver() {
    echo -e "\n${YELLOW}➡ Pulsa Enter para volver al menú...${NC}"
    read
}

instalar_herramientas
actualizar

while true; do
    clear
    echo -e "${PURPLE}"
    echo "  __  __ _                          _            _ "
    echo "  \ \/ /(_) __ _  ___  _ __ ___ (_) |_ ___   ___ | |"
    echo "   \  / | |/ _' |/ _ \| '_ ' _ \| | __/ _ \ / _ \| |"
    echo "   /  \ | | (_| | (_) | | | | | | | |_ (_) | (_) | |"
    echo "  /_/\_\|_|\__,_|\___/|_| |_| |_|_|\__\___/ \___/|_|"
    # CAMBIO AQUÍ: Eliminada palabra Tool repetida por versión v3.0
    echo -e "                ${CYAN}v 3 . 0${NC}"
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
               adb shell pm uninstall -k --user 0 com.miui.analytics
               adb shell pm uninstall -k --user 0 com.miui.msa.global
               echo -e "${GREEN}[✔] Debloat completado.${NC}"
           fi
           volver ;;
        2) clear
           fb_dev=$(fastboot devices | awk '{print $1}' | head -n 1)
           if [ -z "$fb_dev" ]; then
               echo -e "${RED}[✘] ERROR: Conecta el móvil en Fastboot.${NC}"
           else
               fastboot erase config
               fastboot erase frp
               echo -e "${GREEN}[✔] FRP Eliminado.${NC}"
           fi
           volver ;;
        3) clear
           dispositivo=$(fastboot devices | awk '{print $1}' | head -n 1)
           if [ -z "$dispositivo" ]; then
               echo -e "${RED}[✘] ERROR: No se encontró dispositivo conectado.${NC}"
               echo -e "1. Entra en modo FASTBOOT ${RED}(logo Fastboot)${NC}."
           else
               fastboot getvar product; fastboot getvar token
               echo -e "${RED}⚠ Error: El servidor requiere 168h de espera.${NC}"
           fi
           volver ;;
        4) clear
           # CAMBIO AQUÍ: Título en AZUL, opciones en AMARILLO
           echo -e "${BLUE}--- OPCIONES DE REINICIO ---${NC}"
           echo -e "${YELLOW}1. Fastboot"
           echo "2. Recovery"
           echo "3. EDL (Qualcomm)"
           echo -e "0. Volver${NC}"
           echo ""
           read -p "$(echo -e "${BLUE} >> Elija: ${NC}")" r
           if [ "$r" == "1" ]; then adb reboot bootloader; 
           elif [ "$r" == "2" ]; then adb reboot recovery; 
           elif [ "$r" == "3" ]; then adb reboot edl; 
           fi ;;
        5) exit ;;
    esac
done
