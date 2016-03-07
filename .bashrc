################################
########### Editor #############
################################

export EDITOR='subl'

################################
########## History #############
################################

shopt -s histappend
export HISTFILESIZE=1000000
export HISTSIZE=1000000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history"

# Useful timestamp format
HISTTIMEFORMAT='%F %T '

################################
############ Path ##############
################################

source ${HOME}/dotfiles/sh/path.sh

################################
########### Colors #############
################################

source ${HOME}/dotfiles/sh/colors.sh

################################
########### Prompt #############
################################

source ${HOME}/dotfiles/sh/ps1.sh

################################
############# Git ##############
################################

source ${HOME}/dotfiles/aliases/git.sh

################################
############# SVN ##############
################################

source ${HOME}/dotfiles/aliases/svn.sh

################################
############ TMUX ##############
################################

source ${HOME}/dotfiles/aliases/tmux.sh

################################
############ random ############
################################

source ${HOME}/dotfiles/aliases/random.sh

################################
############## sf ##############
################################

source ${HOME}/dotfiles/aliases/sf.sh

################################
########### Meteor #############
################################

source ${HOME}/dotfiles/aliases/meteor.sh

################################
############# NVM ##############
################################

export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh