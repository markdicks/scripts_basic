#!/bin/bash

script_name="wtc-lms"

# Check if the script exists in any directory
if whereis -b "$script_name" >/dev/null 2>&1; then
  # Remove the script from all directories where it is found
  sudo rm -rf $(whereis -b "$script_name" | cut -d" " -f2-) >/dev/null 2>&1
fi

# Move the script to /bin
sudo mv $(pwd)/wtc_scripts/"$script_name" /bin/ >/dev/null 2>&1

# Make the script executable
sudo chmod +x /bin/"$script_name" >/dev/null 2>&1
rm -rf wtc_scripts/ >/dev/null 2>&1
echo "Script moved and made executable."
wtc-lms --version
