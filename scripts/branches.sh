#!/bin/bash

if [ $# -eq 0 ]
then
    git branch -v --sort=-committerdate | grep -vi '*\|master\|green' | awk '{ print "\033[34m"$2 "  ""\033[37m" $1}' | head -n 25 | cat -n
else
    if [ "$(uname)" == "Darwin" ]; then
        BRANCH=`git branch -v --sort=-committerdate | grep -vi '*\|master\|green' | awk '{ print "\033[34m"$2 "  ""\033[37m" $1}' | sed -n "$1p" | awk '{ print $2}' | gsed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"`
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        BRANCH=`git branch -v --sort=-committerdate | grep -vi '*\|master\|green' | awk '{ print "\033[34m"$2 "  ""\033[37m" $1}' | sed -n "$1p" | awk '{ print $2}' | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"`
    fi
    git checkout $BRANCH
fi
