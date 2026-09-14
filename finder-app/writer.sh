#!/bin/sh

# Command to run
#./writer.sh /home/ben/gitfold/aeld-assignment-1/finder-app/testing.txt TestingScript1

# Variables inputted by user
writefile=$1
writestr=$2

# cd back into home directory so the script runs from whatever input is
cd / 

# 0 arguments provided by user, error check
if [ ! -n "$writefile" ] && [ ! -n "$writestr" ];
then
    echo "Both writefile and writestr are empty"
    exit 1
fi

# 1 argument provided by user, means second one wasn't passed in, error check
if [ ! -n "$writestr" ];
then
    echo "writestr is empty, no second argument"
    exit 1
fi

# Makes dir if non existent, for finder-test script
# -p creates parent direc, dirname removes the file name at end
mkdir -p "$(dirname "$writefile")"

# Creates the file and writes the string to it
echo "$writestr" > "$writefile"

# Error handling if file wasnt created
if [ ! -e ""$writefile"" ];
then
    echo "File failed to be created"
    exit 1
fi
