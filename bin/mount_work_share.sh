#!/bin/bash

if ! grep -qs `/home/$(whoami)/usr/work ` /proc/mounts; then
	sudo mount -t 9p -o trans=virtio work /home/$(whoami)/usr/work
	if [ $? -eq 0 ]; then
		echo "Mounted work share."
	else
		echo "Could not mount work share..."
	fi
fi
