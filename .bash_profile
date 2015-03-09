# Git tab completion
source ~/.git-completion.bash
source ~/.profile

export PATH=/usr/local/bin:$PATH

# Add path for MAMP version of php
export MAMP_PHP="/Applications/MAMP/bin/php/php5.3.27/bin"

export PATH="$MAMP_PHP:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

# MacPorts Installer addition on 2012-09-20_at_11:02:19: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Colors as variables

#For the Prompt:
# Reset
Prompt_Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Prompt_Black="\[\033[0;30m\]"        # Black
Prompt_Red="\[\033[0;31m\]"          # Red
Prompt_Green="\[\033[0;32m\]"        # Green
Prompt_Yellow="\[\033[0;33m\]"       # Yellow
Prompt_Blue="\[\033[0;34m\]"         # Blue
Prompt_Purple="\[\033[0;35m\]"       # Purple
Prompt_Cyan="\[\033[0;36m\]"         # Cyan
Prompt_White="\[\033[0;37m\]"        # White

# Bold
Prompt_BBlack="\[\033[1;30m\]"       # Black
Prompt_BRed="\[\033[1;31m\]"         # Red
Prompt_BGreen="\[\033[1;32m\]"       # Green
Prompt_BYellow="\[\033[1;33m\]"      # Yellow
Prompt_BBlue="\[\033[1;34m\]"        # Blue
Prompt_BPurple="\[\033[1;35m\]"      # Purple
Prompt_BCyan="\[\033[1;36m\]"        # Cyan
Prompt_BWhite="\[\033[1;37m\]"       # White

# Underline
Prompt_UBlack="\[\033[4;30m\]"       # Black
Prompt_URed="\[\033[4;31m\]"         # Red
Prompt_UGreen="\[\033[4;32m\]"       # Green
Prompt_UYellow="\[\033[4;33m\]"      # Yellow
Prompt_UBlue="\[\033[4;34m\]"        # Blue
Prompt_UPurple="\[\033[4;35m\]"      # Purple
Prompt_UCyan="\[\033[4;36m\]"        # Cyan
Prompt_UWhite="\[\033[4;37m\]"       # White

# Background
Prompt_On_Black="\[\033[40m\]"       # Black
Prompt_On_Red="\[\033[41m\]"         # Red
Prompt_On_Green="\[\033[42m\]"       # Green
Prompt_On_Yellow="\[\033[43m\]"      # Yellow
Prompt_On_Blue="\[\033[44m\]"        # Blue
Prompt_On_Purple="\[\033[45m\]"      # Purple
Prompt_On_Cyan="\[\033[46m\]"        # Cyan
Prompt_On_White="\[\033[47m\]"       # White

# High Intensty
Prompt_IBlack="\[\033[0;90m\]"       # Black
Prompt_IRed="\[\033[0;91m\]"         # Red
Prompt_IGreen="\[\033[0;92m\]"       # Green
Prompt_IYellow="\[\033[0;93m\]"      # Yellow
Prompt_IBlue="\[\033[0;94m\]"        # Blue
Prompt_IPurple="\[\033[0;95m\]"      # Purple
Prompt_ICyan="\[\033[0;96m\]"        # Cyan
Prompt_IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
Prompt_BIBlack="\[\033[1;90m\]"      # Black
Prompt_BIRed="\[\033[1;91m\]"        # Red
Prompt_BIGreen="\[\033[1;92m\]"      # Green
Prompt_BIYellow="\[\033[1;93m\]"     # Yellow
Prompt_BIBlue="\[\033[1;94m\]"       # Blue
Prompt_BIPurple="\[\033[1;95m\]"     # Purple
Prompt_BICyan="\[\033[1;96m\]"       # Cyan
Prompt_BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
Prompt_On_IBlack="\[\033[0;100m\]"   # Black
Prompt_On_IRed="\[\033[0;101m\]"     # Red
Prompt_On_IGreen="\[\033[0;102m\]"   # Green
Prompt_On_IYellow="\[\033[0;103m\]"  # Yellow
Prompt_On_IBlue="\[\033[0;104m\]"    # Blue
Prompt_On_IPurple="\[\033[10;95m\]"  # Purple
Prompt_On_ICyan="\[\033[0;106m\]"    # Cyan
Prompt_On_IWhite="\[\033[0;107m\]"   # White

# For non-prompt use
# Reset
Color_Off="\033[0m"       # Text Reset

