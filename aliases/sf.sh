#!/bin/bash

# Description: Aliases and functions for Shopfans Shoporama repo

# get ticket numbers only in a current branch: gtix $not_in_branch $are_in_branch
gtix() {
  original=${1-master}
  current=`git branch | grep \* | sed s/\*\ //`
  compare=${2-$current}
  git log --pretty=oneline $original..$compare | cut -b 42- | grep -v '^Merge' | grep -v '^Revert' | perl -lne "/([0-9]{4})/ && print $&" | sort | uniq
}

# hardcode runtime messages for a specific language: sflang [lang_code]
sflang() {
  if [ -z "$1" ]; then
      echo "You need to enter a language code"
  else
    runtime="protected/runtime/messages/${1}/app.php"
    messages="protected/messages/${1}/app.php"

    if [ -e "$runtime" ]; then
      cp $runtime $messages
      echo -e "$IGreen Updated $messages:$Color_Off"
      git diff --stat
    else
      echo -e "$On_IBlue There are no runtime messages for ${1}$Color_Off"
    fi
  fi
}

# migrate
alias m="protected/yiic migrate"

# init assets
alias ia='protected/yiic init assets'

# clean assets except mail and runtime
alias ca='protected/yiic clean --cache --smarty --assets'

# init tests
alias it='protected/tests/codeception/bin/init.sh'

# build tests
alias bt=' codecept build -c protected/tests'

# run tests
alias rt=' codecept run -c protected/tests'