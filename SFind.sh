#!/bin/bash

#author = 'n0obit4'
#version = 'v1.0'
#Github = 'https://github.com/n0obit4'

#SHELL COLORS

RED="\033[1;31m"
GREEN='\e[1;32m'
YELLOW='\e[2;33m'
RST='\e[1;0m'

#VARIABLES
DIRECTORY=${1}
TEMP_FILE='/tmp/raw_comp'
HASH_FILE='/tmp/hash_comp'
NAME_FILE='/tmp/name_comp'
SIGN_FILE='/tmp/sign_comp'
HASH_REPT='/tmp/hash_rept_comp'

#CLEAR FILES
echo "" > $TEMP_FILE
echo "" > $HASH_FILE
echo "" > $NAME_FILE
echo "" > $SIGN_FILE
echo "" > $HASH_REPT

#VALUE OF ARGUMENTS
if [ ${#} -eq 0 ] 
then
    echo -e "$RED""Use: ${0} DIRECTORY"
    exit
elif [ ${#} -eq 1 ]
#ENUMERATING FILES
then 
    echo -e "[""$GREEN""*""$RST""]""Find Some files in diferent places."
    find $DIRECTORY -type f > $TEMP_FILE
fi
    
#TAKE MD5 FROM FOUND FILES
echo -e "[""$GREEN""+""$RST""]"" Calculating MD5 hash"
while read -e line; do
    md5sum $line >> $SIGN_FILE 2> /dev/null
done < $TEMP_FILE

#SEGMENTATING NAME AND HASH
cat $SIGN_FILE|cut -d " " -f 1 > $HASH_FILE
cat $SIGN_FILE|cut -d " " -f 3 > $NAME_FILE



#ENUMERATING HASH FILE
echo -e "[""$GREEN""+""$RST""]"" Enumerating hashes"
for hash in `cat $HASH_FILE`
do
    #IF HASH ARE TWO OR MORE THEN WORKING WITH THAT
    COUNT=`grep -c  $hash $SIGN_FILE`
    if [ $COUNT -gt 1 ] 
    then
        #GET CANT OF HASH IN FILE HASH_REPT; IF HASH NOT EXISTS IN FILE THEN APPEND ELSE USE OTHER
        REPT=`grep -c $hash $HASH_REPT`
        if [ $REPT -lt 1 ]; then
            echo $hash >> $HASH_REPT
        fi
    fi 
done

echo -e "[""$GREEN""+""$RST""]"" Result:"
#WORKING WITH HASH IN HASH_REPT
MATCH=0
for hashes in `cat $HASH_REPT`
do
    MATCH=$(($MATCH+1))
    echo ""
    echo -e "[""$GREEN""+""$RST""]""Match #"$MATCH
    echo ""
    #FIND FILES WITH THIS HASH
    grep $hashes $SIGN_FILE
done
