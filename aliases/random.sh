#!/bin/bash

# Description: random aliases

# list files
alias ll='ls -l'

# list all files
alias lal='ls -al'

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

# list aliases by type. e.g.: lma git
lma() {
    if [ $# -eq 0 ]; then
        echo -e "$Blue"
        echo -e "Your options are: $Color_Off"
        ls -1 ${HOME}/dotfiles/aliases/ | while read line; do echo " lma $line"; done | sed -e 's/\.sh//g'
return
    fi

    local FILE="${HOME}/dotfiles/aliases/$1.sh"
    if [ ! -f "$FILE" ]; then
        echo -e "$Blue"
        echo -e "Your options are: $Color_Off"
        ls -1 ${HOME}/dotfiles/aliases/ | while read line; do echo " lma $line"; done | sed -e 's/\.sh//g'
        return
    elif [ -z "$FILE" ]; then
        echo -e "$Red ⓧ  No aliases in $FILE$Color_Off" 
        return
    else
        echo_description "$FILE"
        local CALLABLES=$(get_callables "$FILE")

        # [ -z "$CALLABLES" ] || echo ""

        for NAME in $CALLABLES; do
            local DOCLINE=$(
                grep -B 1 -E \
                    "^(alias ${NAME}=|(function )?${NAME}\()" "$FILE" \
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

# FOR LMA FN. Echo the description of a alias sh file. $1 is the filename.
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
    local ALIASPATH=$1
    grep -E "^(alias |(function )?[a-zA-Z0-9_]+\()" "$ALIASPATH" \
        | sed 's/alias \([^= ]*\)=.*/\1/' \
        | sed -E 's/(function )?([a-zA-Z0-9]*)\(\).*/\2/'
}

# binding to return to vim quickly
stty susp undef
bind '"\C-z":"fg\015"'

