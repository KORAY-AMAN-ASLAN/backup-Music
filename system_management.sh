#!/bin/bash

echo "Advanced System Management Tool"

#  functions for file and directory management
list_files() { echo "Files in directory:"; ls; }
create_file() { read -p "Enter filename to create: " filename; touch "$filename"; echo "File created: $filename"; }
delete_file() { read -p "Enter filename to delete: " filename; rm -i "$filename"; }
create_directory() { read -p "Enter directory name to create: " dirname; mkdir -p "$dirname"; echo "Directory created: $dirname"; }
delete_directory() { read -p "Enter directory name to delete: " dirname; rm -ri "$dirname"; }
copy_file() { read -p "Enter the filename to copy: " filename; read -p "Enter the destination path: " dest; cp "$filename" "$dest"; echo "File copied to $dest"; }
move_file() { read -p "Enter the filename to move: " filename; read -p "Enter the destination path: " dest; mv "$filename" "$dest"; echo "File moved to $dest"; }
view_file() { read -p "Enter the filename to view: " filename; less "$filename"; }
search_files() { read -p "Enter the search pattern: " pattern; find . -name "$pattern"; }
count_lines() { read -p "Enter the filename to count lines: " filename; wc -l "$filename"; }

# crontab and at functions for task scheduling
schedule_cron() { read -p "Enter cron schedule (e.g., '* * * * *'): " schedule; read -p "Enter command to schedule: " command; (crontab -l 2>/dev/null; echo "$schedule $command") | crontab -; echo "Cron job scheduled"; }
schedule_at() { read -p "Enter time for execution (e.g., 'now + 1 minute'): " time; read -p "Enter command to execute: " command; echo "$command" | at "$time"; echo "At job scheduled"; }

# Display menu options
show_menu() {
    echo "1) List Files"
    echo "2) Create a File"
    echo "3) Delete a File"
    echo "4) Copy a File"
    echo "5) Move a File"
    echo "6) Create a Directory"
    echo "7) Delete a Directory"
    echo "8) View File Contents"
    echo "9) Search for Files"
    echo "10) Count Lines in a File"
    echo "11) Schedule a Cron Job"
    echo "12) Schedule an At Job"
    echo "13) Exit"
    echo -n "Enter your choice [1-13]: "
}

# Main loop to handle user input
while true; do
    show_menu
    read choice
    case $choice in
        1) list_files ;;
        2) create_file ;;
        3) delete_file ;;
        4) copy_file ;;
        5) move_file ;;
        6) create_directory ;;
        7) delete_directory ;;
        8) view_file ;;
        9) search_files ;;
        10) count_lines ;;
        11) schedule_cron ;;
        12) schedule_at ;;
        13) echo "Exiting program."; exit 0 ;;
        *) echo "Invalid choice." ;;
    esac
done
