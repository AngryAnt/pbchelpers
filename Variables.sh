#!/bin/bash

# Ex username@pbs!tokenname@host:datastore
export PBS_REPOSITORY=""
# Password if above specifies user, secret if a token
export PBS_PASSWORD=""
# Used by Browse.sh
export BACKUP_MOUNT="/mnt/backup"
# Used by Configure, Run, and Browse
export BACKUP_KEYFILE="/home/[USER NAME HERE]/.config/proxmox-backup/encryption-key.json"
