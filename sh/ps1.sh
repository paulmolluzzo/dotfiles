#!/bin/bash

# Variables
Time12h="\T"
PathShort="\w"

# Custom prompt

export PS1=$Prompt_IBlue'{{}}'$Prompt_Color_Off$Prompt_BYellow' ['$PathShort']'$Prompt_Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Prompt_Green'"$(__git_ps1 " (%s)")'$Prompt_Color_Off'; \
  else \
    # @5 - Changes to working tree
    echo "'$Prompt_IRed'"$(__git_ps1 " (%s)")'$Prompt_Color_Off'; \
  fi) '$Prompt_White'\n\$'$Prompt_Color_Off' "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'$Prompt_White' \n$ '$Prompt_Color_Off'"; \
fi)'
