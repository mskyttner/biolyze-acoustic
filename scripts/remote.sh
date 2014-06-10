export AUDIODRIVER=alsa
ssh root@172.16.23.21 "sox -t alsa hw:1,0 -p" | sox - -t alsa
