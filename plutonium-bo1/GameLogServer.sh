#!/bin/bash
echo "Downloading GameLogServer"

python3.9 --version

if [ ! -d /home/container/GameLogServer ]; then
	mkdir /home/container/GameLogServer
fi

wget https://github.com/RaidMax/IW4MAdmin-GameLogServer/releases/download/1.0.0/GameLogServer.zip -O /home/container/GameLogServer/GameLogServer.zip -q --show-progress

cd /home/container/GameLogServer
unzip -o GameLogServer.zip
rm GameLogServer.zip

export PYTHONPATH="${PYTHONPATH}:/home/container/GameLogServer/.local/bin"

pip install -r requirements.txt
pip install python-dotenv
pip install Flask

python3 /home/container/GameLogServer/runserver.py &
