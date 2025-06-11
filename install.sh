#!/bin/bash
set -e
if [ -e ./STEP ]; then
STEP=$(cat ./STEP)
else
STEP=0
fi
SCRIPT=$0
next_step() {
 echo "Run $SCRIPT to complete the next step."
 STEP=$((STEP + 1))
 echo "$STEP" > ./STEP
 exit 0
}

if [ $STEP -eq 0 ]; then
echo "MC Server Scripts Install"
echo "This will run a series of scripts to install a server configuration"
next_step
elif [ $STEP -eq 1 ]; then
    echo "Step 1 - Server Install"
    if [[ -n $1 ]]; then
        sudo apt install screen openjdk-21-jre wget
        if [ "$1" == "paper" ]; then
            wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/paper.sh
            chmod +x ./paper.sh
            set +e
            ./paper.sh $2
            if [ ! $? -eq 0 ]; then
                rm -f ./paper.sh ./papermc.sh
                exit 1
            fi
            set -e
            rm ./paper.sh
        elif [ "$1" == "velocity" ]; then
            wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/velocity.sh
            chmod +x ./velocity.sh
            set +e
            ./velocity.sh $2
            if [ ! $? -eq 0 ]; then
                rm -f ./velocity.sh ./papermc.sh
                exit 1
            fi
            set -e
            rm ./velocity.sh
       fi
       next_step
    else
        echo "Usage in this step: $0 <paper|velocity|scripts> [version]"
        exit 1
    fi
elif [ $STEP -eq 2 ]; then
    echo "Step 2 - Script install"
    if [[ -n $1 ]]; then
        if [ "$1" == "none" ]; then
            next_step
        fi
        if [ "$1" == "service" ]; then
            wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/gen-service.sh
            wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/del-service.sh
            chmod +x ./gen-service.sh
            chmod +x ./del-service.sh
        fi
        wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/start.sh
        wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/stop.sh
        wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/intstart.sh
        wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/restart.sh
        chmod +x ./start.sh
        chmod +x ./stop.sh
        chmod +x ./intstart.sh
        chmod +x ./restart.sh
        next_step
    else
        echo "Usage in this step: $0 [service|none|scripts]"
        exit 1
    fi
fi
echo "Done! You may remove this script upon exit."
rm ./STEP
