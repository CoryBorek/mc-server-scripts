#!/bin/bash
NAME=$(basename $PWD)
FILE=$NAME.service
echo "[Unit]" > $FILE
echo "Description=Automatically Generated Startup Script" >> $FILE
echo "" >> $FILE
echo "[Service]" >> $FILE
echo "Type=forking" >> $FILE
echo "User="$(whoami)"" >> $FILE
echo "WorkingDirectory="$PWD"" >> $FILE
echo "ExecStart=bash ./start.sh" >> $FILE
echo "Restart=always" >> $FILE
echo "RuntimeMaxSec=172800">> $FILE
echo "" >> $FILE
echo "[Install]">> $FILE
echo "WantedBy=multi-user.target" >> $FILE

sudo mv ./$FILE /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable $NAME
sudo systemctl start $NAME
