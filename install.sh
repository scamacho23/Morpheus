#!/usr/bin/env bash

MORPHEUS_DIRECTORY=/usr/local/Morpheus 

INSTALLED_DIRECTORY=/usr/local/Morpheus/installed

BINARY_PATH=/usr/local/bin/morph

BINARY_LOCAL=/usr/local/Morpheus/morph

# Create the Morpheus directory in /usr/local
if [ ! -d "$MORPHEUS_DIRECTORY" ]; then
    echo Creating Morpheus directory in /usr/local...
    mkdir "$MORPHEUS_DIRECTORY"
fi

# Create the installed directory in /usr/local/Morpheus
if [ ! -d "$INSTALLED_DIRECTORY" ]; then
    echo Creating installed directory in /usr/local/Morpheus...
    mkdir "$INSTALLED_DIRECTORY"
fi

# Compile morpheus and add the binary to /usr/local/bin
if [ -f "$BINARY_PATH" ]; then
    # exit if the binary is already installed
    echo You seem to already have Morpheus installed on your system. Exiting...
    exit
else
    echo Building morph...
    # compile morpheus
    make
    # move the compiled version to /usr/local/Morpheus
    cp "morph" "$BINARY_LOCAL" 
    echo Symlinking morph into /usr/local/bin
    ln -s "$BINARY_LOCAL" "$BINARY_PATH"
fi



