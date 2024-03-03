#!/bin/bash

apt install openjdk-17-jdk y

mkdir /opt/minecraft/

cd /opt/minecraft/

wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/436/downloads/paper-1.20.4-436.jar

echo "eula=true" >> eula.txt

echo "[Unit]
Description=Minecraft server
After=network.target
StartLimitIntervalSec=500
StartLimitBurst=5
[Service]
Type=simple
Restart=on-failure
RestartSec=5s
WorkingDirectory=/opt/minecraft
ExecStart=java -Xms2G -Xmx4G -jar /opt/minecraft/paper-1.20.4-436.jar --nogui
[Install]
WantedBy=multi-user.target" >> /etc/systemd/system/minecraft.service

systemctl daemon-reload

systemctl enable minecraft

systemctl start minecraft

#TCP Port: 25565
#UDP Port: 19132

#optional plugins EssentialX
cd /opt/minecraft/plugins/
wget https://ci.ender.zone/job/EssentialsX/lastSuccessfulBuild/artifact/jars/EssentialsX-2.21.0-dev+68-993d7ed.jar
wget https://ci.ender.zone/job/EssentialsX/lastSuccessfulBuild/artifact/jars/EssentialsXChat-2.21.0-dev+68-993d7ed.jar
wget https://ci.ender.zone/job/EssentialsX/lastSuccessfulBuild/artifact/jars/EssentialsXSpawn-2.21.0-dev+68-993d7ed.jar

apt-get install vsftpd

apt-get install net-tools

adduser minecraft

cd /opt/
chown -R minecraft:minecraft minecraft

