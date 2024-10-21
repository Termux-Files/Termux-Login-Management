#!/bin/bash

# Function to display the initial login prompt:

# Setting echo color functions
cyan() { echo -e "\e[01;36m$1\e[0m"; }
yellow() { echo -e "\e[01;33m$1\e[0m"; }
green() { echo -e "\e[01;32m$1\e[0m"; }

cyan "Select an option:"
green "1) Login to Debian"
green "2) Stay in Termux"
read -p "$(yellow 'Enter your choice [1-2] : ')" choice

case $choice in
    1)
        bash ~/.loginScripts/deb_login.sh
        bash ~/.loginScripts/after_logout.sh
        ;;
    2)
        echo "Staying in Termux..."
	clear
	green "		Welcome To Termux!
	"
        ;;
    *)
        echo "Invalid choice. Staying in Termux..."
        ;;
esac
