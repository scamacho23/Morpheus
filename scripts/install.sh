#!/usr/bin/env sh

MORPHEUS_PREFIX=/usr/local

MORPHEUS_REPOSITORY=/usr/local/Morpheus

MORPH_REPO=https://github.com/scamacho23/Morpheus

MATRIX_DIRECTORY=/usr/local/Matrix

BINARY_SYM_PATH=/usr/local/bin/morph

BINARY_LOCAL_DIRECTORY=/usr/local/Morpheus/bin

MORPH_INITIAL_PATH=/usr/local/Morpheus/morph

BINARY_LOCAL_PATH=/usr/local/Morpheus/bin/morph

CONFIGURE_PATH=/usr/local/Morpheus/configure

if ! command -v git >/dev/null; then
    echo Morpheus requires git to function properly. Please install git.
    exit 1
fi

if ! command -v curl >/dev/null; then
    echo Morpheus requires curl to function properly. Please install git.
    exit 1
fi

echo This installation script will install a few directories and files which Morpheus requires to function properly:
echo "$MORPHEUS_REPOSITORY"
echo "$INSTALLED_DIRECTORY"
echo "$BINARY_LOCAL_DIRECTORY"
echo "$BINARY_LOCAL_PATH"
echo "$BINARY_SYM_PATH" -- as a symlink


# string formatters taken from homebrew installation script
# TODO: add string formatting
# if [ -t 1 ]; then
#  tty_escape()  printf "\033[%sm" "$1"; 
# else
#  tty_escape()  :; 
# fi
# tty_mkbold()  tty_escape "1;$1"; 
# tty_underline=(tty_escape "4;39")
# tty_blue="$(tty_mkbold 34)"
# tty_red="$(tty_mkbold 31)"
# tty_bold="$(tty_mkbold 39)"
# tty_reset="$(tty_escape 0)"


cd "$MORPHEUS_PREFIX" || exit

# Create the Morpheus directory in /usr/local
if [ ! -d "$MORPHEUS_REPOSITORY" ]; then
    git clone "$MORPH_REPO"
fi

# Create the installed directory in /usr/local
if [ ! -d "$MATRIX_DIRECTORY" ]; then
    echo Creating Matrix directory in /usr/local...
    echo \'Matrix\' is where your upgrades live \(upgrades are what we call your installed packages\)
    mkdir "$MATRIX_DIRECTORY"
fi

# Give the user permissions over installed directories and files
chown -R "$USER" "$MORPHEUS_REPOSITORY"
chown -R "$USER" "$MATRIX_DIRECTORY"

# Compile morpheus and add the binary to /usr/local/bin
if [ -f "$BINARY_SYM_PATH" ]; then
    # exit if the binary is already installed
    echo You seem to already have Morpheus installed on your system. Exiting...
    exit
else
    # create a symlink of of morph in /usr/local/bin
    echo Linking morph into /usr/local/bin...
    ln -s "$BINARY_LOCAL_PATH" "$BINARY_SYM_PATH"
fi

