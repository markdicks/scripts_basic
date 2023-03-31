#!/bin/bash

# Remove everything in the specified folders
sudo rm -rf /home/wethinkcode/.mozilla/firefox/*

# Browser names to clear browsing data for
browser1="google-chrome"
browser2="chromium"
browser3="firefox"
browser4="brave-browser"

for browser in "$browser1" "$browser2" "$browser3" "$browser4"; do
    # Check if browser is installed
    if command -v "$browser" >/dev/null 2>&1; then
        # Clear browsing data for the browser
        case "$browser" in
            "google-chrome")
                rm -rf "${HOME}/.config/google-chrome/Default/*"
                ;;
            "chromium")
                rm -rf "${HOME}/.config/chromium/Default/*"
                ;;
            "firefox")
                rm -rf "${HOME}/.mozilla/firefox/*.default-release/*"
                ;;
            "brave-browser")
                rm -rf "${HOME}/.config/BraveSoftware/Brave-Browser/Default/*"
                ;;
        esac
        echo "Cleared browsing data for $browser"
    else
        echo "$browser is not installed"
    fi
done

# Create a list of exceptions
exception_dirs="/home/wethinkcode/Downloads /home/wethinkcode/Desktop /home/wethinkcode/Documents /home/wethinkcode/Music /home/wethinkcode/Pictures /home/wethinkcode/Public /home/wethinkcode/Templates /home/wethinkcode/Videos"

# Name of the zip file
zip_file="home_folders.zip"

# Create a new empty zip file
sudo touch "$zip_file"

# Add all directories to the zip file except exceptions
for dir in /home/*; do
  echo "Adding directory $dir to $zip_file"
  sudo zip -r "$zip_file" "$dir"
done

# Loop through the directories in /home
for dir in /home/*; do
  # Check if the directory is an exception
  if printf '%s\n' "${exception_dirs[@]}" | grep -qFx $(basename "$dir"); then
    # Remove all files and subdirectories in the exception directory
    sudo find "$dir" -mindepth 1 -maxdepth 1 ! -name ".*" -exec rm -rf {} +
  else
    # Remove all files and subdirectories in non-exception directories except hidden files
    sudo find "$dir" -mindepth 1 -maxdepth 1 ! -name ".*" -exec rm -rf {} +
  fi
done

echo "Tasks complete"
