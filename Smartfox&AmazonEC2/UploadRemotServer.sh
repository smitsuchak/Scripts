#Script to upload SmartFox server on AmazonEC2
#Author : Smit Suchak
#Email : smitsuchak@gmail.com

#!/bin/sh

file=xyz.pem

chmod 400 $file

a="yes"
echo " Do you want to update zone.xml also? yes or no"
read b

JAR_DIR=/Applications/SmartFoxServer_2X/SFS2X/extensions/xyz/xxx.jar

ZONE_DIR=/Applications/SmartFoxServer_2X/SFS2X/zones/xxx.zone.xml

if [ $a == $b ];
then
 echo "Uploading zone file from location:$ZONE_DIR "
 echo "Uploading…"
 ssh -i $file ec2-user@xx.xx.xx.xx exec chmod 777 /home/ec2-user/uploadHere
 scp -i $file $ZONE_DIR ec2-user@xx.xx.xx.xx:/home/ec2-user/uploadHere
 echo "Copying to Zones folder…"
 ssh -i $file ec2-user@xx.xx.xx.xx "mv /home/ec2-user/uploadHere/xxx.zone.xml /home/ec2-user/Smartfox/SmartFoxServer_2X/SFS2X/zones"

echo "Uploading file from $JAR_DIR "
 ssh -i $file ec2-user@xx.xx.xx.xx exec chmod 777 /home/ec2-user/uploadHere
 scp -i $file $JAR_DIR ec2-user@xx.xx.xx.xx:/home/ec2-user/uploadHere
 echo "Copying to Extension folder…"
 ssh -i $file ec2-user@xx.xx.xx.xx "mv /home/ec2-user/uploadHere/xxxExtension.jar /home/ec2-user/Smartfox/SmartFoxServer_2X/SFS2X/extensions/xxx"

else
  echo "Uploading file from $JAR_DIR "
  echo "Uploading…"

ssh -i $file ec2-user@xx.xx.xx.xx exec chmod 777 /home/ec2-user/uploadHere
scp -i $file $JAR_DIR ec2-user@xx.xx.xx.xx:/home/ec2-user/uploadHere
echo "Copying to Extension folder…"
ssh -i $file ec2-user@xx.xx.xx.xx "mv /home/ec2-user/uploadHere/xxxExtension.jar /home/ec2-user/Smartfox/SmartFoxServer_2X/SFS2X/extensions/xxx"

echo "Uploaded the new jar on server…"
fi

d="yes"
echo "Restart SmartFox Server? yes or no"
read e

if [ $d == $e ];
then
echo "Restarting the Server… Keep Calm!"
ssh -i $file ec2-user@xx.xx.xx.xx /home/ec2-user/Smartfox/SmartFoxServer_2X/SFS2X/sfs2x-service restart
else
 echo "Thank You!. Have a great day…"
fi
