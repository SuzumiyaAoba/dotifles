#!/bin/bash

__require_sudo() {
    if [ "$EUID" -ne 0 ]; then
        __error "Please run $(realpath $0) as root"
        exit 1
    fi
}

__sfrm() {
	  if [ -L $1 ]; then
		    unlink $1
	  else
		    rm -rf $1
	  fi
}

__exec() {
    output=$($@ 2>&1) || status=$?

    return $status
}

__lines() {
    grep -v -e '^\s*#' -e '^\s*$' "$1"
}


last_field() {
    echo "$1" | rev | cut -d ' ' -f1 | rev
}

__password() {
    if ! ${password+:} false; then
        printf "password: "
        read -s password
    fi
}

