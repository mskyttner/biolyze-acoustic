# lsmod | grep snd_bcm2835
# modprobe snd_bcm2835
# modprobe snd_bcm2835
# lsmod |grep snd_bcm2835

This time it shows the sound modules have been loaded, if they were not automatically loaded then you need to add the sound module for the Raspberry Pi to /etc/modules.

# vi /etc/modules 

# /etc/modules: kernel modules to load at boot time.
#
# This file contains the names of kernel modules that should be
# loaded at boot time, one per line. Lines beginning with "#" are
# ignored. Parameters can be specified after the module name.

loop
snd-bcm2835




To test that everything is working use the following command to play one of the test sounds installed with the ALSA package.

# speaker-test -t sine -f 440 -c 2 -s 1
# speaker-test -t sine -f 440 -c 2 -s 2
# aplay /usr/share/sounds/alsa/Front_Center.wav

