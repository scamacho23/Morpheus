#!/usr/bin/env sh

MORPHEUS_DIRECTORY=/usr/local/Morpheus 

INSTALLED_DIRECTORY=/usr/local/Matrix

BINARY_SYM_PATH=/usr/local/bin/morph

BINARY_LOCAL_DIRECTORY=/usr/local/Morpheus/bin

BINARY_LOCAL_PATH=/usr/local/Morpheus/morph

INSTALL_LINK=https://github.com/scamacho23/morpheus


# Create the Morpheus directory in /usr/local
if [ ! -d "$MORPHEUS_DIRECTORY" ]; then
    echo Cloning Morpheus directory in /usr/local...
    git clone "$INSTALL_LINK" "$MORPHEUS_DIRECTORY"
fi

cd "$MORPHEUS_DIRECTORY" || exit

# Create the installed directory in /usr/local
if [ ! -d "$INSTALLED_DIRECTORY" ]; then
    echo Creating Matrix directory in /usr/local...
    echo \'Matrix\' is where your upgrades live \(upgrades are what we call your installed packages\)
    mkdir "$INSTALLED_DIRECTORY"
fi

# Compile morpheus and add the binary to /usr/local/bin
if [ -f "$BINARY_SYM_PATH" ]; then
    # exit if the binary is already installed
    echo You seem to already have Morpheus installed on your system. Exiting...
    exit
else
    echo Building morph...
    # Create local bin to hold morph executable
    if [ ! -d "$BINARY_LOCAL_DIRECTORY" ]; then
        echo Creating bin in /usr/local/Morpheus
        mkdir "$BINARY_LOCAL_DIRECTORY"
    fi
    # compile morpheus
    make
    # move the compiled version to /usr/local/Morpheus
    mv "morph" "$BINARY_LOCAL_PATH" 
    echo Symlinking morph into /usr/local/bin
    ln -s "$BINARY_LOCAL_PATH" "$BINARY_SYM_PATH"
fi

cd ~ || exit



