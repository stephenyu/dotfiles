#!/bin/bash

if [ $# -eq 0 ]
then
    git branch -v --sort=-committerdate | grep -vi '*' | grep -vi 'master' | awk '{ print "\033[34m"$2 "  ""\033[37m" $1}' | cat -n
else
    BRANCH=`git branch -v --sort=-committerdate | grep -vi '*' | grep -vi 'master' | awk '{ print "\033[34m"$2 "  ""\033[37m" $1}' | sed -n "$1p" | awk '{ print $2}' | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"`
    git checkout $BRANCH
fi
