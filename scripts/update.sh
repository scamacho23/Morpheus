#!/usr/bin/env sh

MORPHEUS_REPOSITORY=/usr/local/Morpheus

if [ -d "$MORPHEUS_REPOSITORY" ]; then
    echo Updating Morpheus
    cd "$MORPHEUS_DIRECTORY" && git pull
fi

