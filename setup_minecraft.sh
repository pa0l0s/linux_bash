#!/bin/bash

apt install openjdk-17-jdk y

mkdir /opt/minecraft/

cd /opt/minecraft/

wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/436/downloads/paper-1.20.4-436.jar

echo "eula=true" >> eula.txt

echo "[Unit]\nDescription=Minecraft server\nAfter=network.target\nStartLimitIntervalSec=500\nStartLimitBurst=5\n[Service]\nType=simple\nRestart=on-failure\nRestartSec=5s\nWorkingDirectory=/opt/minecraft\nExecStart=java -Xms2G -Xmx4G -jar /opt/minecraft/server.jar --nogui\n[Install]\nWantedBy=multi-user.target\n" >> /etc/systemd/system/minecraft.service

systemctl daemon-reload

systemctl enable minecraft

