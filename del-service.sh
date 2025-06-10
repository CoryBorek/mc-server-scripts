#!/bin/bash
NAME=$(basename $PWD)
FILE=$NAME.service

sudo systemctl disable $NAME
sudo systemctl stop $NAME
sudo systemctl daemon-reload
sudo rm -f /etc/systemd/system/$FILE
