#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Provide client Id and protocol.">&2
    exit 1
fi

clientpipe="/home/cs16205776/assignment/project/$1.pipe"
mkfifo "$clientpipe"
serverpipe="/home/cs16205776/assignment/project/server.pipe"

if [ "$2" == create ]; then
    echo "$1 $2 $3" > "$serverpipe"

elif [ "$2" == add ]; then
    echo "$1" "$2" "$3" "$4" > "$serverpipe"

elif [ "$2" == post ]; then
    echo "$1" "$2" "$3" "$4" "$5" > "$serverpipe"

elif [ "$2" == show ]; then
    echo "$1" "$2" "$3" > "$serverpipe"

elif [  "$2" == shutdown ]; then
    echo "$1" "$2" > "$serverpipe"

fi

while read output; do
    echo "$output"
done<"$clientpipe"

rm "$clientpipe"
