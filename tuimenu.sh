#!/bin/bash

function games_menu() {
    while true; do
        opcao=$(dialog --title "Games Menu" \
                       --menu "Choose a game:" 15 50 5 \
                       1 "Tron Lightcycles" \
                       2 "Tetris" \
                       3 "Chess"\
                       4 "Back to Main Menu" \
                       2>&1 >/dev/tty)
        clear
        case $opcao in
            1)
                clear
                armagetronad
                ;;
            2)
                clear
                vitetris
                ;;
            3)
                clear
                chess-tui
                ;;
            4)
                break      
                ;;
        esac
    done
}
function system_info() {
    while true; do
        opcao=$(dialog --title "General System Info" \
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

while true; do
    opcao=$(dialog --title "TUI Program Manager" \
                   --menu "Please Select:" 15 50 5 \
                   1 "System Info"\
                   2 "File Manager"\
                   3 "Network Manager"\
                   4 "Music Player"\
                   5 "Calendar"\
                   6 "Calculator"\
                   7 "Games"\
                   8 "Exit" \
                   2>&1 >/dev/tty)

    clear

    case $opcao in
        1)
            system_info
            ;; 
        2)
            dialog --msgbox "Opening File Manager (Yazi)..." 10 50
            yazi
            ;;
        3)
            dialog --msgbox "Opening Network Manager (NMTui)..." 10 50
            nmtui
            ;;
        4)
            dialog --msgbox "Opening Music Player (ncmpcpp)..." 10 50
            ncmpcpp
            ;;
        5)
            dialog --msgbox "Opening Calendar (Calcurse)..." 10 50
            calcurse
            ;;
        6)
            dialog --msgbox "Opening Calculator (Qalc)..." 10 50
            qalc
            ;;
        7)
            games_menu
            ;;
        8)
            clear
            echo "Exiting..."
            exit 0
            ;;
        *)
            break
            ;;
    esac
done
