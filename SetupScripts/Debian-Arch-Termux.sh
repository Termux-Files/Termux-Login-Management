#!/bin/bash

# Create the loginScripts directory
mkdir -p ~/.loginScripts

# Create after_logout.sh
cat << 'EOF' > ~/.loginScripts/after_logout.sh
#!/bin/bash

# Function to handle options after logging out

# Setting color functions for aesthetic consistency
function blue() { echo -e "\e[01;34m$1\e[0m"; }
function green() { echo -e "\e[01;32m$1\e[0m"; }
function yellow() { echo -e "\e[01;33m$1\e[0m"; }

blue "Choose your next action:"
green "1) Return to Termux"
green "2) Exit Termux"
read -p "$(yellow 'Enter your choice [1-2]: ')" choice

case $choice in
    1)
        echo "Returning to Termux..."
        clear
        green "		Welcome Back to Termux!"
        ;;
    2)
        echo "Exiting Termux..."
        touch ~/.exit_termux
        ;;
    *)
        echo "Invalid choice. Returning to Termux..."
        ;;
esac
EOF

# Create initial_prompt.sh
cat << 'EOF' > ~/.loginScripts/initial_prompt.sh
#!/bin/bash

# Function to display the initial login prompt

# Setting color functions for aesthetic consistency
function blue() { echo -e "\e[01;34m$1\e[0m"; }
function green() { echo -e "\e[01;32m$1\e[0m"; }
function yellow() { echo -e "\e[01;33m$1\e[0m"; }

blue "Welcome! Choose your session:"
green "1) Login to Debian"
green "2) Login to ArchLinux"
green "3) Stay in Termux"
read -p "$(yellow 'Enter your choice [1-3]: ')" choice

case $choice in
    1)
        bash ~/.loginScripts/deb_login.sh
        bash ~/.loginScripts/after_logout.sh
        ;;
    2)
        bash ~/.loginScripts/arch_login.sh
        bash ~/.loginScripts/after_logout.sh
        ;;
    3)
        echo "Staying in Termux..."
        clear
        green "		Welcome to Termux!"
        ;;
    *)
        echo "Invalid choice. Staying in Termux..."
        ;;
esac
EOF

# Create deb_login.sh
cat << 'EOF' > ~/.loginScripts/deb_login.sh
#!/bin/bash

# Start Debian
proot-distro login debian --user yasin

# After logout, return control to .bashrc
exit 0
EOF

# Create arch_login.sh
cat << 'EOF' > ~/.loginScripts/arch_login.sh
#!/bin/bash

# Start ArchLinux
proot-distro login archlinux --user yasin

# After logout, return control to .bashrc
exit 0
EOF

# Make scripts executable
chmod +x ~/.loginScripts/*.sh

# Appending Necessary lines in ~/.bashrc file
cat << 'EOF' >> $HOME/.bashrc
# Custom Login Prompt for Termux Sessions:

# Source the initial prompt script
bash $HOME/.loginScripts/initial_prompt.sh

# Exit Termux if exit signal file exists
if [ -f ~/.exit_termux ]; then
    rm ~/.exit_termux  # Remove the signal file
    exit  # Exit Termux
fi
EOF

echo "All scripts created and made executable!"

