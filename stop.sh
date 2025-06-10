#!/bin/bash
echo "Stopping server..."
SERVER=$(basename $PWD)

if [ -e ./velocity.toml ]; then
    screen -S $SERVER -X stuff 'end\n'
else
    screen -S $SERVER -X stuff 'stop\n'
fi

while screen -list | grep -q $SERVER; do
    sleep 1  # Check every second
done
echo "Server Closed."
