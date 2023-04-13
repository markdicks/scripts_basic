#!/bin/bash

# Set the path to the IntelliJ IDEA bin directory
IDEA_BIN="$(pwd)/bin"

# Create the ~/.ide_java directory if it doesn't exist
mkdir -p "/home/$USER/.ide_java"

# Move the entire IntelliJ IDEA directory to the hidden ide_java directory in the user's home directory
mv "$(dirname "$(pwd)")" "/home/$USER/.ide_java/ideaIC-2022.3.2"

# Set the path to the idea.sh script in the new directory location
IDEA_SH="/home/$USER/.ide_java/ideaIC-2022.3.2/bin/idea.sh"

# Create the alias to open the current directory in IntelliJ IDEA
alias ideadir="$IDEA_SH ."

# Define the function to open a file or directory in IntelliJ IDEA
function ideafile() {
    # Get the absolute path to the file or directory
    if [ $# -eq 0 ]; then
        file_path=$(realpath ".")
    else
        file_path=$(realpath "$1")
    fi

    # Check if it's a directory or a file
    if [ -d "$file_path" ]; then
        nohup "$IDEA_SH" "$file_path" >/dev/null 2>&1 &
    elif [ -f "$file_path" ]; then
        # Open the file in IntelliJ IDEA
        nohup "$IDEA_SH" "$file_path" >/dev/null 2>&1 &
    else
        echo "File or directory not found: $file_path"
    fi
}

# Create the alias to open a file or directory in IntelliJ IDEA
alias openjava="ideafile"

# Save the aliases and function to the .bashrc file
echo "alias ideadir='$IDEA_SH .'" >> ~/.bashrc
echo "alias openjava='ideafile'" >> ~/.bashrc
echo "function ideafile() {
    if [ \$# -eq 0 ]; then
        file_path=\$(realpath \".\")
    else
        file_path=\$(realpath \"\$1\")
    fi

    if [ -d \"\$file_path\" ]; then
        nohup $IDEA_SH \"\$file_path\" >/dev/null 2>&1 &
    elif [ -f \"\$file_path\" ]; then
        nohup $IDEA_SH \"\$file_path\" >/dev/null 2>&1 &
    else
        echo \"File or directory not found: \$file_path\"
    fi
}" >> ~/.bashrc

# Reload the .bashrc file
source ~/.bashrc

# Create the IntelliJ IDEA .desktop file
cat > ~/.local/share/applications/idea.desktop <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA
Icon=$IDEA_BIN/idea.png
Exec=$IDEA_SH
Comment=Powerful and flexible IDE for Java development
Categories=Development;IDE;
EOL

echo "The ideadir and openjava commands have been added to your shell environment."
