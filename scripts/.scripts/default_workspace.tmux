#!/usr/bin/env bash

tmux renamew "IDE"
tmux send "nvim ." C-m

tmux neww -d -n "Shell"
tmux selectw -t 2
tmux send "clear" C-m

tmux selectw -t 1
