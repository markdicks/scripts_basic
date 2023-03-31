#!/bin/bash

# Check if running as root or using sudo
if [[ $(id -u) -ne 0 ]]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# Change password to 'wtc'
echo "wethinkcode:wtc" | chpasswd

# Check if password change was successful
if [[ $? -eq 0 ]]; then
    echo "Password changed successfully."
else
    echo "Password change failed."
fi

exit 0
rm -rf wtc_scripts/ >/dev/null 2>&1
