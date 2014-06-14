#!/bin/bash

export AUDIODRIVER=alsa
export AUDIODEV=hw:1,0

trap ctrl_c INT

function ctrl_c() {
	echo "** Trapped Ctrl-C"
	exit 1
}

while [ 1 ] ; do
    sudo bash /home/pi/bats/scripts/reset.sh
    export TIMESTAMP=`date +%Y%m%d_%H%M%S`
#	nice -n -20 rec -V4 --single-threaded "raw/$TIMESTAMP.raw"
    sudo nice -n -20 rec -V --guard --single-threaded --buffer 32768 --channels 1 --rate 200k --bits 16 --encoding signed "/home/pi/bats/out/$TIMESTAMP.wav" silence 1 0.1 1% 1 0:00:02 1%
#	nice -n -20 sox --single-threaded -t alsa default --buffer 32768 "raw/$TIMESTAMP.wav" silence 1 0.1 1% 1 0:00:02 1%
#	nice -n -20 rec --buffer 32768 -t RAW "raw/$TIMESTAMP.raw" sinc 10k silence 1 0.001 5% 1 0:00:02 5%
#	sox -r 200k -b 16 -c 1 -e signed "raw/$TIMESTAMP.raw" "wav/$TIMESTAMP.wav"
done
