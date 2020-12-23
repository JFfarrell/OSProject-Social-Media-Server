#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Error: This function requires three arguments.">&2
    exit 1

elif [ ! -d "$2" ]; then
    echo "Error: $2 does not exist.">&2
    exit 1

elif [ ! -d "$1" ]; then
    echo "Error: $1 does not exist.">&2
    exit 1

fi

./P.sh "$1/wall"
if grep -Fxq "$2" "$1/friends"; then
    echo "$2": "$3" >> "$1/wall"
    echo "Ok: Message posted to $1 wall."
    ./V.sh "$1/wall"
    exit 0

else
    echo "$2 is not friends with $2.">&2
    ./V.sh "$1/wall"
    exit 1
fi
