#!/bin/sh
# gchome: Garbage collect (git gc) all git repositories under $HOME directory
#
# Copyright 2014-2016 Sudaraka Wijesinghe <sudaraka@sudaraka.org>
#
# Licensed under BSD 2-clause "Simplified" License,
# see http://opensource.org/licenses/BSD-2-Clause
#

echo ''

ROOTDIR="$HOME"
LOGFILE="/tmp/gchome-$$.log"

ICONS=(
'\e[0;38;5;67m\e[0m'
'\e[0;38;5;208m\e[0m'
'\e[0;38;5;121m\e[0m'
'\e[0;38;5;130m\e[0m'
)
ICO_DEFAULT=0
ICO_REPO=1
ICO_REPO_CLEANED=2
ICO_REPO_CLEAN=3

# output: print formatted text to standard output {{{
output(){
    MSG=$1
    shift;

    ICO=$1
    shift

    if [ -z "$ICO" ]; then
        ICO=$ICO_DEFAULT
    fi

    if [ -z "${ICONS[$ICO]}" ]; then
        ICO=$ICO_DEFAULT
    fi

    # Clear line
    echo -en "\x0d\e[0m"
    for i in "`seq 1 $(tput cols)`"; do echo -n ' '; done
    echo -en "\x0d\e[0m"

    echo -en " ${ICONS[$ICO]} "
    echo -en "\e[0m $MSG"
}
# }}}

for REPO in `find $ROOTDIR -type d -name .git 2>/dev/null`; do
    REPO=$(dirname $REPO)
    cd $REPO 2>&1 >>$LOGFILE

    output `basename $REPO` $ICO_REPO

    BEFORE=`du -sh "$REPO/.git"|cut -f1`
    output "`basename $REPO` \e[0;37m($BEFORE)" $ICO_REPO

    git gc --prune=0 --quiet 2>&1 >>$LOGFILE
    AFTER=`du -sh "$REPO/.git"|cut -f1`

    if [ "$BEFORE" != "$AFTER" ]; then
        output "`basename $REPO` \e[0;38;5;8m(\e[0;38;5;8m$BEFORE -> \e[0;38;5;7m$AFTER\e[0;38;5;8m)" $ICO_REPO_CLEANED
    else
        output "`basename $REPO` \e[0;38;5;8m($BEFORE)" $ICO_REPO_CLEAN
    fi

    echo -e "\e[0m"
done

echo ''
