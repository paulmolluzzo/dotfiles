#!/bin/bash

# Description: Aliases and functions for Shopfans Shoporama repo

# get ticket numbers only in a current branch: gtix $not_in_branch $are_in_branch
gtix() {
  original=${1-master}
  current=`git branch | grep \* | sed s/\*\ //`
  compare=${2-$current}
  git log $original..$compare | grep -o "\(\#[0-9]\{4\}\)\|\([0-9]\{4\}\:\)\|\(\s\{4\}[0-9]\{4\}\)" | sort | uniq
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