#!/bin/bash

#FUNCTION FOR PROGRAM CHECKING
#checks if a valid program is called in the Placeholders variables
function check_program() {
    local command="$1"
    local name="$2"

    if [ -z "$command" ] || [[ "$command" == \<* ]]; then
        dialog --title "Error" --msgbox "Failed to launch program:\nNo $name program defined!" 10 50
        return 1
    fi
    return 0
}