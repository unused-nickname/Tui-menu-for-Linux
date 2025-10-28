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

while true; do
    opcao=$(dialog --title "TUI Program Manager" \
                   --menu "Please Select:" 15 50 5 \
                   1 "File Manager"\
                   2 "Network Manager"\
                   3 "Music Player"\
                   4 "Calendar"\
                   5 "Calculator"\
                   6 "Games"\
                   7 "Exit" \
                   2>&1 >/dev/tty)

    clear

    case $opcao in
        1)
            dialog --msgbox "Opening File Manager (Yazi)..." 10 50
            yazi
            ;;
        2)
            dialog --msgbox "Opening Network Manager (NMTui)..." 10 50
            nmtui
            ;;
        3)
            dialog --msgbox "Opening Music Player (ncmpcpp)..." 10 50
            ncmpcpp
            ;;
        4)
            dialog --msgbox "Opening Calendar (Calcurse)..." 10 50
            calcurse
            ;;
        5)
            dialog --msgbox "Opening Calculator (Qalc)..." 10 50
            qalc
            ;;
        6)
            games_menu
            ;;
        7)
            clear
            echo "Exiting..."
            exit 0
            ;;
        *)
            break
            ;;
    esac
done
