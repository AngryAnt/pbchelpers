#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
	echo "Run this as root"
	exit 1
fi

APT_GPG_PATH="/etc/apt/trusted.gpg.d"
GPG_KEY_NAME="proxmox-ve-release-6.x.gpg"
GPG_DOWNLOAD_BASE="http://download.proxmox.com/debian"
KEY_URL="$GPG_DOWNLOAD_BASE/$GPG_KEY_NAME"
KEY_INSTALL="$APT_GPG_PATH/$GPG_KEY_NAME"
SUPPORT_URL="https://pbs.proxmox.com/docs/package-repositories.html#package-repos-secure-apt"

if [ ! -f "$APT_GPG_PATH/$GPG_KEY_NAME" ]; then
	echo "SecureApt key for pbs-client repository not found."
	echo ""
	echo "Get it:"
	echo "	wget $KEY_URL -O $KEY_INSTALL"
	echo "Validate it:"
	echo "	sha512sum $KEY_INSTALL"
	echo "Expected output:"
	echo "	acca6f416917e8e11490a08a1e2842d500b3a5d9f322c6319db0927b2901c3eae23cfb5cd5df6facf2b57399d3cfa52ad7769ebdd75d9b204549ca147da52626 $KEY_INSTALL"
	echo "Documentation:"
	echo "	$SUPPORT_URL"
	echo ""
	echo "Then re-run this installer"
	exit 2
fi

echo "Configuring pbs-client repository and installing"

echo "deb http://download.proxmox.com/debian/pbs-client buster main" > /etc/apt/sources.list.d/pbs-client.list
apt-get update
apt-get install proxmox-backup-client
