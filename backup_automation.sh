#!/bin/bash

# Define the file to be backed up
file_to_backup="c:\Users\Mc Donald Ambali\Desktop\CEProjects\personal_record_management_system.sh"

# Define the backup directory
backup_dir="c:\Users\Mc Donald Ambali\Desktop\CEProjects\Backup"

# Create the backup filename with a timestamp
timestamp=$(date +"%Y%m%d%H%M%S")
backup_filename="${backup_dir}/personal_record_backup_${timestamp}.txt"

# Check if the backup directory exists; if not, create it
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

# Perform the backup
cp "$file_to_backup" "$backup_filename"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $backup_filename"
else
    echo "Backup failed."
fi

