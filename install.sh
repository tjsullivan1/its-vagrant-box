#!/bin/bash -x

# Update box
sudo apt-get update -y
# Do not upgrade box -- this includes a GRUB update that I haven't worked through sudo apt-get upgrade -y

# Install packages
sudo apt-get install python3-pip -y
sudo apt-get install dos2unix -y

sudo pip3 install --upgrade pip

# Create tooling directory
sudo mkdir -p /opt/tools

# Prepare tooling directory
cd /opt/tools
sudo git clone https://gist.github.com/8e489e68f3b7b5c0827540795cef2608.git
sudo mv 8e489e68f3b7b5c0827540795cef2608 install_hashi_tools

# Download and install all hashi tools...
cd install_hashi_tools
sudo python3 install_hashi_tools.py

# Download the aws_saml_auth.py script and prepare it
cd /opt/tools
sudo git clone https://github.com/tjsullivan1/aws_saml_auth.git
sudo pip3 install boto3 bs4 awscli requests configparser lxml plac

# Install pre-commit package manager
sudo pip3 install pre-commit

# Make sure that we can run our initialization script.
dos2unix /vagrant/init_git_config.sh

# Change our timezone to central US
sudo timedatectl set-timezone America/Chicago
