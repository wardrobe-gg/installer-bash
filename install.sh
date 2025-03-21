#!/bin/bash

# © Wardrobe.gg Ltd 2025
# Wardrobe.gg Ltd
# Company Number: 16272253
# Registered in England and Wales
# 49 Station Road, Polegate, England, BN26 6EA
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

# Backup the original hosts file
cp /etc/hosts /etc/hosts.wardrobe.bak

# Create a temporary file with proper permissions
temp_file=$(mktemp)
chmod 644 "$temp_file"

# Remove any existing entries containing s.optifine.net and copy other lines
# Using grep with ASCII output to ensure no encoding issues
grep -v "s.optifine.net" /etc/hosts | LC_ALL=C cat > "$temp_file"

# Add the new entry with explicit newline handling
printf "51.75.145.147 s.optifine.net # INSERTED BY WARDROBE\n" >> "$temp_file"

# Ensure the file has the correct permissions before moving
chmod 644 "$temp_file"

# Replace the original hosts file with the modified one
cat "$temp_file" > /etc/hosts

# Clean up
rm "$temp_file"

echo " [@] Successfully modified hosts file!"
echo ""
echo " > Installation complete."
echo " > Want to check it's working? Visit http://s.optifine.net and see if you end up in narnia ;)"
echo ""
