#!/bin/bash

function list_todos()
{
    local LIST=$(task list 2>&1)
    if [[ "$LIST" == "No matches found." ]]; then
        echo "$LIST"
    else
        FORMATTED=$(task rc.verbose=nothing | awk '{$1=""; print}')
        echo "$FORMATTED"
    fi
}

if ! [[ -x "$(command -v task)" ]]; then
    echo -e "Please install task (taskwarrior)."
else
    list_todos
fi
