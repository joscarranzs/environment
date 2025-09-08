#!/usr/bin/env fish

if not tmux has-session -t dev ^/dev/null
    tmux new-session -d -s dev -n files
    tmux new-window -t dev:1 -n terminal
    tmux new-window -t dev:2 -n nvim
end

tmux attach -t dev
