#!/usr/bin/bash
comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel | sort) > packages.txt
