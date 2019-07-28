#!/bin/sh

info() {
    echo -e "\e[32m[info]\e[m $1"
}

progress() {
    echo -en "\r\e[32m[progress]\e[m $1"
}

debug() {
    echo -e "\e[34m[debug]\e[m $1"
}

error () {
    echo -e "\e[31m[error]\e[m $1"
}

warn() {
    echo -e "\e[33m[warn]\e[m $1"
}

lines() {
    grep -v -e '^\s*#' -e '^\s*$' "$1"
}

last_field() {
    echo "$1" | rev | cut -d ' ' -f1 | rev
}

sfrm() {
	if [ -L $1 ]; then
		unlink $1
	else
		rm -rf $1
	fi
}

password() {
    if ! ${password+:} false
    then
        printf "password: "
        read -s password
    fi
}

progress_indicator() {
    pid=$! # Process Id of the previous running command

    spin='-\|/'

    i=0
    while kill -0 $pid 2>/dev/null
    do
        i=$(( (i+1) %4 ))
        progress "$1 ${spin:$i:1}"
        sleep .1
    done

    echo ""
    wait "$pid"
    result=$?
}
