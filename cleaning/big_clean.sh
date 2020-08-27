#!/bin/bash

# Get a tar archieve name from user
userArchiveName=$1

# Create a temporary directory (-d, or --directory)
# Save the path string to the temporaryDirectory variable
temporaryDirectory=`mktemp -d`

# Run tar and extract archive into a temporary directory whose path is saved
# in the variable temporaryDirectory
# Options: -xf -> extract all files from the archive
tar -C $temporaryDirectory -xf $userArchiveName 

# Explain
find $temporaryDirectory | grep -w "DELETE ME!"  | xargs rm -f

# Before going to the temporary directory, we save our current path
currentPath=$(pwd)

# Go to temporary directory
cd $temporaryDirectory

