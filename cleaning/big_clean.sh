#!/bin/bash

# Get a tar archieve name from user
userArchiveName=$1

# Create a temporary directory (-d, or --directory)
# Save the path string to the temporaryDirectory variable
temporaryDirectory=$(mktemp -d)

# Run tar and extract archive into a temporary directory whose path is saved
# in the variable temporaryDirectory
# Options: -xf -> extract all files from the archive
tar -C "$temporaryDirectory" -xf "$userArchiveName"

# Before going to the temporary directory, we save our current path
programHomePath=$(pwd)

# Go to temporary directory; exit if unable
cd "$temporaryDirectory" || exit

# Keep the name of the listed directory (we know we only created one directory)
directoryName=$(ls)

## Change to the directory containing the files to be deleted; exit if unable
cd "$directoryName" || exit

# Use grep to search for term "DELETE ME" in files
# xargs -> rm: remove files that are matches
# grep options recursive and list selected
grep -rl "DELETE ME!" | xargs rm

# Save archive file name
archiveName="cleaned_${userArchiveName}"

# Move back one directory so that the entire directory containing the files may be archived
# Exit if unable
cd "$temporaryDirectory" || exit

# Archive directory containing files
# c create archive, z compress with gzip, f specify file name
tar -czf "$archiveName" "$directoryName"

# Move archive to project directory 
mv "$temporaryDirectory"/"$archiveName" "$programHomePath"