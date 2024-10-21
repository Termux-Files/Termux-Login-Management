#!/bin/bash

# Function to handle options after logging out from Debian

# Setting echo color functions
cyan() { echo -e "\e[01;36m$1\e[0m"; }
green() { echo -e "\e[01;32m$1\e[0m"; }
yellow() { echo -e "\e[01;33m$1\e[0m"; }

cyan "Select an option:"
green "1) Return to Termux"
green "2) Exit Termux"
read -p "$(yellow 'Enter your choice [1-2]: ')" choice

case $choice in
    1)
        echo "Returning to Termux..."
	clear
	green "		Welcome To Termux!
	"
        ;;
    2)
        echo "Exiting Termux..."
        touch ~/.exit_termux
        ;;
    *)
        echo "Invalid choice. Returning to Termux..."
        ;;
esac
