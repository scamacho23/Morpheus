#!/usr/bin/env bash

MORPHEUS_DIRECTORY="/usr/local/Morpheus" 

if [ ! -d "${MORPHEUS_DIRECTORY}" ]
then 
    echo Creating Morpheus directory in /usr/local...
    mkdir "${MORPHEUS_DIRECTORY}"
fi




