#!/bin/bash

# Description: random aliases

# open files
alias o='open'

# disk space of directories
alias duh='du -h -d 1'


# Print a horizontal rule
rule () {
        printf "%$(tput cols)s\n"|tr " " "─"
}

# make a directory and go into it
function md() {
  mkdir -p "$@" && cd "$@"
}

# quick find what's allowed
function f() {
    find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# cd into front finder window
cdf() {
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# The following is stolen from the awesome desk project: https://github.com/jamesob/desk
# Use that repo not this stuff...

# list aliases by type: lma git
lma() {
    if [ $# -eq 0 ]; then
        echo "No alias type supplied"
        return
    fi

    local FILES="${HOME}/dotfiles/aliases/$1.sh"
    if [ -z "$FILES" ]; then
        echo "No aliases at $1.sh" 
        exit 2
    else
        echo_description "$FILES"
        local CALLABLES=$(get_callables "$FILES")

        # [ -z "$CALLABLES" ] || echo ""

        for NAME in $CALLABLES; do
            local DOCLINE=$(
                grep -B 1 -E \
                    "^(alias ${NAME}=|(function )?${NAME}\()" "$FILES" \
                    | grep "#")

            if [ -z "$DOCLINE" ]; then
                echo -e "  $IPurple${NAME}$Color_Off"
            else
                echo -e "  $IPurple${NAME}$Color_Off -" "${DOCLINE##\# }"
            fi
        done
        echo -e ""
    fi
}

# FOR LMA FN. Echo the description of a desk. $1 is the deskfile.
echo_description() {
    local descline=$(grep -E "#\s+Description" "$1")
    if [ -n "$descline" ]; then
        echo -e "\n$UBlue${descline##*Description: }:$Color_Off"
    else
        echo -e "\n$UBlue$1:$Color_Off"
    fi
}

# FOR LMA FN. Return a list of aliases and functions for a given desk
get_callables() {
    local DESKPATH=$1
    grep -E "^(alias |(function )?[a-zA-Z0-9_]+\()" "$DESKPATH" \
        | sed 's/alias \([^= ]*\)=.*/\1/' \
        | sed -E 's/(function )?([a-zA-Z0-9]*)\(\).*/\2/'
}