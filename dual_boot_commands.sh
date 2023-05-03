#!/bin/bash

# Run fdisk to list available disks
sudo fdisk -l

# Prompt user to enter the disk to mount
read -p "Enter the disk to mount (e.g. /dev/sda1): " usr_disk

# Create a directory to mount the disk
sudo mkdir /mnt/windows

# Mount the disk to the directory
sudo mount $usr_disk /mnt/windows

# Copy Microsoft folder to /boot/efi/EFI
sudo cp -r /mnt/windows/EFI/Microsoft /boot/efi/EFI

# Add timeout and console-mode settings to loader.conf
sudo bash -c 'echo "timeout 5" >> /boot/efi/loader/loader.conf'
sudo bash -c 'echo "console-mode max" >> /boot/efi/loader/loader.conf'

echo "Windows boot files copied and loader.conf updated successfully."
