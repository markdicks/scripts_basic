#!/bin/bash

# List all disks and partitions
sudo fdisk -l

# Prompt user to select disk
read -p "Enter the disk you want to mount (e.g. /dev/sda1): " disk

# Create mount point
sudo mkdir /mnt/windows

# Mount selected disk
sudo mount $disk /mnt/windows/

# Copy Microsoft EFI files to /boot/efi/EFI
sudo cp -r /mnt/windows/EFI/Microsoft /boot/efi/EFI

# Add timeout and console-mode settings to loader.conf
sudo sh -c "echo 'timeout 5' >> /boot/efi/loader/loader.conf"
sudo sh -c "echo 'console-mode max' >> /boot/efi/loader/loader.conf"
