#!/bin/bash

#General Variables and placeholders
file_manager="<file_manager_tui>"
network_manager="<network_manager_tui>"
music_player="<music_player_tui>"
calendar="<calendar_tui>"
calculator="<calculator_tui>"
#Games placeholders
game_1="<game_1>"
game_2="<game_2>"
game_3="<game_3>"
#you can add more variables for more games if you want
#you will also need to those variables to the function

#FUNCTION FOR GAMES MENU
function games_menu() {
    while true; do
        opcao=$(dialog --title "Games Menu" \
                       --menu "Choose a game:" 15 50 5 \
                       1 "$game_1"\
                       2 "$game_2"\
                       3 "$game_3"\
                       4 "Back to Main Menu" \
                       2>&1 >/dev/tty)
        clear
        case $opcao in
            1)
                clear
                $game_1
                ;;
            2)
                clear
                $game_2
                ;;
            3)
                clear
                $game_3
                ;;
            4)
                break      
                ;;
        esac
    done
}

#FUNCTION FOR SYSTEM INFO TUI
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

#SYSTEM 
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
            dialog --msgbox "Opening File Manager ..." 10 50
            $file_manager
            ;;
        3)
            dialog --msgbox "Opening Network Manager ..." 10 50
            $network_manager
            ;;
        4)
            dialog --msgbox "Opening Music Player ..." 10 50
            $music_player
            ;;
        5)
            dialog --msgbox "Opening Calendar ..." 10 50
            $calendar
            ;;
        6)
            dialog --msgbox "Opening Calculator ..." 10 50
            $calculator
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
