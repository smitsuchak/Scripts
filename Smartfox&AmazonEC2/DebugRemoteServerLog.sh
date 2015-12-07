#!/bin/sh

echo "Check if the .pem file is in the same directory"

file=xyz.pem
if [ -f "$file" ];
then
	echo "$file found."
	chmod 400 $file
	echo "Connecting to remote server…"
	ssh -i $file ec2-user@xx.xx.xx.xx "tail -f /home/ec2-user/Smartfox/SmartFoxServer_2X/SFS2X/logs/smartfox.log" 
else
	echo "$file not found."
fi




