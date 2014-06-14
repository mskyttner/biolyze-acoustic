# Set up storage area for waves
mkdir ~/bats
cd ~/bats
mkdir out
touch out/rec.log
touch out/rec.err

# Compile usbreset utility
ln -s ~/biolyze-acoustic/scripts
cd scripts
gcc -o usbreset usbreset.c

# Configure sys startup with audio capture
cp .asoundrc ~/.asoundrc
sudo cp interfaces /etc/network/interfaces
sudo cp modules /etc/modules
sudo cp rc.local /etc/rc.local


