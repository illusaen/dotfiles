#!/bin/bash
# barnard-sound.sh
# Description: Sounds and notification script for barnard.
#
# Copyright 2019, F123 Consulting, <information@f123.org>
# Copyright 2019, Storm Dragon, <storm_dragon@linux-a11y.org>
#
# This is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free
# Software Foundation; either version 3, or (at your option) any later
# version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this package; see the file COPYING.  If not, write to the Free
# Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.
#
#--code--
                                                                                                                                                                
# 1 is off, 0 is on
notify=0

# Select notify type, notify-send or fenrir
notifyType="notify-send"

connect() {
    [[ $notify ]] && notify "${1}ed."
}

disconnect() {
    [[ $notify ]] && notify "${1}ed."
}

is_function() {
    LC_ALL=C type "$1" 2> /dev/null | grep -q "$1 is a function"
}

join() {
    [[ $notify ]] && notify "$2 ${1}ed the channel."
}

leave() {
    [[ $notify ]] && notify "$2 left the channel."
}

micdown() {
    [[ $notify ]] && notify "You have stopped transmitting."
}

micup() {
    [[ $notify ]] && notify "You are now transmitting."
}

msg() {
    [[ $notify ]] && notify "$1 from $2: $3"
}

notify() {
  if [[ "$notifyType" == "notify-send" ]]; then
      notify-send "$@"
  fi
}

pm() {
    [[ $notify ]] && notify "$1 from $2: $3"
}

if is_function "$1" ; then
    eval "$1" "$1" "$2" "$3" &> /dev/null
else
    echo "The given barnard event has not yet been added."
fi

exit 0

