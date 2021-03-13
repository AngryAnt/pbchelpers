#!/bin/bash

source $(dirname "$0")/Variables.sh

# Further reading: https://pbs.proxmox.com/docs/backup-client.html

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
	echo "Run this as root"
	exit 1
fi

proxmox-backup-client backup root.pxar:/
