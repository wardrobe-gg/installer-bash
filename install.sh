#!/bin/bash

# © Wardrobe.gg Ltd 2025
# Wardrobe.gg Ltd
# Company Number: 16272253
# Registered in England and Wales
# 49 Station Road, Polegate, England, BN26 6EA
# https://wardrobe.gg

# For support with this script, join our discord server.
# https://discord.gg/XB5Hk3EnDU


# This is the wardrobe installation script.
# For platforms Mac and Linux
# For windows, see the windows installer.



# Function to print colored text using RGB values
print_rgb() {
    local text="$1"
    local r=255
    local g=52
    local b=117
    printf "\033[38;2;%d;%d;%dm%s\033[0m\n" "$r" "$g" "$b" "$text"
}

# ASCII Art Logo
print_rgb "
=================================================================================

          __          __     _____  _____  _____   ____  ____  ______          
     _    \ \        / /\   |  __ \|  __ \|  __ \ / __ \|  _ \|  ____|    _    
   _| |_   \ \  /\  / /  \  | |__) | |  | | |__) | |  | | |_) | |__     _| |_  
  |_   _|   \ \/  \/ / /\ \ |  _  /| |  | |  _  /| |  | |  _ <|  __|   |_   _| 
    |_|      \  /\  / ____ \| | \ \| |__| | | \ \| |__| | |_) | |____    |_|   
              \/  \/_/    \_\_|  \_\_____/|_|  \_\\____/|____/|______|         
                                                                               
                                                                               
     
=================================================================================

"

echo " Welcome to the Wardrobe installer."
echo " https://wardrobe.gg • Wardrobe.gg Ltd"
echo ""

echo " Support: https://discord.gg/XB5Hk3EnDU"

echo ""
echo ""



# Check if script is run as root, if not, request sudo privileges
if [ "$EUID" -ne 0 ]; then
    echo " > Uh oh, we need administrator privileges."
    echo " > This may seem scary, but we promise it's completely safe."
    echo " > In the (likely) event that you don't trust our word, you can view this installer's source code here: https://github.com/wardrobe-gg/installer-bash"
    echo " > Or, contact our support team in our discord (https://discord.gg/XB5Hk3EnDU) for a full explanation"
    echo ""

    exec sudo "$0" "$@"
    exit
fi

echo " [@] Starting Wardrobe installation..."
sleep 1
echo " [@] Checking system compatibility..."
sleep 1
echo " [@] Preparing to modify hosts file..."
sleep 1

# Check if the line already exists in hosts file
if grep -q "# INSERTED BY WARDROBE" /etc/hosts; then
    echo " [@] Wardrobe is already installed!"
else
    # Add the line to hosts file
    echo "51.68.220.202 s.optifine.net # INSERTED BY WARDROBE" >> /etc/hosts
    echo " [@] Successfully modified hosts file!"
fi

echo ""
echo " > Installation complete."
echo " > Want to check it's working? Visit http://s.optifine.net and see if you end up in narnia ;)"
echo ""