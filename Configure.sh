#!/bin/bash

# Further reading: https://pbs.proxmox.com/docs/backup-client.html

# Do not configure default exclude settings if already found
if ! [ -e ~/.pxarexclude ]; then
	echo "Setting up default exclude pattern at '~/.pxarexclude' ignoring the '~/.cache' folder"
	echo "/.cache/*" > ~/.pxarexclude
fi

# Do not generate new encryption if it is already in place
if ! [ -e ~/.config/proxmox-backup/encryption-key.json ]; then
	echo "Setting up encryption"
	proxmox-backup-client key create --kdf none
	echo "Remember to store a copy of '~/.config/proxmox-backup/encryption-key.json' - any backups made from this point forward will be inaccessible without it!"
	echo "You may also consider recording the paper key for added insurance:"
	proxmox-backup-client key paperkey --output-format text
fi

BACKUP_PATH_KEY="%#%#BACKUP_PATH%#%#"
BACKUP_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "Configuring service"
sudo systemctl stop ProxmoxBackup.Client

sudo cp ProxmoxBackup.Client.service /etc/systemd/system/
sudo sed -i "s;$BACKUP_PATH_KEY;$BACKUP_PATH;g" /etc/systemd/system/ProxmoxBackup.Client.service

sudo systemctl enable ProxmoxBackup.Client
sudo systemctl start ProxmoxBackup.Client
