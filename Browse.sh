#!/bin/bash

source $(dirname "$0")/Variables.sh

# Further reading: https://pbs.proxmox.com/docs/backup-client.html

if [[ $# -ne 2 ]]; then
	proxmox-backup-client snapshot list
	echo "Mount a snapshot: ./Browse.sh <snapshot> <file>"
	exit 0
fi

SNAPSHOT=$1
FILE=$2

sudo mkdir "$BACKUP_MOUNT"
sudo PBS_REPOSITORY="$PBS_REPOSITORY" PBS_PASSWORD="$PBS_PASSWORD" proxmox-backup-client mount "$SNAPSHOT" "$FILE" "$BACKUP_MOUNT"

if ! type xdg-open > /dev/null; then
	echo "$FILE of $SNAPSHOT mounted at $BACKUP_MOUNT"
	exit 0
fi

sudo xdg-open "$BACKUP_MOUNT" &>/dev/null && sudo umount "$BACKUP_MOUNT" && sudo rm -rf "$BACKUP_MOUNT" &
