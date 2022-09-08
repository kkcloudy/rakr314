#!/bin/bash -e

on_chroot << EOF

# Configure Network Manager
sed -i "s/managed=false/managed=true/g" "/etc/NetworkManager/NetworkManager.conf"
echo "denyinterfaces wlan0" >> "/etc/dhcpcd.conf"

EOF


