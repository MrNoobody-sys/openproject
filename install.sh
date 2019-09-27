#!/bin/bash
clear
read -p "Install OpenProject For Ubuntu 18.04 Now? (y/n) " response

if [ "$response" == "y" ]; then
# Server Update And Upgrade
    sudo apt update && sudo apt upgrade -y
# Import the packager.io repository signing key
    wget -qO- https://dl.packager.io/srv/opf/openproject/key | sudo apt-key add -    
# Ensure that universe package source is added
    sudo add-apt-repository universe
# Add the OpenProject package source
    sudo wget -O /etc/apt/sources.list.d/openproject.list \
  https://dl.packager.io/srv/opf/openproject/stable/10/installer/ubuntu/18.04.repo
# Install the OpenProject Community Edition package  
    apt-get update
    apt-get install openproject
# run openproject configure
    sudo openproject configure
# server reboot
    sudo reboot now
fi
