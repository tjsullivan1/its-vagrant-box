#!/bin/bash -x

# Login to AWS via SAML
python3 /opt/tools/aws_saml_auth/aws_saml_auth.py

# Configure git to know what to do with CodeCommit Repos
git config --global credential.https://git-codecommit.us-east-1.amazonaws.com.helper '!aws codecommit credential-helper $@'
git config --global credential.https://git-codecommit.us-east-1.amazonaws.com.UseHttpPath true

git config --global credential.https://git-codecommit.us-east-2.amazonaws.com.helper '!aws codecommit credential-helper $@'
git config --global credential.https://git-codecommit.us-east-2.amazonaws.com.UseHttpPath true

# Clone tooling repository
mkdir Code
cd Code/
git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/ITS-Tooling
