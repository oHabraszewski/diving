#!/bin/sh
if [[ "$1" == "asdasd" ]]
then
    $2  
    exit
fi

if ! command -v npm &> /dev/null
then
	echo "npm not found! this script will try to install it, but if it fails, you must do it manually"
	if command -v apt &> /dev/null
	then
		echo "running apt install..."
		sudo apt update
		sudo apt install nodejs
	elif command -v pacman &> /dev/null
	then
		echo "installing with pacman..."
		sudo pacman -Syu nodejs
	else
		echo "not supported system. Node.js has NOT been installed."
	fi
fi
if ! command -v yarn &> /dev/null
then
	echo "yarn not found. this script will try to install it..."
	sudo npm -g i yarn
fi
cd ..
if ! [[ -f "godot" ]]
then
	echo "godot not found! This script will try to install it, but if it fails install it from https://downloads.tuxfamily.org/godotengine/3.2.3/Godot_v3.2.3-stable_win64.exe.zip, unzip, rename file to godot"
	if [ "`uname -s`" == "Linux" ]
	then
	echo "downloading godot..."
	curl https://downloads.tuxfamily.org/godotengine/3.2.3/Godot_v3.2.3-stable_x11.64.zip --output godot.zip
	unzip godot.zip
	rm godot.zip
	mv Godot_v3.2.3-stable_x11.64 godot
	else [ "`uname`" == "Darwin"]
	echo "downloading_godot..."
	culr https://downloads.tuxfamily.org/godotengine/3.2.3/Godot_v3.2.3-stable_osx.64.zip --output godot.zip
	echo "install it, ill wait :-)"
	read -n 1 -s -r -p "Press any key to continue" && echo 
	fi
fi

cd sfn2021/frontend

if ! [ -d "node_modules" ]
then
	yarn
fi

if [ "$1" == "dev" ] || ["$1" == ""]
then
    if command -v konsole &> /dev/null
    then
        `pwd`"/../"$0 "asdasd" "konsole --new-tab -e yarn start" &
    elif command -v gnome-terminal &> /dev/null
    then
        `pwd`"/../"$0 "asdasd" "gnome-terminal --execute /bin/bash -c "yarn start""
    else
        echo "Unsupported terminal emulator. This script supports konsole and gnome-terminal"
    fi
elif [ "$1" == "build" ]
then
    if command -v konsole &> /dev/null
    then
        `pwd`"/../"$0 "asdasd" "konsole --new-tab -e yarn build" &
     #   konsole --hold --nofork --new-tab -e "yarn build" \n & 
    elif command -v gnome-terminal &> /dev/null
    then
        `pwd`"/../"$0 "asdasd" "gnome-terminal --tab -e yarn build" &
   #     gnome-terminal --tab -e "yarn build"&
    else
        echo "Unsupported terminal emulator. This script supports konsole and gnome-terminal"
        exit
    fi
    $TASK &
else
    echo "Wrong mode! Possible modes: dev, build"
    read -n 1 -s -r -p "Press any key to continue" && echo
fi
cd ..
if ! [[ "$JAVA_HOME" == "" ]]
then
    if ! [[ -d "server/public" ]]
    then
        mkdir server/public
    fi
    cd game
    timeout 5 tail
    # TODO: Godot export .sh file
    if command -v konsole &> /dev/null
    then
        `pwd`"/../"$0 "asdasd" "konsole --new-tab -e ../../godot --no-window -w --path ./project.godot --export HTML5 ../server/public/game.html" &
    elif command -v gnome-terminal &> /dev/null
    then
        `pwd`"/../"$0 "asdasd" "gnome-terminal --tab -e ../../godot --no-window -w --path ./project.godot --export HTML5 ../server/public/game.html" &
    else
        echo "Unsupported terminal emulator. This script supports konsole and gnome-terminal"
    fi
    cd ../server
    ./mvnw spring-boot:run
    cd ..
    exit
else
    echo "JAVA_HOME is not defined, define it and re-run srcipt!!! "
    exit
fi

