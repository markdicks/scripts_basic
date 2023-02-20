#!/bin/bash

# Prompt the user to enter the name of the script to move
read -p "Enter the name of the script to move: " script_name

# Ask the user to confirm the script they want to move
read -p "Are you sure you want to move $script_name to /bin? (y/n): " confirm

# Loop until the user confirms the script they want to move
while [[ $confirm != "y" ]]; do
  # Prompt the user to re-enter the name of the script
  read -p "Enter the name of the script to move: " script_name
  # Ask the user to confirm the script they want to move
  read -p "Are you sure you want to move $script_name to /bin? (y/n): " confirm
done

# Check if the script exists in any directory
if whereis -b "$script_name"; then
  echo "Script exists in the following directories:"
  whereis -b "$script_name"
  echo "Removing old versions of the script..."
  # Remove the script from all directories where it is found
  sudo rm -rf $(whereis -b "$script_name" | cut -d" " -f2-)
fi

# Move the script to /bin
sudo mv ~/Downloads/wtc_scripts/"$script_name" /bin/

# Make the script executable
sudo chmod +x /bin/"$script_name"

echo "Script moved and made executable."
