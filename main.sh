#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
source "$SCRIPT_DIR/functions/check_program.sh"
source "$SCRIPT_DIR/functions/games_menu.sh"
source "$SCRIPT_DIR/functions/system_info.sh"

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
#you will also need to add those variables to the function


#MAIN SYSTEM 
while true; do
    opcao=$(dialog --no-cancel --title "TUI Program Manager" \
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
            if check_program "$file_manager" "File Manager"; then
                dialog --infobox "Opening File Manager ..." 5 50
                sleep 2 #Omit to open instantly
                if ! $file_manager >/dev/tty 2>&1; then
                    dialog --title "Error" --msgbox "Failed to launch Program:\nNo File Manager found with command('$file_manager')" 8 60
                    fi
                fi
                ;;
        3)
            if check_program "$network_manager" "Network Manager"; then
                dialog --infobox "Opening Network Manager ..." 5 50
                sleep 2 #Omit to open instantly
                if ! $network_manager >/dev/tty 2>&1; then
                    dialog --title "Error" --msgbox "Failed to launch Program:\nNo Network Manager found with command('$network_manager')" 8 60
                    fi
                fi
                ;;
        4)
            if check_program "$music_player" "Music Player"; then
                dialog --infobox "Opening Music Player ..." 5 50
                sleep 2 #Omit to open instantly
                if ! $music_player >/dev/tty 2>&1; then
                    dialog --title "Error" --msgbox "Failed to launch Program:\nNo Music Player found with command('$music_player')" 8 60
                    fi
                fi
                ;;
        5)
            if check_program "$calendar" "Calendar"; then
                dialog --infobox "Opening Calendar ..." 5 50
                sleep 2 #Omit to open instantly
                if ! $calendar >/dev/tty 2>&1; then
                    dialog --title "Error" --msgbox "Failed to launch Program:\nNo Calendar found with command('$calendar')" 8 60
                    fi
                fi
                ;;
        6)
            if check_program "$calculator" "Calculator"; then
                dialog --infobox "Opening Calculator ..." 5 50
                sleep 2 #Omit to open instantly
                if ! $calculator >/dev/tty 2>&1; then
                    dialog --title "Error" --msgbox "Failed to launch Program:\nNo Calculator found with command('$calculator')" 8 60
                    fi
                fi
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
