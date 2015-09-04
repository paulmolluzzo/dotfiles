PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ $- = *i* ]] && bind TAB:menu-complete
set completion-ignore-case On

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# history settings

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"