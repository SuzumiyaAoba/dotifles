#!/bin/sh

info () {
    echo -e "\033[0;32m[info]\033[0;39m $1"
}

debug () {
    echo -e "\033[0;34m[info]\033[0;39m $1"
}

error () {
    echo -e "\033[0;31m[info]\033[0;39m $1"
}

warn () {
    echo -e "\033[0;33m[info]\033[0;39m $1"
}

lines () {
    grep -v -e '^\s*#' -e '^\s*$' $1
}
