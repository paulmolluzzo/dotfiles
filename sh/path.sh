#!/bin/bash

# usr local bin
export PATH=/usr/local/bin:$PATH

# Add path for MAMP version of php
export MAMP_PHP="/Applications/MAMP/bin/php/php5.6.10/bin"
export MAMP_MYSQL="/Applications/MAMP/Library/bin"

export PATH="$MAMP_PHP:$PATH"
export PATH="$MAMP_MYSQL:$PATH"

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# MacPorts Installer addition on 2012-09-20_at_11:02:19: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 

# Tab completion
[[ $- = *i* ]] && bind TAB:menu-complete
set completion-ignore-case On

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"