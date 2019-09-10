#!/usr/bin/bash

mkdir -p $HOME/{tmp,usr,usr/work}

# create all symlinks here
current_directory=$(pwd -P)
while IFS="" read -r p || [ -n "$p" ]
do
  if [ -z "$p" ]; then
    continue
  fi

  source_path="$current_directory/$(echo $p | cut -d'|' -f1)"
  link_path="$HOME/$(echo $p | cut -d'|' -f2)"

  if [[ -e "$link_path" || -d "$link_path" ]]; then
    printf '%s already exists!\n' "$link_path"
    continue
  fi

  directory_path="$(dirname $link_path)"
  if [[ ! -z "$directory_path" ]]; then
    mkdir -p "$directory_path"
  fi

  printf 'Linking %s  ->  %s\n' "$source_path" "$link_path"
  ln -s "$source_path" "$link_path"
done < symlinks.txt

# clone st-patched and make install
git clone git@github.com:illusaen/st-patched.git
cd st-patched
sudo make install

