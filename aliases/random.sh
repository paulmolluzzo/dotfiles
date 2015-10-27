#!/bin/bash

################################
######### Aliases ##############
################################

alias o='open'
alias duh='du -h -d 1'


################################
######### Fucntions ############
################################

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

