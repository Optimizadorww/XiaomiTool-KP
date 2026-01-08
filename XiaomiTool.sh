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

actualizar() {
    echo -e "${YELLOW}[!] Verificando actualizaciones...${NC}"
    if curl -s -m 5 https://google.com > /dev/null; then
        remote_hash=$(curl -sL https://raw.githubusercontent.com/Optimizadorww/XiaomiTool-KP/main/XiaomiTool.sh | md5sum | awk '{print $1}')
        local_hash=$(md5sum "$0" | awk '{print $1}')
        if [ "$remote_hash" != "$local_hash" ]; then
            echo -e "${RED}[!] Nueva versión detectada. Reinstalando...${NC}"
            cd "$HOME" && rm -rf XiaomiTool && rm -f "$PREFIX/bin/XiaomiTool"
            curl -sL https://raw.githubusercontent.com/Optimizadorww/XiaomiTool-KP/main/install.sh -o install.sh
            chmod +x install.sh && ./install.sh
            exit
        fi
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
    echo -e "                ${CYAN}T  O  O  L${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW} Creado por: ${GREEN}@AntiKripis${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN} 1.${NC} Debloat Automático"
    echo -e "${GREEN} 2.${NC} Modo Anti-Lag"
    echo -e "${GREEN} 3.${NC} Mi Unlock (Desbloquear Bootloader)"
    echo -e "${GREEN} 4.${NC} Reinicios (Submenú)"
    echo -e "${RED} 5. Salir${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    read -p " >> Selecciona una opción: " opt

    case $opt in
        1) clear
           echo -e "${YELLOW}[!] Verificando conexión ADB...${NC}"
           # Detección simplificada
           if [[ $(adb devices | wc -l) -lt 3 ]]; then
               echo -e "${RED}[✘] ERROR: No hay dispositivos conectados.${NC}"
               echo -e "${YELLOW}───────────────────────────────────────────${NC}"
               echo -e "1. Activa Depuración USB."
               echo -e "2. Conecta el cable y acepta el permiso."
               echo -e "${YELLOW}───────────────────────────────────────────${NC}"
           else
               echo -e "${GREEN}[✔] Dispositivo detectado.${NC}"
               echo -e "${CYAN}[+] Eliminando basura de MIUI...${NC}"
               adb shell pm uninstall -k --user 0 com.miui.analytics
               adb shell pm uninstall -k --user 0 com.miui.msa.global
               echo -e "${GREEN}[✔] Proceso terminado.${NC}"
           fi
           volver ;;
        3) clear
           echo -e "${YELLOW}[!] Buscando modo Fastboot...${NC}"
           dispositivo=$(fastboot devices | awk '{print $1}' | head -n 1)
           if [[ -z "$dispositivo" ]]; then
               echo -e "${RED}[✘] ERROR: No se encontró dispositivo.${NC}"
               echo -e "1. Entra en FASTBOOT ${RED}(logo Fastboot)${NC}."
               echo -e "2. Usa cable OTG y: ${CYAN}termux-usb -l${NC}"
           else
               echo -e "${GREEN}[✔] Detectado: $dispositivo${NC}"
               fastboot getvar product; fastboot getvar token
               echo -e "${RED}⚠ Error: Espera 168h de Xiaomi.${NC}"
           fi
           volver ;;
        4) clear
           echo -e "${PURPLE}--- OPCIONES DE REINICIO ---${NC}"
           echo -e "${YELLOW} 1. Fastboot | 2. Recovery | 3. EDL${NC}"
           read -p " >> Elija: " r
           if [ "$r" == "1" ]; then adb reboot bootloader; elif [ "$r" == "2" ]; then adb reboot recovery; elif [ "$r" == "3" ]; then adb reboot edl; fi
           volver ;;
        5) exit ;;
        *) sleep 1 ;;
    esac
done
