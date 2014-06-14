#!/bin/bash
HERE=`pwd`

echo "Settin up storage area for waves"
mkdir ~/bats
cd ~/bats
mkdir out
touch out/rec.log
touch out/rec.err

echo "Compiling usbreset utility"
ln -s $HERE 
cd scripts
gcc -o usbreset usbreset.c

echo "Configuring sys startup with audio capture"
cp .asoundrc ~/.asoundrc
sudo cp etc/interfaces /etc/network/interfaces
sudo cp etc/modules /etc/modules
sudo cp etc/rc.local /etc/rc.local


