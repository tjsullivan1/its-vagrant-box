#!/bin/bash -x

# Configure git to know what to do with CodeCommit Repos
git config --global credential.https://git-codecommit.us-east-1.amazonaws.com.helper '!aws codecommit credential-helper $@'
git config --global credential.https://git-codecommit.us-east-1.amazonaws.com.UseHttpPath true

git config --global credential.https://git-codecommit.us-east-2.amazonaws.com.helper '!aws codecommit credential-helper $@'
git config --global credential.https://git-codecommit.us-east-2.amazonaws.com.UseHttpPath true