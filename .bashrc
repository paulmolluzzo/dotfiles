
################################
########### Editor #############
################################

export EDITOR='code'

################################
########## History #############
################################

shopt -s histappend
export HISTFILESIZE=1000000
export HISTSIZE=1000000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:hh:ll:lal"

# shut apple up
export BASH_SILENCE_DEPRECATION_WARNING=1

# Useful timestamp format
HISTTIMEFORMAT='%F %T '

# pass through ctrl-s for vim (only if stdin is a terminal)
[ -t 0 ] && stty -ixon

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
########### amazon q ###########
################################


################################
####### npm completion #########
################################

source ${HOME}/dotfiles/npm-completion.sh

################################
########### Private ############
################################

if [ -f ${HOME}/dotfiles/aliases/private.sh ] ; then
  source ${HOME}/dotfiles/aliases/private.sh
fi

################################
############# NVM ##############
################################
# REMOVED: NVM lazy-loading is now handled in .bash_profile
# This section was causing duplicate loading and 3+ second delay

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

################################
########## Autojump ############
################################

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && source /opt/homebrew/etc/profile.d/autojump.sh

################################
########### Homebrew ###########
################################
# Use cached brew shellenv to save ~280ms
if [ -f ~/.brew-shellenv-cache ]; then
  source ~/.brew-shellenv-cache
else
  eval "$(/opt/homebrew/bin/brew shellenv)"
  # Create cache file
  /opt/homebrew/bin/brew shellenv > ~/.brew-shellenv-cache
fi

# pnpm
# export PNPM_HOME="/Users/paul.molluzzo/Library/pnpm"
# export PATH="$PNPM_HOME:$PATH"
# pnpm end

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

################################
########### Maven/Java #########
################################
# Maven stuff for ESPN Score (Homebrew installation)
export M2_HOME=/opt/homebrew/Cellar/maven/3.9.11/libexec
export MAVEN_HOME=$M2_HOME
export PATH=$PATH:$M2_HOME/bin

# Lazy Java home - only set when needed
if command -v java &> /dev/null; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0 2>/dev/null || echo "")
fi



# Added by pat-manager
# source /Users/paul.molluzzo/.nvm/versions/node/v20.19.2/lib/node_modules/@aiadvance/cli-universe/node_modules/@aiadvance/pat-manager/shell/pat-manager.bash
