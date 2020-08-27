#!/bin/bash

# Get a tar archieve name from user
userArchiveName=$1

# Create a temporary directory (-d, or --directory)

# Run tar and extract archive into a temporary directory "mktemp," option -d (--directory)
# Options: -xf -> extract all files from the archive
tar -C `mktemp -d` -xf $userArchiveName 
