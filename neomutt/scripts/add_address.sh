#!/bin/bash
message=$(cat)

newAlias=$(echo "${message}" | grep ^"From: " | sed -e s/[\,\"\']//g -e s/'From: '//g | awk -F" " '{if (NF == 1) {print "alias UNNAMED UNNAMED " $0;} else if (NF == 2) {print "alias " $1" " toupper(substr($0,1,1)) tolower(substr($0,2));} else if (NF >= 3) {print "alias ", tolower($1)"-"tolower($(NF-1))" " toupper(substr($0,1,1)) tolower(substr($0,2));}}')
emailAddress="<${newAlias##*<}"

if ! grep -Fq "$emailAddress" $CONFIG_HOME/neomutt/aliases; then
    echo "$newAlias" >> $CONFIG_HOME/neomutt/aliases
    sort -u $CONFIG_HOME/neomutt/aliases -o $CONFIG_HOME/neomutt/aliases
fi

echo "${message}"
