#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Error: This function requires three arguments.">&2
    exit 1

elif [ ! -d "$1" ]; then
    echo "Error: User does not exist.">&2
    exit 1
elif [ ! -d "$2" ]; then
    echo "Error: $2 does not exist.">&2
    exit 1
fi
./P.sh "$0"
if grep -Fxq "$2" "$1"/friends; then
    echo "Ok: Message posted to $2's wall."
    echo "$2" : "$3" >> "$1"/wall
    ./V.sh "$0"
    exit 0
else
    echo "$1 is not friends with $2."
    ./V.sh "$0"
    exit 1
fi

