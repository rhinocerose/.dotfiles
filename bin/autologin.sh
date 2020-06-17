#!/bin/bash
user=$1
sudo groupadd -r autologin
sudo gpasswd -a $user autologin