# Regular Colors
Black="\033[0;30m"        # Black
Red="\033[0;31m"          # Red
Green="\033[0;32m"        # Green
Yellow="\033[0;33m"       # Yellow
Blue="\033[0;34m"         # Blue
Purple="\033[0;35m"       # Purple
Cyan="\033[0;36m"         # Cyan
White="\033[0;37m"        # White

# Bold
BBlack="\033[1;30m"       # Black
BRed="\033[1;31m"         # Red
BGreen="\033[1;32m"       # Green
BYellow="\033[1;33m"      # Yellow
BBlue="\033[1;34m"        # Blue
BPurple="\033[1;35m"      # Purple
BCyan="\033[1;36m"        # Cyan
BWhite="\033[1;37m"       # White

# Underline
UBlack="\033[4;30m"       # Black
URed="\033[4;31m"         # Red
UGreen="\033[4;32m"       # Green
UYellow="\033[4;33m"      # Yellow
UBlue="\033[4;34m"        # Blue
UPurple="\033[4;35m"      # Purple
UCyan="\033[4;36m"        # Cyan
UWhite="\033[4;37m"       # White

# Background
On_Black="\033[40m"       # Black
On_Red="\033[41m"         # Red
On_Green="\033[42m"       # Green
On_Yellow="\033[43m"      # Yellow
On_Blue="\033[44m"        # Blue
On_Purple="\033[45m"      # Purple
On_Cyan="\033[46m"        # Cyan
On_White="\033[47m"       # White

# High Intensty
IBlack="\033[0;90m"       # Black
IRed="\033[0;91m"         # Red
IGreen="\033[0;92m"       # Green
IYellow="\033[0;93m"      # Yellow
IBlue="\033[0;94m"        # Blue
IPurple="\033[0;95m"      # Purple
ICyan="\033[0;96m"        # Cyan
IWhite="\033[0;97m"       # White

# Bold High Intensty
BIBlack="\033[1;90m"      # Black
BIRed="\033[1;91m"        # Red
BIGreen="\033[1;92m"      # Green
BIYellow="\033[1;93m"     # Yellow
BIBlue="\033[1;94m"       # Blue
BIPurple="\033[1;95m"     # Purple
BICyan="\033[1;96m"       # Cyan
BIWhite="\033[1;97m"      # White

# High Intensty backgrounds
On_IBlack="\033[0;100m"   # Black
On_IRed="\033[0;101m"     # Red
On_IGreen="\033[0;102m"   # Green
On_IYellow="\033[0;103m"  # Yellow
On_IBlue="\033[0;104m"    # Blue
On_IPurple="\033[10;95m"  # Purple
On_ICyan="\033[0;106m"    # Cyan
On_IWhite="\033[0;107m"   # White

# Variables
Time12h="\T"
PathShort="\w"

# Custom prompt

export PS1=$Prompt_IBlue'{'$Time12h'}'$Prompt_Color_Off$Prompt_BYellow' ['$PathShort']'$Prompt_Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Prompt_Green'"$(__git_ps1 " (%s)")'$Prompt_Color_Off'; \
  else \
    # @5 - Changes to working tree
    echo "'$Prompt_IRed'"$(__git_ps1 " (%s)")'$Prompt_Color_Off'; \
  fi) '$Prompt_White'\$'$Prompt_Color_Off' "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'$Prompt_White' \$ '$Prompt_Color_Off'"; \
fi)'

# git aliases

alias gba='git branch -a'
alias gd='git diff'
alias gcmsg='git commit -m'
alias gcamsg='git commit -am'
alias gp='git push'
alias gpsuo='git push --set-upstream origin'
alias gl='git pull'
alias gs='git status'
alias gss='git status -s'
alias glg='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset" --abbrev-commit'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gsta='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias ggo='git checkout -B'
alias gco='git checkout'
alias gcof='git checkout -- ' #Used to checkout a single file
alias gcom='git checkout master'
alias gcl='git clone'
alias gf='git fetch'

# git branch ahead/behind another
function gahead() {
  # use first argument or master
  original=${1-master}

  # use the second argument or current branch if not given
  current=`git branch | grep \* | sed s/\*\ //`
  compare=${2-$current}

  # run git rev-list and capture numbers returned
  result=`git rev-list --left-right --count $original...$compare`

  # print numbers in a pretty message
  numbers=($result);
  echo -e "$Red-$Color_Off $compare is currently $IRed${numbers[0]}$Color_Off commits behind $original";
  echo -e "$Green+$Color_Off $compare is currently $IGreen${numbers[1]}$Color_Off commits ahead of $original";
}

# svn aliases

