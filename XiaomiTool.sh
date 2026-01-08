#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Función para instalar herramientas automáticamente
instalar_herramientas() {
    if ! command -v fastboot &> /dev/null || ! command -v adb &> /dev/null; then
        echo -e "${YELLOW}[!] Herramientas no encontradas. Instalando Platform Tools...${NC}"
        pkg update && pkg upgrade -y
        pkg install android-tools curl -y
    fi
}

# Función de actualización obligatoria
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

# Ejecutar procesos internos
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
           echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
           echo -e "${YELLOW}             DEBLOAT AUTOMÁTICO - XIAOMI             ${NC}"
           echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
           echo -e "${YELLOW}[!] Verificando conexión ADB...${NC}"
           adb_dev=$(adb devices | grep -v "List" | awk '{print $1}' | head -n 1)
           if [[ -z "$adb_dev" ]]; then
               echo -e "${RED}[✘] ERROR: No se detectó ningún dispositivo vía ADB.${NC}"
               echo -e "${YELLOW}───────────────────────────────────────────────────────${NC}"
               echo -e "1. Activa la Depuración USB en tu móvil."
               echo -e "2. Conecta el cable y acepta el permiso en la pantalla."
               echo -e "3. Asegúrate de que el móvil esté encendido normalmente."
               echo -e "${YELLOW}───────────────────────────────────────────────────────${NC}"
           else
               echo -e "${GREEN}[✔] DISPOSITIVO DETECTADO:${NC} ${YELLOW}$adb_dev${NC}"
               echo -e "${CYAN}[+] Eliminando aplicaciones basura...${NC}"
               adb shell pm uninstall -k --user 0 com.miui.analytics
               adb shell pm uninstall -k --user 0 com.miui.msa.global
               echo -e "${GREEN}[✔] Debloat completado.${NC}"
           fi
           volver ;;
        3) clear
           echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
           echo -e "${CYAN}             MI UNLOCK PROTOCOL - XIAOMI             ${NC}"
           echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
           echo -e "${YELLOW}[!] Buscando dispositivos en modo Fastboot...${NC}"
           dispositivo=$(fastboot devices | cut -f1 | head -n 1)
           if [[ -z "$dispositivo" ]]; then
               echo -e "${RED}[✘] ERROR: No se encontró ningún dispositivo conectado.${NC}"
               echo -e "${YELLOW}───────────────────────────────────────────────────────${NC}"
               echo -e "1. Entra en modo FASTBOOT ${RED}(logo Fastboot)${NC}."
               echo -e "2. Conecta mediante cable OTG."
               echo -e "3. Autoriza el USB ejecutando: ${CYAN}termux-usb -l${NC}"
               echo -e "${YELLOW}───────────────────────────────────────────────────────${NC}"
           else
               echo -e "${GREEN}[✔] DISPOSITIVO DETECTADO:${NC} ${YELLOW}$dispositivo${NC}"
               fastboot getvar product; fastboot getvar token
               echo -e "${RED}⚠ Error: Requiere validación de Xiaomi (168h).${NC}"
           fi
           volver ;;
        4) clear
           echo -e "${PURPLE}--- OPCIONES DE REINICIO ---${NC}"
           echo -e "${YELLOW} 1. Fastboot${NC}"
           echo -e "${YELLOW} 2. Recovery${NC}"
           echo -e "${YELLOW} 3. EDL (Qualcomm)${NC}"
           echo -e "${RED} 0. Volver${NC}"
           read -p " >> Elija: " r
           if [ "$r" == "1" ]; then adb reboot bootloader; elif [ "$r" == "2" ]; then adb reboot recovery; elif [ "$r" == "3" ]; then adb reboot edl; fi ;;
        5) exit ;;
        *) sleep 1 ;;
    esac
done
