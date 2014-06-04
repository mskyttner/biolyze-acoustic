export AUDIODEV=hw:1,0
export TIMESTAMP=`date +%Y%m%d_%H%M%S`
nice -n -20 rec --buffer 32768  -c 1 -r 200k -b 16 -e signed "wav-$TIMESTAMP.wav" sinc 10k silence 1 0.001 1% 1 0:00:05 1%
