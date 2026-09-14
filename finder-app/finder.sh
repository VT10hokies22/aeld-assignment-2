#!/bin/sh

# Variables inputted by user
filesdir=$1
searchstr=$2

# cd back into home directory so the script runs from whatever input is
cd / 

# Go to directory provided
cd "$filesdir"

# Command run
# ./finder.sh /home/ben/gitfold/aeld-assignment-1 assignment1

# 0 arguments provided by user, error check
if [ ! -n "$filesdir" ] && [ ! -n "$searchstr" ];
then
    echo "Both filesdir and searchstr are empty"
    exit 1
fi

# 1 argument provided by user, error check
if [ ! -n "$searchstr" ];
then
    echo "searchstr is empty, no second argument"
    exit 1
fi

if [ ! -d "$filesdir" ];
then
    echo "filesdir isn't a directory"
    exit 1
fi

# Find files at path, expression looking for files
# Pipe so have the files in prex then need to count num of lines
# Need -L for symbolic links. Everything was symbolic
prex=$( find -L "$filesdir" -type f )
x=$(echo "$prex" | wc -l )

# Count the number of matching lines in the files
y=$(grep -r "$searchstr" * | wc -l )

# For visual, which files have the matching lines
#py=$(grep -r "$searchstr" *)
#echo "hh $py"

# Print result
echo "The number of files are $x and the number of matching lines are $y" 
