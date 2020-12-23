#!/bin/bash

serverpipe="/home/cs16205776/assignment/project/server.pipe"
mkfifo "$serverpipe"


while true; do
    read arg1 arg2 arg3 arg4 arg5 < "$serverpipe";
    clientpipe="/home/cs16205776/assignment/project/$arg1.pipe"

    case "$arg2" in
        create)
            ./create.sh "$arg3" &>"$clientpipe"
            ;;
        add)
            ./add.sh "$arg3" "$arg4" &>"$clientpipe"
            ;;
        post)
            ./post.sh "$arg3" "$arg4" "$arg5" &>"$clientpipe"
            ;;
        show)
            ./show.sh "$arg3" &>"$clientpipe"
            ;;
        shutdown)
                echo "Shutting down..." &>"$clientpipe"
                rm "$serverpipe"
                exit 0
            ;;
    esac

done
rm "$serverpipe"
