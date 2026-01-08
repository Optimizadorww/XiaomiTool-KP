#!/data/data/com.termux/files/usr/bin/bash

# Colores
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Instalación de herramientas si faltan
if ! command -v fastboot &> /dev/null || ! command -v adb &> /dev/null; then
    echo -e "${YELLOW}[!] Instalando herramientas de Android...${NC}"
    pkg update && pkg upgrade -y
    pkg install android-tools curl -y
fi

actualizar() {
    # Solo actualiza si el usuario lo pide o si falta un archivo crítico
    if [ ! -f "$HOME/XiaomiTool/XiaomiTool.sh" ]; then
        echo -e "${YELLOW}[!] Configurando archivos por primera vez...${NC}"
        # Aquí puedes poner la lógica de descarga si fuera necesario
    fi
}

volver() {
    echo -e "\n${YELLOW}➡ Pulsa Enter para volver al menú...${NC}"
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
    echo -e "${GREEN} 3.${NC} Mi Unlock (Desbloquear Bootloader)"
    echo -e "${GREEN} 4.${NC} Reinicios (Submenú)"
    echo -e "${RED} 5. Salir${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    read -p " >> Selecciona una opción: " opt

    case $opt in
        1) clear
           echo -e "${YELLOW}[!] Verificando conexión ADB...${NC}"
           # Intenta despertar el servidor adb primero
           adb start-server > /dev/null 2>&1
           devices=$(adb devices | grep -v "List" | grep "device")
           if [ -z "$devices" ]; then
               echo -e "${RED}[✘] ERROR: No se detectó ningún dispositivo por ADB.${NC}"
               echo -e "1. Activa Depuración USB y acepta el permiso en pantalla."
           else
               echo -e "${GREEN}[✔] Dispositivo detectado.${NC}"
               adb shell pm uninstall -k --user 0 com.miui.analytics
               adb shell pm uninstall -k --user 0 com.miui.msa.global
               echo -e "${GREEN}[✔] Debloat realizado.${NC}"
           fi
           volver ;;
        3) clear
           echo -e "${YELLOW}[!] Buscando dispositivos Fastboot...${NC}"
           dispositivo=$(fastboot devices | awk '{print $1}' | head -n 1)
           if [[ -z "$dispositivo" ]]; then
               echo -e "${RED}[✘] ERROR: Dispositivo no encontrado.${NC}"
               echo -e "1. Entra en modo FASTBOOT ${RED}(logo Fastboot)${NC}."
           else
               echo -e "${GREEN}[✔] Detectado: $dispositivo${NC}"
               fastboot getvar product; fastboot getvar token
           fi
           volver ;;
        4) clear
           echo -e "1. Fastboot | 2. Recovery | 3. EDL"
           read -p ">> " r
           [ "$r" == "1" ] && adb reboot bootloader
           [ "$r" == "2" ] && adb reboot recovery
           [ "$r" == "3" ] && adb reboot edl
           volver ;;
        5) exit ;;
    esac
done
