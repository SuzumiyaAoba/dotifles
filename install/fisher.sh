#!/bin/bash

. ../util.sh

if !(fish -c "type fisher > /dev/null 2>&1"); then
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fi

packages=(`lines fisher | xargs`)

for package in "${packages[@]}"
do
    fish -c "fisher add ${package}"
done
