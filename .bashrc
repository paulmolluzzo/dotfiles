

################################
########### Editor #############
################################

export EDITOR='subl'
export PAGER='most'

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
############ Node ##############
################################

source ${HOME}/dotfiles/aliases/node.sh

################################
############# NVM ##############
################################

if [ -d ~/.nvm ] ; then
  export NVM_DIR=~/.nvm
fi
if [ -f ~/.nvm/nvm.sh ] ; then
  source ~/.nvm/nvm.sh
fi

################################
############ Drush #############
################################

if [ -f ~/.drush/drush.bashrc ] ; then
  source ~/.drush/drush.bashrc
fi

# Include Drush completion.
if [ -f ~/.drush/drush.complete.sh ] ; then
  source ~/.drush/drush.complete.sh
fi

################################
########### Travis #############
################################
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
