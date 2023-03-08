#!/bin/bash

script_name="wtc-lms"

# Check if the script exists in any directory
if whereis -b "$script_name"; then
  echo "Script exists in the following directories:"
  whereis -b "$script_name"
  echo "Removing old versions of the script..."
  # Remove the script from all directories where it is found
  sudo rm -rf $(whereis -b "$script_name" | cut -d" " -f2-)
fi

# Move the script to /bin
sudo mv $(pwd)/wtc_scripts/"$script_name" /bin/

# Make the script executable
sudo chmod +x /bin/"$script_name"
rm -rf wtc_scripts/
echo "Script moved and made executable."
wtc-lms --version
