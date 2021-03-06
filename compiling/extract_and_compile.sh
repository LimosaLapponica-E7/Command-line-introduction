#!/bin/bash

# Get a number input from user
userNumberInput=$1

# Orignial attempt
# I didn't read what the tests expected here
# numRegex='[0-9]$' ## Regex for "a digit"

# Ask user for number until a correct input is given
# Based on https://stackoverflow.com/a/60274328
# until [[ $userNumberInput =~ $numRegex ]]
# do
#     echo Please enter a number
#     read userNumberInput
# done


# Extract NthPrime.tgz
# Options: -xf -> extract all files from the archive
tar -xf NthPrime.tgz

# Go into the new directory for C files; exit if cd fails
cd NthPrime || exit

# Complile the individual C files
gcc -Wall -g -c main.c
gcc -Wall -g -c nth_prime.c

# Combine the two executable files using gcc's -o option
gcc -o NthPrime main.o nth_prime.o -lm

# Clean up by removing executables no longer used
rm main.o nth_prime.o

# Run the program with out input
./NthPrime "$userNumberInput"
