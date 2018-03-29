#!/bin/bash -x

# Login to AWS via SAML
python3 /opt/tools/aws_saml_auth/aws_saml_auth.py

# Configure git to know what to do with CodeCommit Repos
git config --global credential.https://git-codecommit.us-east-1.amazonaws.com.helper '!aws codecommit credential-helper $@'
git config --global credential.https://git-codecommit.us-east-1.amazonaws.com.UseHttpPath true

git config --global credential.https://git-codecommit.us-east-2.amazonaws.com.helper '!aws codecommit credential-helper $@'
git config --global credential.https://git-codecommit.us-east-2.amazonaws.com.UseHttpPath true

git config --global credential.https://git-codecommit.us-west-2.amazonaws.com.helper '!aws codecommit credential-helper $@'
git config --global credential.https://git-codecommit.us-west-2.amazonaws.com.UseHttpPath true

# Perform some basic git configurations
git config --global push.default simple

# Clone tooling repository
mkdir Code
cd Code/
git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/ITS-Tooling

# Copy the account_ids file
sudo cp ITS-Tooling/account_ids.txt /opt/tools/aws_saml_auth/account_ids.txt
