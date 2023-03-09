#!/bin/bash

script_name="wtc-lms"

# Check if the script exists in any directory
if whereis -b "$script_name" >/dev/null 2>&1; then
  # Remove the script from all directories where it is found
  sudo rm -rf $(whereis -b "$script_name" | cut -d" " -f2-) >/dev/null 2>&1
fi

# Move the script to /bin
sudo mv $HOME/Downloads/"$script_name" /bin/ >/dev/null 2>&1

# Make the script executable
sudo chmod +x /bin/"$script_name" >/dev/null 2>&1
rm -rf wtc_scripts/ >/dev/null 2>&1
# Run the command and capture its output
output=$(wtc-lms --version)

# Check if the output contains a certain string
if test "$output" = "wtc_scripts/update_lms.sh: 18: wtc-lms: not found"; then
  echo "Error: Please make sure you download wtc-lms from slack"
  echo "https://app.slack.com/client/T016EBFH7F0/C01QPC5DLBA"
  echo "Make sure it goes under the Downloads directory"
elif test "$output" = "wtc_scripts/update_lms.sh: 21: [[: not found"*; then
  echo "Error: Please make sure you download wtc-lms from slack"
  echo "https://app.slack.com/client/T016EBFH7F0/C01QPC5DLBA"
  echo "Make sure it goes under the Downloads directory"
elif test "$output" == *""*; then
  echo "Error: Please make sure you download wtc-lms from slack"
  echo "https://app.slack.com/client/T016EBFH7F0/C01QPC5DLBA"
  echo "Make sure it goes under the Downloads directory"
else
  echo "LMS was updated succesfully"
  echo "$output"
fi

