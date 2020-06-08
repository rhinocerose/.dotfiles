#!/bin/bash

user=$1

sudo groupadd -r autologin
sudo gpasswd -a $user autologin
sed -i 's/#autologin-user/autologin-user=$user/g' /etc/lightdm/lightdm.conf
