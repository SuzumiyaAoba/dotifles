#!/bin/bash

__escape_reset="\e[m"

__fg_default="\e[39m"
__fg_black="\e[30m"
__fg_red="\e[31m"
__fg_green="\e[32m"
__fg_yellow="\e[33m"
__fg_blue="\e[34m"
__fg_magenta="\e[35m"
__fg_cyan="\e[36m"
__fg_lightgray="\e[37m"

__fg_darkgray="\e[90m"
__fg_lightred="\e[91m"
__fg_lightgreen="\e[92m"
__fg_lightyellow="\e[93m"
__fg_lightblue="\e[94m"
__fg_lightmagenta="\e[95m"
__fg_lightcyan="\e[96"
__fg_white="\e[97m"

__bg_default="\e[49m"
__bg_black="\e[40m"
__bg_red="\e[41m"
__bg_green="\e[42m"
__bg_yellow="\e[43m"
__bg_blue="\e[44m"
__bg_magenta="\e[45m"
__bg_cyan="\e[46m"
__bg_lightgray="\e[47m"

__bg_darkgray="\e[100m"
__bg_lightred="\e[101m"
__bg_lightgreen="\e[102m"
__bg_lightyellow="\e[103m"
__bg_lightblue="\e[104m"
__bg_lightmagenta="\e[105m"
__bg_lightcyan="\e[106m"
__bg_white="\e[107m"

__text_bold="\e[1m"
__text_dim="\e[2m"
__text_underlined="\e[4m"
__text_blink="\e[5m"
__text_reverse="\e[7m"
__text_hidden="\e[8m"

Default() {
    echo -ne "\e[39m$1\e[m"
}

Black() {
    echo -ne "\e[30m$1\e[m"
}

Red() {
    echo -ne "\e[31m$1\e[m"
}

Green() {
    echo -ne "\e[32m$1\e[m"
}

Yellow() {
    echo -ne "\e[33m$1\e[m"
}

Blue() {
    echo -ne "\e[34m$1\e[m"
}

Magenta() {
    echo -ne "\e[35m$1\e[m"
}

Cyan() {
    echo -ne "\e[36m$1\e[m"
}

LightGray() {
    echo -ne "\e[37m$1\e[m"
}

DarkGray() {
    echo -ne "\e[90m$1\e[m"
}

LightRed() {
    echo -ne "\e[91m$1\e[m"
}

LightGreen() {
    echo -ne "\e[92m$1\e[m"
}

LightYellow() {
    echo -ne "\e[93m$1\e[m"
}

LightBlue() {
    echo -ne "\e[94m$1\e[m"
}

LightMagenta() {
    echo -ne "\e[95m$1\e[m"
}

LightCyan() {
    echo -ne "\e[96m$1\e[m"
}

White() {
    echo -ne "\e[97m$1\e[m"
}
