#!/bin/bash
uname="YOUR_PIA_USERNAME"
pass="YOUR_PIA_PASSWORD"

if [ ! -f ~/.pia_client_id ]; then
head -n 100 /dev/urandom | md5sum | tr -d " -" > ~/.pia_client_id
ip=$(ifconfig tun0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')
curl -d "user=$uname&pass=$pass&client_id=$(cat ~/.pia_client_id)&local_ip=$ip" https://www.privateinternetaccess.com/vpninfo/port_forward_assignment

else
rm ~/.pia_client_id
head -n 100 /dev/urandom | md5sum | tr -d " -" > ~/.pia_client_id
ip=$(ifconfig tun0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')
curl -d "user=$uname&pass=$pass&client_id=$(cat ~/.pia_client_id)&local_ip=$ip" https://www.privateinternetaccess.com/vpninfo/port_forward_assignment

fi
