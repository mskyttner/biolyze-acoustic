export AUDIODRIVER=alsa
export AUDIODEV=hw:1,0
export TIMESTAMP=`date +%Y%m%d_%H%M%S`

nice -n -20 rec --buffer 32768 -t RAW "raw/$TIMESTAMP.raw" sinc 10k silence 1 0.
001 8% -1 0:00:05 8%
sox -r 200k -b 16 -c 1 -e signed "raw/$TIMESTAMP.raw" "wav/$TIMESTAMP.wav"
