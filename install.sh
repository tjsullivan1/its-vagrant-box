#!/bin/bash -x

# Install packages
sudo yum install git -y
sudo yum install gcc -y
sudo yum install epel-release -y
sudo yum install python34-setuptools -y
sudo yum install python34-pip -y
sudo pip3 install --upgrade pip
sudo yum install dos2unix -y

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

### TODO ###
# Copy init_git_config.sh
# Add clones of ust-tf repos script
# Copy that script
