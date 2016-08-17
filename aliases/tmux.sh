#!/bin/bash

################################
######### Aliases ##############
################################

# tmux new -s
alias tmn='tmux new -s'
# tmux attach -t
alias tma='tmux attach -t'
# tmux ls
alias tml='tmux ls'
# tmux kill-session -t
alias tmk='tmux kill-session -t'
# killall tmux
alias tmka='killall tmux'

# Completion for tmuxinator
source ~/.bin/tmuxinator.bash