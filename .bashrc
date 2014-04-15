PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# bind "set show-all-if-ambiguous on"
[[ $- = *i* ]] && bind TAB:menu-complete
set completion-ignore-case On