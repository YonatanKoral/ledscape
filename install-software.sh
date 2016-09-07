#!/usr/bin/env bash

if [[ -f ledscape.c ]]; then

	if [[ -f "/boot/dtbs/$(uname -r)/am335x-boneblack.dtb" ]]; then

		echo "Copying device tree files..."
		cp /boot/dtbs/$(uname -r)/am335x-boneblack.dtb{,.preledscape_bk}    
		cp devicetree/am335x-boneblack.dtb /boot/dtbs/$(uname -r)/ 
		cp /boot/dtbs/$(uname -r)/am335x-bonegreen.dtb{,.preledscape_bk}    
		cp devicetree/am335x-bonegreen.dtb /boot/dtbs/$(uname -r)/ 

		echo "Enabling kernel module..."	
		modprobe uio_pruss  

		echo "Making ledscape..."
		make

		echo "Done. Please enter reboot to reboot the machine and enable changes."
		
	else 
	
		echo "Could not find "/boot/dtbs/$(uname -r)/am335x-boneblack.dtb". Only works with the Wheezy version of Debian."
		exit -1
	
	fi
	
else
	echo "Could not find ledscape.c. Must run from inside the LEDscape directory."
	exit -1
fi
