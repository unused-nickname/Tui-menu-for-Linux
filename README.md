# Tui-menu-for-Linux
A simple text-mode menu (TUI) written in Bash that allows you to quickly access basic Linux system tools through the terminal.
The script uses the `dialog` utility to create a functional interface.

---
## Features
- **File Manager** – Opens a terminal file manager
- **Network Manager** – Manages network connections  
- **Music Player** – Launches a terminal music player 
- **Calendar** – Displays a monthly calendar
- **Calculator** – Opens a terminal calculator
- **Games** - Opens a list for simple TUI games
- **Exit** – Closes the program

**Now with placeholders so you can add you willing TUI program**

## Requirements
Before running the script, make sure you have the `dialog` package installed:

```bash
sudo pacman -S dialog
# or on Debian/Ubuntu-based systems:
sudo apt install dialog
```
## How to use
- **1** - Clone the repository:
  ```bash
  git clone https://github.com/unused-nickname/Tui-menu-for-Linux
  ```
- **2** - Enter the project directory and give the script execution permission:
  ```bash
  chmod +x tuimenu.sh
  ```
- **3** - Run it!
  ```bash
  ./tuimenu.sh
  ```
## Technologies used
- **Bash** - The scripting language
- **Dialog** - For building the text-based interface

## Customization
You can edit the `tuimenu.sh` file to:
-Change the commands run by each menu option;
-Modify the menu title or layout;
-Add or remove menu items as you wish.

## License
Distributed under the MIT License.

Feel free to use, modify, and share this project.
