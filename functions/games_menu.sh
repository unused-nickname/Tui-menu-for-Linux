#!/bin/bash

#FUNCTION FOR GAMES MENU
function games_menu() {
    while true; do
        opcao=$(dialog --no-cancel --title "Games Menu" \
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