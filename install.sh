#!/usr/bin/env sh

MORPHEUS_DIRECTORY=/usr/local/Morpheus 

INSTALLED_DIRECTORY=/usr/local/Matrix

BINARY_SYM_PATH=/usr/local/bin/morph

BINARY_LOCAL_DIRECTORY=/usr/local/Morpheus/bin

BINARY_LOCAL_PATH=/usr/local/Morpheus/morph

INSTALL_LINK=https://github.com/scamacho23/morpheus


# Create the Morpheus directory in /usr/local
if [ ! -d "$MORPHEUS_DIRECTORY" ]; then
    echo \033[1mCloning Morpheus directory in /usr/local...\033[0m
    git clone "$INSTALL_LINK" "$MORPHEUS_DIRECTORY"
fi

cd "$MORPHEUS_DIRECTORY" || exit

# Create the installed directory in /usr/local
if [ ! -d "$INSTALLED_DIRECTORY" ]; then
    echo \033[1mCreating Matrix directory in /usr/local...\033[0m
    echo \033[1m\'Matrix\' is where your upgrades live \(upgrades are what we call your installed packages\)\033[0m
    mkdir "$INSTALLED_DIRECTORY"
fi

# Compile morpheus and add the binary to /usr/local/bin
if [ -f "$BINARY_SYM_PATH" ]; then
    # exit if the binary is already installed
    echo \033[1mYou seem to already have Morpheus installed on your system. Exiting...\033[0m
    exit
else
    echo \033[1mBuilding morph...\033[0m
    # Create local bin to hold morph executable
    if [ ! -d "$BINARY_LOCAL_DIRECTORY" ]; then
        echo \033[1mCreating bin in /usr/local/Morpheus...\033[0m
        mkdir "$BINARY_LOCAL_DIRECTORY"
    fi
    # compile morpheus
    make
    # move the compiled version to /usr/local/Morpheus
    mv "morph" "$BINARY_LOCAL_PATH" 
    echo \033[1mSymlinking morph into /usr/local/bin...\033[0m
    ln -s "$BINARY_LOCAL_PATH" "$BINARY_SYM_PATH"
fi

cd ~ || exit



