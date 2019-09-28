#!/usr/bin/bash
packageFile="packages.txt"
comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel | sort) > $packageFile
echo "" >> $packageFile
echo "# comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel | sort)" >> $packageFile
