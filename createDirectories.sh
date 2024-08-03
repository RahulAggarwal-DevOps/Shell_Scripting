#!/bin/bash

<<comment
This script takes directory name, start number of directories, and end number of directories from user as argument and creates the directories.

./createDirectories.sh <dir_name> <start_num> <end_num>
comment


for (( i="$2"; i<="$3"; i++ ))
do
        mkdir "$1$i"
done
