#!/bin/bash

#FUNCTION FOR SYSTEM INFO TUI
function system_info() {
    while true; do
        opcao=$(dialog --no-cancel --title "General System Info" \
                       --menu "Choose a option:" 15 50 5 \
                       1 "Who am i?"\
                       2 "System Info"\
                       3 "Memory Usage"\
                       4 "Disk Usage"\
                       5 "Processes"\
                       6 "Back to main menu"\
                       2>&1 >/dev/tty)
        clear
        case $opcao in
            1)
                clear
                dialog --msgbox "User: $(whoami)" 10 50
                ;;
            2)
                clear
                dialog --msgbox "$(uname -a)" 10 50
                ;;
            3)
                meminfo=$(free -h)
                dialog --msgbox "$meminfo" 10 70
                ;;
            4)  
                diskinfo=$(df -h)
                dialog --title "Disk Usage" --msgbox "$diskinfo" 25 80
                ;;
            5)
                clear
                htop
                ;;
            6)
                break
                ;;
        esac
    done               
}
