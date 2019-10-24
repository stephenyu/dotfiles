#!/bin/bash
git branch -v --sort=-committerdate | grep -vi '*' | grep -vi 'master' | awk '{ print "\033[34m"$2 "  ""\033[37m" $1}'
