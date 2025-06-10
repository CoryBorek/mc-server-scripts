#!/bin/bash
echo "Stopping server..."
SERVER=$(basename $PWD)
screen -S $SERVER -X stuff 'end\n'
while screen -list | grep -q $SERVER; do
    sleep 1  # Check every second
done
echo "Server Closed."
