#!/bin/bash

# Get a number input from user
userNumberInput=""

numRegex='[0-9]$' ## Regex for "a digit"

# Ask user for number until a correct input is given
# Based on https://stackoverflow.com/a/60274328
until [[ $userNumberInput =~ $numRegex ]]
do
    echo Please enter a number
    read userNumberInput
done


# Extract NthPrime.tgz
# Options: -xf -> extract all files from the archive
tar -xf NthPrime.tgz
