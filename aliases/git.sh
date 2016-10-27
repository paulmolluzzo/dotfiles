#!/bin/bash

# Git tab completion
source ${HOME}/.git-completion.bash
source ${HOME}/.profile

################################
######### Aliases ##############
################################

# list all branches
alias gba='git branch -a'
# delete branch
alias gbd='git branch -d'
# verbose branch list
alias gbvv='git branch -vv'
# git diff
alias gd='git diff'
# git diff cached
alias gdc='git diff --cached'
# git diff name only
alias gdno="git diff --name-only"
# git commit
alias gc='git commit'
# git commit no edit
alias gcne='git commit --no-edit'
# git commit --amend --no-edit
alias gcan='git commit --amend --no-edit'
# git commit with message
alias gcmsg='git commit -m'
# git commit all with message
alias gcamsg='git commit -am'
# git push
alias gp='git push'
# git pull
alias gl='git pull'
# git status
alias gs='git status'
# git status short
alias gss='git status -s'
# git pretty one line log
alias glg='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset" --abbrev-commit'
# git add
alias ga='git add'
# git merge
alias gm='git merge'
# git merge no editing
alias gmne='git merge --no-edit'
# git reset
alias gr='git reset'
# git reset HEAD
alias grh='git reset HEAD'
# git reset HEAD hard
alias grhh='git reset HEAD --hard'
# git stash
alias gsta='git stash'
# git stash list
alias gstl='git stash list'
# git stash pop
alias gstp='git stash pop'
# git stash drop
alias gstd='git stash drop'
# git create new branch and check it out
alias ggo='git checkout -B'
# git checkout branch
alias gco='git checkout'
# Checkout a single file
alias gcof='git checkout -- '
# git checkout master
alias gcom='git checkout master'
# git clone
alias gcl='git clone'
# git fetch
alias gf='git fetch'
# git tag
alias gt='git tag'
# git tag -a [enter_tag]
alias gta='git tag -a'
# git push tags
alias gpt='git push --tags'

################################
######### Functions ############
################################

# git branch ahead/behind another: gahead $left $right
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

# git stash apply buy number: gstu 3
function gstu() {
  numRegex='^[0-9]+$'
  if ! [[ $1 =~ $numRegex ]]; then
   echo "No number provided"
  else
    git stash apply stash@{$1}
  fi
}

# get ticket numbers only in a current branch

# function gtix() {
#   # use first argument or master
#   original=${1-master}

#   # use the second argument or current branch if not given
#   current=`git branch | grep \* | sed s/\*\ //`
#   compare=${2-$current}

#   # run git log comparing the first/master to the second/current, grep for a pattern like #1234, sort, remove duplicates
#   git log $original..$compare | grep -o "\(\#[0-9]\{4\}\)\|\([0-9]\{4\}\:\)\|\(\s\{4\}[0-9]\{4\}\)" | sort | uniq
# }

# prettier git diff highlight
gdhl() {
  git diff -p --color $1 | ~/.bin/diff-highlight | strip_diff_leading_symbols | less -r -x1,4
}

# strip functionality for pretty git diff
# Breaks with non-English language characters
strip_diff_leading_symbols(){
    color_code_regex=$'(\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K])'

        # simplify the unified patch diff header
        sed -E "s/^($color_code_regex)diff --git .*$//g" | \
               sed -E "s/^($color_code_regex)index .*$/\
\1`printf "$IBlue"`$(rule)`printf "$IRed"`/g" | \
               sed -E "s/^($color_code_regex)\+\+\+(.*)$/`printf "$IGreen"`\1 \+\+\5\\
\1`printf "$IBlue"`$(rule)`printf "$Color_Off"`/g" | \

        # extra color for @@ context line
              sed -E "s/@@(.*$)/`printf "$IPurple"`@@\1`printf "$Color_Off"`/g" | \

        # actually strips the leading symbols
               sed -E "s/^($color_code_regex)[\+\-]/\1 /g"
}

# git file size diff from http://stackoverflow.com/questions/10845051/git-show-total-file-size-difference-between-two-commits
# git file size diff use like: gfsd old_version_sha_..new_version_sha
gfsd() {
  args=$(git rev-parse --sq "$@")
  eval "git diff-tree -r $args" | {
    total=0
    while read A B C D M P
    do
      case $M in
        M) bytes=$(( $(git cat-file -s $D) - $(git cat-file -s $C) )) ;;
        A) bytes=$(git cat-file -s $D) ;;
        D) bytes=-$(git cat-file -s $C) ;;
        *)
          echo >&2 warning: unhandled mode $M in \"$A $B $C $D $M $P\"
          continue
          ;;
      esac
      total=$(( $total + $bytes ))
      printf '%d\t%s\n' $bytes "$P"
    done
    echo total $total
  }
}

# git push set upstream origin with current branch name
gpsu() {
  current=`git branch | grep \* | sed s/\*\ //`
  git push --set-upstream origin $current
}

# checkout a pull request by ID into a new branch like: gcopr 123 new-branch-name
gcopr() {
  numRegex='^[0-9]+$'
  if ! [[ $1 =~ $numRegex ]]; then
   echo "No ID for PR given"
  else
    branchname=${2-pr-$1}
    git fetch origin pull/$1/head:$branchname
    git checkout $branchname
  fi
}
