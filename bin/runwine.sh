#!/bin/bash
xhost +SI:localuser:wineuser
sudo -u wineuser env HOME=/home/wineuser USER=wineuser USERNAME=wineuser WINEPREFIX=/home/wineuser/.wine LOGNAME=wineuser wine "$@"
