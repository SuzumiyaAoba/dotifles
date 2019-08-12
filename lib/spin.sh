#!/bin/bash

source "${BASH_SOURCE%/*}/util.sh"

__spin() {
    pid=$!

    spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'

    i=0
    while kill -0 $pid 2>/dev/null
    do
        i=$(( (i+1) % 10 ))
        __progress "$1 ${spin:$i:1} $2"
        sleep .1
    done

    return $(wait "$pid")
}
