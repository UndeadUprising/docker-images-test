#!/bin/bash
echo "Downloading GameLogServer"

sudo apt install -y python3.9 python-dev unzip
sudo apt-cache policy python3.9
python3.9 --version

if [ ! -d /home/container/GameLogServer ]; then
	mkdir /home/container/GameLogServer
fi

wget https://github.com/RaidMax/IW4MAdmin-GameLogServer/releases/download/1.0.0/GameLogServer.zip -O /home/container/GameLogServer/GameLogServer.zip -q --show-progress

cd /home/container/GameLogServer
unzip -o GameLogServer.zip
rm GameLogServer.zip

pip install -U --prefix .local -r requirements.txt

/usr/local/bin/python /home/container/GameLogServer/runserver.py &
