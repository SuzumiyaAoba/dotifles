#!/bin/sh

if !(fish -c "type fisher > /dev/null 2>&1"); then
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fi

