#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 name-of-link"
    exit 1

else
    rm "$1-lock"
    exit 0
fi 
