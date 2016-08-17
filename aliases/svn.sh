#!/bin/bash

# svn status
alias sst='svn status'
# svn update
alias sup='svn update'
# svn add
alias sadd='svn add'
# svn di
alias sd='svn di'
# svn merge
alias sm='svn merge'
# svn commit -m
alias scmsg='svn commit -m'
# svn log -l
alias slog='svn log -l'

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

# svn stuff
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