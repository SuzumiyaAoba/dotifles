#!/bin/bash

source "${BASH_SOURCE%/*}/../lib/libs.sh"


__info "━━…━━…━━…━━…━━…━━ Upgrade packages ━━…━━…━━…━━…━━…━━"

# ルート権限で実行しているか確認
__require_sudo

# package lists の更新
__exec apt-get update &
__spin "\b" "Updating package lists"

if [ "$?" = "0" ]; then
    __success "" "Update package lists"
else
    __fail "" "Fail to update package lists"
fi

LANG=C

# アップグレード可能なパッケージリストを取得
response=$(apt-get upgrade -s)

readarray -t packages < <(echo -n "$response"  | grep -e "^Inst" | cut -d " " -f2)

LANG=ja_JP.UTF-8

line=$(echo "$response" | grep -wP '[0-9]+ upgraded')
upgraded=$(echo $line | grep -oP '([0-9+]+)(?= upgraded)')
newly=$(echo $line | grep -oP '([0-9+]+)(?= newly installed)')
remove=$(echo $line | grep -oP '([0-9+]+)(?= to remove)')
not_upgrade=$(echo $line | grep -oP '([0-9+]+)(?= not upgraded)')

__info "$line"

n=${#packages[@]}

__info "apt: ${n} packages can be upgraded"

ith=1
for package in "${packages[@]}"; do
    # パッケージアップデート
    __exec apt-get upgrade -y $package &
    __spin "($ith/$n)" "Upgrading ${package}"

    if [ "$?" = "0" ]; then
        __success "($ith/$n)" "Install ${package}"
    else
        __fail "($ith/$n)" "Fail to install ${package}"
    fi

    let ith++
done

__success "" "Complete to upgrade packages"

__info "━━…━━…━━…━━…━━…━━…━━…━━…━━━━…━━…━━…━━…━━…━━…━━…━━…━━"
