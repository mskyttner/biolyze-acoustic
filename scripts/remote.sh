export AUDIODRIVER=alsa
ssh pi@192.168.0.100 "sox -t alsa hw:1,0 -p" | sox - -t alsa
