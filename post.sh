#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Error: This function requires three arguments.">&2
    exit 1

elif [ ! -d "$1" ]; then
    echo "Error: $receiver does not exist.">&2
    exit 1
elif [ ! -d "$2" ]; then
    echo "Error: $sender does not exist.">&2
    exit 1
fi

./P.sh "$1/wall"
if grep -Fxq "$2" "$1/friends"; then
    echo "$2":"$3" >> "$1/wall"
    echo "Ok: Message posted to $receiver's wall."
    ./V.sh "$receiver/wall"
    exit 0

else
    echo "$1 is not friends with $sender."
    ./V.sh "$1/wall"
    exit 1
fi

