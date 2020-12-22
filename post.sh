#!/bin/bash

"$2"=sender
"$1"=receiver
"$3"=post

if [ "$#" -ne 3 ]; then
    echo "Error: This function requires three arguments.">&2
    exit 1

elif [ ! -d "$receiver" ]; then
    echo "Error: $receiver does not exist.">&2
    exit 1
elif [ ! -d "$sender" ]; then
    echo "Error: $sender does not exist.">&2
    exit 1
fi

./P.sh "$receiver/wall"
if grep -Fxq "$sender" "$receiver/friends"; then
    echo "Ok: Message posted to $receiver's wall."
    echo "$receiver":"$post" >> "$receiver/wall"
    ./V.sh "$receiver/wall"
    exit 0

else
    echo "$receiver is not friends with $sender."
    ./V.sh "$reciever/wall"
    exit 1
fi

