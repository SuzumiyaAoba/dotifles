#!/bin/sh

. ../util.sh

mkdir -p ~/go/bin

packages=`lines go`

OLDIFS=$IFS
IFS=$'
'

for line in $packages
do
    package=$(last_field "$line")
    info "install $package"
    eval 'go get $line'
done

IFS=$OLDIFS
