# proxmox backup client helpers
Scripts & configuration for easy use of proxmox backup client.
Verified on Ubuntu 20.04.

## Install
- Clone / download & unzip to where you want the tools to live & execute from.
- Set appropriate values in `Variables.sh`.
- Edit the service configuration if you want a different backup frequency than hourly.
- Set execution flag on everything but `Variables.sh` and the service configuration.
- Dependent on install path, consider limiting access to `Run.sh` and `Variables.sh`.
- Run `Install.sh` as root.
- Run `Configure.sh`. You will be prompted for sudo password for service configuration.

## Browse
- Run `Browse.sh` for an overview of snapshots.
- Run `Browse.sh <snapshot> <file>` as root to mount (and view if `xdg-open` is available).
