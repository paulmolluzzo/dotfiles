#!/bin/bash

################################
######### Aliases ##############
################################

# tmux new -s
alias tmn='TERM=screen-256color-bce tmux new -s'
# tmux attach -t
alias tma='TERM=screen-256color-bce tmux attach -t'
# tmux ls
alias tml='tmux ls'
# tmux kill-session -t
alias tmk='tmux kill-session -t'
# killall tmux
alias tmka='killall tmux'

# Completion for tmuxinator
source ~/.bin/tmuxinator.bash