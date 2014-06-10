# The identifier for the ULTRAMIC200K seems to be the string below
switch=$(lsusb -d 0869:0305)
./usbreset /dev/bus/usb/${switch:4:3}/${switch:15:3}
