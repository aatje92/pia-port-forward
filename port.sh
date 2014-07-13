if [ ! -f ~/.pia_client_id ]; then
head -n 100 /dev/urandom | md5sum | tr -d " -" > ~/.pia_client_id
else

ip=$(ifconfig tun0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')
curl -d "user=YOUR_PIA_USERNAME&pass=YOUR_PIA_PASSWORD&client_id=$(cat ~/.pia_client_id)&local_ip=$ip" https://www.privateinternetaccess.com/vpninfo/port_forward_assignment

