#!/usr/bin/env bash

SESSION="nyx"
PROJECT="$HOME/Projects/Nyx"

tmux new-session -d -s "$SESSION" -n code -c "$PROJECT"

tmux send-keys -t "$SESSION:code" "vi ." C-m

tmux new-window -t "$SESSION:" -n game -c "$PROJECT"

tmux new-window -t "$SESSION:" -n git -c "$PROJECT"

tmux select-window -t "$SESSION:code"

tmux attach-session -t "$SESSION"

