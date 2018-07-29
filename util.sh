#!/bin/sh

info () {
    echo -e "\e[32m[info]\e[m $1"
}

debug () {
    echo -e "\e[34m[info]\e[m $1"
}

error () {
    echo -e "\e[31m[info]\e[m $1"
}

warn () {
    echo -e "\e[33m[info]\e[m $1"
}

lines () {
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
