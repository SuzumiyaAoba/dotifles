#!/bin/bash

. ../util.sh

dpkg -l discord 1>/dev/null 2>&1
if [ $? -eq 1 ]; then
    wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
    sudo dpkg -i /tmp/discord.deb
    sudo apt --fix-broken install
fi

packages=(`lines install | xargs`)

for package in "${packages[@]}"
do
    sudo apt install -y $package
done
