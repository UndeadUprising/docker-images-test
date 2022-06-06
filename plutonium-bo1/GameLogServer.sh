#!/bin/bash
echo "Downloading GameLogServer"

if [ ! -d /home/container/GameLogServer ]; then
	mkdir /home/container/GameLogServer
fi

wget https://github.com/RaidMax/IW4MAdmin-GameLogServer/releases/download/1.0.0/GameLogServer.zip -O /home/container/GameLogServer/GameLogServer.zip -q --show-progress

cd /home/container/GameLogServer
unzip -o GameLogServer.zip
rm GameLogServer.zip

pip install -U --prefix .local -r requirements.txt

/usr/local/bin/python /home/container/GameLogServer/runserver.py &
