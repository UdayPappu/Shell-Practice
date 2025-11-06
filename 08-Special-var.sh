#!/bin/bash

echo "All variables passed in script: $@"
echo "Number of variables: $#"
echo "Script Name: $0"
echo "Current directory: $PWD"
echo "user running the script: $USER"
echo "Home directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"
