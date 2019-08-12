#!/bin/bash

# sbt のインストール

# echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt.list
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
# sudo apt update
# sudo apt install sbt

source "${BASH_SOURCE%/*}/../lib/libs.sh"

__info "━━…━━…━━…━━…━━…━━ Install sbt ━━…━━…━━…━━…━━…━━"

__require_sudo

__info "Add sources"

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt.list &> /dev/null

__exec sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 &
__spin "\b" "Adding apt-key"

if [ "$?" != "0" ]; then
    __fail "" "Fail to add apt-key"
    exit 1
fi

__success "" "Added apt-key"

__exec sudo apt update &
__spin "\b" "Updating package lists"

if [ "$?" != "0" ]; then
    __fail "" "Fail to update package list"
    exit 1
fi

__success "" "Update package lists"

__exec sudo apt install sbt &
__spin "\b" "Installing sbt"

if [ "$?" != "0" ]; then
    __fail "" "Fail to install sbt"
    exit 1
fi

__success "" "Complete to install sbt"

__info "━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━"
