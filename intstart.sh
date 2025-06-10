#!/bin/bash
echo "Starting Minecraft Server"
java -jar $(ls -1 | grep .jar | head -n 1 | tr -d '\n')
