#!/bin/bash

source "${BASH_SOURCE%/*}/color.sh"

__success_mark="✓"
__fail_mark="✗"

__info() {
    echo -e "${__text_bold}${__fg_green}[INFO]${__escape_reset}\t$1"
}

__debug() {
    echo -e "${__text_bold}${__fg_blue}[DEBUG]${__escape_reset}\t$1"
}

__error() {
    echo -e "${__text_bold}${__fg_red}[ERROR]${__escape_reset}\t$1"
}

__warn() {
    echo -e "${__text_bold}${__fg_yellow}[ERROR]${__escape_reset}\t$1"
}

__progress() {
    __clear_line
    echo -ne "${__fg_green}[INFO]${__escape_reset}\t$1"
}

__success() {
    __clear_line
    echo -e "${__text_bold}${__fg_green}[INFO]${__escape_reset}\t$1${__fg_green}${__success_mark}${__escape_reset} $2"
}

__fail() {
    __clear_line
    echo -e "${__text_bold}${__fg_red}[ERROR]${__escape_reset}\t$1${__fg_red}${__fail_mark}${__escape_reset} $2"
}

__clear_line() {
    echo -ne "\r\e[K"
}
