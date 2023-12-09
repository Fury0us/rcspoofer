#!/bin/bash

winterface=$(iwconfig 2>/dev/null | awk '/^[a-z]/ {print $1; exit}')

hashed_password=$(echo -n '' | base64 -d)

echo $hashed_password | sudo -S ifconfig $winterface down
sleep 0.5

# Rest of your script...

echo $hashed_password | sudo -S ifconfig $winterface down
sleep 0.5

# Start MAC Address Generation
# Extract the first half of the MAC address from the vendor
first_half=$(macchanger -l | awk '{print $3}' | shuf -n 1)

# Generate the second half of the MAC address randomly
second_half=""
for i in {1..6}; do
  random_hex=$(openssl rand -hex 1)
  second_half="${second_half}${random_hex}"
  if [ $i -ne 6 ]; then
    second_half="${second_half}:"
  fi
done

# Remove the unnecessary extra characters from the right
second_half=${second_half::-9}
macaddr=${first_half}:${second_half}
sleep 0.5
echo $hashed_password | sudo -S macchanger -m $macaddr $winterface >/dev/null
echo -en '\n'
sleep 0.5
echo $hashed_password | sudo -S ifconfig $winterface inet 192.168.$(( RANDOM % 256 )).$(( RANDOM % 256 )) netmask 255.255.255.0 broadcast 192.168.$(( RANDOM % 256 )).$(( RANDOM % 256 ))
sleep 0.5
echo $hashed_password | sudo -S ifconfig $winterface inet 192.168.$(( RANDOM % 256 )).$(( RANDOM % 256 )) netmask 255.255.255.0 broadcast 192.168.$(( RANDOM % 256 )).$(( RANDOM % 256 ))
sleep 0.5
echo $hashed_password | sudo -S ifconfig $winterface inet 192.168.$(( RANDOM % 256 )).$(( RANDOM % 256 )) netmask 255.255.255.0 broadcast 192.168.$(( RANDOM % 256 )).$(( RANDOM % 256 ))
sleep 0.5
echo $hashed_password | sudo -S ifconfig $winterface up
clear
