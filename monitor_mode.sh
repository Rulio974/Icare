#!/bin/bash


if [[ $# != 1 ]]
then
	echo "erreur arguments"
	exit 0
fi


sudo ifconfig $1 down
sudo iwconfig $1 mode monitor
sudo ifconfig $1 up

