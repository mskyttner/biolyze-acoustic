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
# set default playback device to line out, recording device to usb microphone
cp ../lib/.asoundrc ~/.asoundrc
sudo cp ../lib/etc/modules /etc/modules
# ensure the sound cards consistently are given the same order
sudo cp ../lib/etc/modprobe.d/modprobe.conf /etc/modprobe.d/modprob.conf
sudo cp ../lib/etc/rc.local /etc/rc.local

echo "Network configuration"
echo "Type 's' to setup rPi as a dhcp-server and enable NAT/DNS forwarding."
echo "  Conventient if you are connecting directly from a PC and want to use" 
echo "  the rPi as a router."
read nw
if [ "$nw" = "s" ] || [ "$nw" = "S" ]; then
    echo "Setting up dnsmasq and nat forwarding"
    # configure static network address
    sudo /etc/init.d/networking stop
    sudo killall dhclient
    sudo cp ../lib/etc/interfaces.server /etc/network/interfaces
    sudo /etc/init.d/networking start

    # configure dnsmasq
    sudo apt-get install dnsmasq
    sudo cp ../lib/etc/dnsmasq.conf /etc
    sudo /etc/init.d/dnsmasq restart

    # enable nat forwarding
    sudo cp ../lib/forward-nat /etc/init.d
    sudo chmod +x /etc/init.d/forward-nat
    sudo update-rc.d forward-nat defaults
    sudo /etc/init.d/forward-nat start

else
    echo "Setting up dhcp client"
    sudo cp ../lib/etc/interfaces.client /etc/network/interfaces
fi

echo "Setting up Huawei 3G modem"
# the settings in /etc/module will automatically initiate a mode switch for Huawei E3131 dongle
sudo apt-get install usb-modeswitch
