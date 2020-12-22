#!/bin/bash

serverpipe="/home/cs16205776/assignment/project/server"
mkfifo "$serverpipe"

while true; do
    read arg1 arg2 arg3 arg4 < "$serverpipe";

    case "$arg1" in
        create)
            ./create.sh "$arg2"&
            ;;
        add)
            ./add.sh "$arg2" "$arg3"&
            ;;
        post)
            ./post.sh "$arg2" "$arg3" "$arg4"&
            ;;
        show)
            ./show.sh "$arg2"&
            ;;
        shutdown)
            if [ "$arg2" == "exit" ]; then
                echo "Shutting down..."
                exit 0
                break
            fi
            ;;
    esac
done
