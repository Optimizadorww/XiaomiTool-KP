#!/data/data/com.termux/files/usr/bin/bash

# --- COLORES ---
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

# --- FUNCIÓN VOLVER ---
volver_menu() {
    echo -e "\n${YELLOW}Presiona Enter para volver al menú principal...${NC}"
    read
}

# --- MENÚ PRINCIPAL ---
show_menu() {
    clear
    echo -e "${PURPLE}"
    echo "  __  __ _                      _            _  _______  "
    echo "  \ \/ /(_) __ _  ___  _ __ ___ (_)_   _ __  | |/ /  _  \ "
    echo "   \  / | |/ _' |/ _ \| '_ ' _ \| | | | | | | | ' /| |_) | "
    echo "   /  \ | | (_| | (_) | | | | | | | |_| | |_| | . \|  __/  "
    echo "  /_/\_\|_|\__,_|\___/|_| |_| |_|_|\__,_|\__,_|_|\_\_|     "
    echo -e "${NC}"
    echo -e "${CYAN}=======================================================${NC}"
    echo -e "${YELLOW} Creado por: ${GREEN}@AntiKripis${NC} (XiaomiTool KP)"
    echo -e "${CYAN}=======================================================${NC}"
    echo -e "1.  ${GREEN}Debloat Automático${NC} (Eliminar basura)"
    echo -e "2.  ${GREEN}Modo Anti-Lag${NC} (Optimizar RAM)"
    echo -e "3.  ${GREEN}Instalar Herramientas MTK${NC}"
    echo -e "4.  ${GREEN}Verificar Estado del Bootloader${NC}"
    echo -e "5.  ${RED}Submenú de Reinicio${NC}"
    echo -e "6.  Salir"
    echo -e "${CYAN}=======================================================${NC}"
}

# --- LÓGICA DE OPCIONES ---
while true; do
    show_menu
    read -p "Selecciona una opción: " opcion

    case $opcion in
        1)
            echo -e "${YELLOW}Ejecutando Debloat...${NC}"
            adb shell pm uninstall -k --user 0 com.miui.analytics
            adb shell pm uninstall -k --user 0 com.miui.msa.global
            adb shell pm uninstall -k --user 0 com.xiaomi.glgm
            adb shell pm uninstall -k --user 0 com.xiaomi.mipicks
            echo -e "${GREEN}¡Completado!${NC}"
            volver_menu ;;
        2)
            echo -e "${YELLOW}Aplicando optimizaciones...${NC}"
            adb shell settings put global adaptive_battery_management_enabled 1
            adb shell settings put global cached_apps_freezer_enabled on
            echo -e "${GREEN}Sistema optimizado.${NC}"
            volver_menu ;;
        3)
            echo -e "${YELLOW}Instalando mtkclient y dependencias...${NC}"
            pkg install python-pip -y && pip install mtkclient
            echo -e "${GREEN}Instalación finalizada.${NC}"
            volver_menu ;;
        4)
            echo -e "${CYAN}Estado del Bootloader:${NC}"
            fastboot getvar unlocked
            volver_menu ;;
        5)
            clear
            echo -e "${PURPLE}--- SUBMENÚ DE REINICIO ---${NC}"
            echo "1. Fastboot"
            echo "2. Recovery"
            echo "
