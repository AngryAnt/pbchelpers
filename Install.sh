#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
	echo "Run this as root"
	exit 1
fi

wget http://download.proxmox.com/debian/pve/dists/buster/pvetest/binary-amd64/proxmox-backup-client_1.0.8-1_amd64.deb

sha256sum proxmox-backup-client_1.0.8-1_amd64.deb 
f812593f8f1895fc5cbd5c8b6ec1120a4f863739c7c23aa0f2c15b0f7c59033a  proxmox-backup-client_1.0.8-1_amd64.deb

apt update
apt install ./proxmox-backup-client_1.0.8-1_amd64.deb
rm proxmox-backup-client_1.0.8-1_amd64.deb
