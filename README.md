biolyze-acoustic
================

Wide spectrum acoustic analysis for biological implementations

Get the OS here:

wget http://downloads.raspberrypi.org/raspbian_latest

Collaboration workflow:

http://code.tutsplus.com/tutorials/how-to-collaborate-on-github--net-34267

DONE:

* Fix garbled .wav quality
	* This required a firmware update on the RPi, sudo apt-get install rpi-update && sudo rpi-update
* Add config for usb modem
	* Used eth0 with cable to MR 3020 with USB modem
* Add htpdate config for correct time
	* Does not seem to be needed with latest Raspian OS (used ntpdate out of box)
* Add github clone command to get sw from github
	* Added a initial install.sh script and INSTALLATION.txt 
* Add poor mans DNS - something like echo "172.16.23.46" | pastebinit -b http://paste.ubuntu.com
	* Will use other mechanism to call home to base
* Add crontab:ed tarball updating also from github
	* Will not be required, can use git clone method instead, crontabbed

TODO:

* Add scripts to /home/user/bin so they end up in path?
	* Proper rc scripts (upstart) instead of rc.local?
	* Does Debian use ~/bin like Ubuntu?
	* Fix absolute paths in all scripts
	* Test and verify that logging works
* More robust service
	* Move data from SD to USB storage regularly
		* If USB storage exists, move data to it
		* While not USB, store on SD
		* Support in-operation unplug and replug of USB
	* Heartbeat and status reports when network is up
		* IRC, twitter
	* Upload data when network is up
		* scp to base
	* Service entrance opening
		* ssh rev tunnel kept alive at base?
	* Harakiri ICE
	* Fresh beginnings
		* remove all system log files not needed
		* clean up history 
		* remove all data
	* What to do when disk space ends?
		* Automatically delete oldest stuff
	* What to do when process fails?
		* Automatically restart process
* Processing to be done at base
	* Add conversion from raw to wav to transposed mp3 (?)
		* Use csound and pitch down bat sounds to hearable
	* Add html overview (spectrograms with jplayer capabilities)
		

