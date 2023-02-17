#!/bin/bash

# Get the name of the script from the user
read -p "Enter the name of the script to move: " script_name

# Move the script to /bin
sudo mv ~/Downloads/"$script_name" /bin/

# Make the script executable
sudo chmod +x /bin/"$script_name"

echo "Script moved and made executable."
