#!/bin/bash

# Git tab completion
source ${HOME}/.git-completion.bash
source ${HOME}/.profile

################################
######### Aliases ##############
################################

alias gba='git branch -a'
alias gbd='git branch -d'
alias gbvv='git branch -vv'
alias gd='git diff'
alias gdno="git diff --name-only"
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

################################
######### Functions ############
################################

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

# git diff highlight
function gdhl() {
  git diff -p --color $1 | ~/.bin/diff-highlight | strip_diff_leading_symbols | less -r
}

# strip functionality for pretty git diff
# Breaks with non-English language characters
function strip_diff_leading_symbols(){
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
# use like gfsd old_version_sha_..new_version_sha # outputs difference in size of files since old_version_sha
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