# Git tab completion
source ~/.git-completion.bash
source ~/.profile

# Show branch in status line
export PS1="[\\w](\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))\$ "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

##
# Your previous /Users/MolluzzoHome/.bash_profile file was backed up as /Users/MolluzzoHome/.bash_profile.macports-saved_2012-09-20_at_11:02:19
##

# MacPorts Installer addition on 2012-09-20_at_11:02:19: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

alias t="~/Dropbox/todo/todo.sh"

#Complete -F _todo t
