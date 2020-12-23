#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Error: Must provide two arguments." >&2
    exit 1

elif [ ! -d "$1" ]; then
    echo "Error: User does not exist.">&2
    exit 1
elif [ ! -d "$2" ] ; then
    echo "Error: User does not exist.">&2
    exit 1
fi

./P.sh "$1/friends"
if grep -e "$2" "$1/friends"; then
    echo "Error: '$2' is already on '$1''s friend list.">&2
    ./V.sh "$1/friends"
    exit 1
else
    echo "$2" >> "$1/friends"
    echo "$2 added to $1's friend's list."
    ./V.sh "$1/friends"
    exit 0
fi
