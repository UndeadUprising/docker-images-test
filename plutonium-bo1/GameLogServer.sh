#!/bin/bash

if [ ! -d /home/container/GameLogServer ]; then
	echo "Downloading GameLogServer"
	mkdir /home/container/GameLogServer
	wget https://github.com/RaidMax/IW4MAdmin-GameLogServer/releases/download/1.0.0/GameLogServer.zip -O /home/container/GameLogServer/GameLogServer.zip -q --show-progress

	cd /home/container/GameLogServer
	unzip -o GameLogServer.zip
	rm GameLogServer.zip

	pip install -r requirements.txt
	pip install python-dotenv
fi

echo "Patching runserver.py"
wget https://gist.githubusercontent.com/Classixz/49c21a0e8ba54fffae354ad47b879dc8/raw -O /home/container/GameLogServer/runserver.py -q --show-progress

echo "Starting GameLogServer"
python3 /home/container/GameLogServer/runserver.py &
