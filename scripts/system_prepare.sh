#!/bin/bash

sudo apt-get update

echo "Installing required software"
sudo apt-get install rpi-update git screen sox libsox2 libsox-fmt-all 

# Important update to get usb microphone to work.
# Source: http://www.raspyfi.com/raspberry-pi-usb-audio-fix/
sudo apt-get install rpi-update
sudo rpi-update


echo "Installing optional software"
sudo apt-get install ecasound r-base r-base-dev libfftw3-dev

# For command line client to IRC / XMPP etc
sudo apt-get install irssi irssi-plugin-otr irssi-plugin-xmpp


./install.sh



