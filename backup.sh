  GNU nano 6.2                                                                                      backup.sh                                                                                               

#!/bin/bash



BACKUP_SRC="/home/aman/Music/"

BACKUP_DEST="/home/aman/Backup"



# This creates a date string in YYYYMMDD format for the backup filename

DATE=$(date +%Y%m%d)



# The name of the backup file will be 'project_backup_' followed by the date

BACKUP_FILE="project_backup_$DATE.tar.gz"



# Function to Create Backup

backup_project() {

    # Just to Ensure the destination directory exists

    mkdir -p "$BACKUP_DEST"



    # Creating a compressed tar.gz archive of the BACKUP_SRC

    # -c: Create a new archive

    # -z: Compress the archive with gzip

    # -f: Use the following filename

    if tar -czf "$BACKUP_DEST/$BACKUP_FILE" "$BACKUP_SRC"; then

        echo "Backup successfully created: $BACKUP_FILE"

    else

        echo "Backup failed."

        exit 1

    fi

}



# Main Script Execution

if [ -d "$BACKUP_SRC" ]; then

    # Call the backup_project function to create a backup

    backup_project

else

    echo "Source directory does not exist."

    exit 1  # Exit the script with an error status

fi









