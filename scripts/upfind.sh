#!/bin/bash

$CURRENT_DIR = $PWD;

while [[ $PWD != / ]] ; do
    find "$PWD"/ -maxdepth 1 "$@"
    cd ..
done
