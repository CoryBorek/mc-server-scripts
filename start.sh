#!/bin/bash
echo "Starting Server in Screen."
screen -L -dmS $(basename $PWD) ./intstart.sh
