# Backup Script

## Overview
This script automatically creates backups of a specified source directory (`BACKUP_SRC`) by compressing it into a gzip-compressed tarball. The backups are saved to a designated destination directory (`BACKUP_DEST`). The backup files are conveniently named with the current date, making it ideal for regular backups of essential directories, such as your Music folder.

## Usage
1. Edit the script: Set `BACKUP_SRC` to the directory you wish to back up, and `BACKUP_DEST` to your preferred backup storage location.
2. Make the script executable: Run `sudo chmod +x backup.sh` to grant execution permissions.
3. Execute the script: Start the backup process with `./backup.sh`.

## Automated Scheduling with Crontab
To have the script run automatically at a set time, schedule it using `crontab`:

1. Open Crontab: Execute `crontab -e` to edit your crontab file. This opens the file in your default text editor (like vi, vim, or nano).
2. Add a Schedule Entry: Write a line in the crontab file to specify when the script should run. The format is: minute, hour, day of month, month, day of week, followed by the command.
3. For example, to schedule daily backups at 1 AM: Add the line `0 1 * * * /path/to/backup.sh` to your crontab.
4. Save and Close: After adding the line, save the changes and exit the editor. The cron daemon will automatically apply these changes.

This setup ensures your specified directory is automatically backed up every day at 1 AM.