alias sst='svn status'
alias sup='svn update'
alias sadd='svn add'
alias sd='svn di'
alias sm='svn merge'
alias scmsg='svn commit -m'
alias slog='svn log -l'

# tmux aliases

alias tmn='tmux new -s'
alias tma='tmux attach -t'
alias tml='tmux ls'
alias tmk='tmux kill-session -t'
alias tmka='killall tmux'

# random aliases

alias duh='du -h -d 1'

# even better personal svn logging
function slogme() {
  # use number or 20 by default
  commits=${1-20}

  # use the second argument to search for a user or my name if not supplied
  user=${2-molluzzo}

  # run it
  svn log -l$commits | sed -n '/'$user'/,/-----$/ p'
}

# tab completion
[[ $- = *i* ]] && bind TAB:menu-complete
set completion-ignore-case On

# Random Aliases


function svn
{
  # rebuild args to get quotes right
  CMD=
  for i in "$@"
  do
    if [[ "$i" =~ \  ]]
    then
      CMD="$CMD \"$i\""
    else
      CMD="$CMD $i"
    fi
  done

  # pad with spaces to strip --nocol
  CMD=" $CMD "
  CMDLEN=${#CMD}

  # parse disabling arg
  CMD="${CMD/ --nocol / }"

  # check if disabled
  test "$CMDLEN" = "${#CMD}"
  NOCOL=$?
  if [ "$SVN_COLOR" != "always" ] && ( [ $NOCOL = 1 ] || [ "$SVN_COLOR" = "never" ] || [ ! -t 1 ] )
  then
    eval $(which svn) $CMD
    return
  fi

  # supported svn actions for "status-like" output
  ACTIONS="add|checkout|co|cp|del|export|remove|rm|st"
  ACTIONS="$ACTIONS|merge|mkdir|move|mv|ren|sw|up"

  # actions that outputs "status-like" data
  if [[ "$1" =~ ^($ACTIONS) ]]
  then
    eval $(which svn) $CMD | while IFS= read -r RL
    do
      if   [[ $RL =~ ^\ ?M ]]; then C="\033[34m";
      elif [[ $RL =~ ^\ ?C ]]; then C="\033[41m\033[37m\033[1m";
      elif [[ $RL =~ ^A ]]; then C="\033[32m";
      elif [[ $RL =~ ^D ]]; then C="\033[31m\033[1m";
      elif [[ $RL =~ ^X ]]; then C="\033[37m";
      elif [[ $RL =~ ^! ]]; then C="\033[43m\033[37m\033[1m";
      elif [[ $RL =~ ^I ]]; then C="\033[33m";
      elif [[ $RL =~ ^R ]]; then C="\033[35m";
      else C=
      fi

      echo -e "$C${RL/\\/\\\\}\033[0m\033[0;0m"
    done

  # actions that outputs "diff-like" data
  elif [[ "$1" =~ ^diff ]]
  then
    eval $(which svn) $CMD | while IFS= read -r RL
    do
      if   [[ $RL =~ ^Index:\  ]]; then C="\033[34m\033[1m";
      elif [[ $RL =~ ^@@ ]]; then C="\033[37m";

      # removed
      elif [[ $RL =~ ^-\<\<\< ]]; then C="\033[31m\033[1m";
      elif [[ $RL =~ ^-\>\>\> ]]; then C="\033[31m\033[1m";
      elif [[ $RL =~ ^-=== ]]; then C="\033[31m\033[1m";
      elif [[ $RL =~ ^- ]]; then C="\033[31m";

      # added
      elif [[ $RL =~ ^\+\<\<\< ]]; then C="\033[32m\033[1m";
      elif [[ $RL =~ ^\+\>\>\> ]]; then C="\033[32m\033[1m";
      elif [[ $RL =~ ^\+=== ]]; then C="\033[32m\033[1m";
      elif [[ $RL =~ ^\+ ]]; then C="\033[32m";

      else C=
      fi

      echo -e "$C${RL/\\/\\\\}\033[0m\033[0;0m"
    done

  elif [[ "$1" =~ ^log ]]
  then
    eval $(which svn) $CMD | while IFS= read -r RL
    do
      if   [[ $RL =~ ^\  ]]; then C="\033[100m";
      elif [[ $RL =~ ^- ]]; then C="\033[37m";
      elif [[ $RL =~ ^r ]]; then C="\033[34m";
      else C=
      fi

      echo -e "$C${RL/\\/\\\\}\033[0m\033[0;0m"
    done

  else
    eval $(which svn) $CMD
  fi
}
