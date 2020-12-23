#!/bin/bash

./P.sh "$0"
if [ "$#" -ne 1 ]; then
    echo "Error: Number of arguments must be 1."
    ./V.sh "$0"
    exit 1
elif [ -d "$1" ]; then
    echo "Error: Name already taken."
    ./V.sh "$0"
    exit 1
else
    mkdir "$1"
    touch "$1"/wall
    touch "$1"/friends
    echo "User created successfully."
    ./V.sh "$0"
    exit 0
fi
