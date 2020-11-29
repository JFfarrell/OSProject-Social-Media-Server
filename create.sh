#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "exit code 1"
elif [ -d "$#" ]; then
    echo "name already taken"
else
    mkdir "$1"
fi#!/bin/bash
