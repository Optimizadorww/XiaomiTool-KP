#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Función de Actualización con Borrado Total
actualizar() {
    echo -e "${YELLOW}[!] Verificando versión en GitHub...${NC}"
    # Obtenemos el hash del archivo remoto
    remote_hash=$(curl -sL https://raw.githubusercontent.com/Optimizadorww/XiaomiTool-KP/main/XiaomiTool.sh | md5sum | awk '{print $1}')
    # Obtenemos el hash del archivo local
    local_hash=$(md5sum $0 | awk '{print $1}')
    
    if [ "$remote_hash" != "$local_hash" ]; then
        echo -e "${RED}[!] Nueva versión detectada.${NC}"
        echo -e "${YELLOW}[*] Borrando versión antigua y reinstalando...${NC}"
        sleep 1
        # Lógica de borrado total
        cd $HOME
        rm -rf XiaomiTool
        rm -f $PREFIX/bin/XiaomiTool
        # Reinstalación limpia
        curl -sL https://raw.githubusercontent.com/Optimizadorww/XiaomiTool-KP/main/install.sh -o install.sh
        chmod +x install.sh
        ./install.sh
        echo -e "${GREEN}[✔] Herramienta actualizada con éxito.${NC}"
        # Ejecutamos la nueva versión y cerramos esta
        XiaomiTool
        exit
    else
        echo -e "${GREEN}[✔] Tienes la última versión.${NC}"
        sleep 1
    fi
}

volver() {
    echo -e "\n${YELLOW}➡ Pulsa Enter para volver...${NC}"
    read
}

# Ejecutar actualización forzada al abrir
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
        3) clear
           echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
           echo -e "${CYAN}             MI UNLOCK PROTOCOL - XIAOMI             ${NC}"
           echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
           echo -e "${YELLOW}[!] Buscando dispositivos en modo Fastboot...${NC}"
           
           # Detección mejorada
           dispositivo=$(fastboot devices | cut -f1 | head -n 1)

           if [[ -z "$dispositivo" ]]; then
               echo -e "${RED}[✘] ERROR: No se encontró ningún dispositivo conectado.${NC}"
               echo -e "${YELLOW}───────────────────────────────────────────────────────${NC}"
               echo -e "1. Entra en modo FASTBOOT (Logo conejo)."
               echo -e "2. Conecta cable OTG."
               echo -e "3. Ejecuta: ${CYAN}termux-usb -l${NC}"
               echo -e "${YELLOW}───────────────────────────────────────────────────────${NC}"
           else
               echo -e "${GREEN}[✔] DISPOSITIVO DETECTADO:${NC} ${YELLOW}$dispositivo${NC}"
               fastboot getvar product
               fastboot getvar token
               echo -e "${RED}⚠ Error: Requiere validación manual de Xiaomi.${NC}"
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
