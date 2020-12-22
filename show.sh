#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: Must provide only one argument." >&2
    exit 1

elif [ ! -d "$1" ]; then
    echo "Error: User does not exist.">&2
    exit 1

else
    ./P.sh "$0"
    echo "wallStart"
    cat "$1"/wall
    echo "wallEnd"
    ./V.sh "$0"
    exit 0
fi
