set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths

# Set the default editor
set -gx EDITOR nvim

# Common aliases
alias cdh="cd ~"
alias cl="clear"
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -l -a"
alias lg="lazygit"
alias create="mkdir"
alias delete="rm -rf"
alias back="cd .."
alias tm="tmux"
alias kill="tmux kill-server"
command -qv nvim && alias vim nvim

# Function to open Vim directly with the FZF interface
function vfz
    fzf | read -l selected  # Capture the output of `fzf` directly into the variable `selected`
    if test -n "$selected"  # Check if something was selected
        vim $selected       # Open the selected file in Vim
    end
end

set -x JAVA_HOME /home/linuxbrew/.linuxbrew/Cellar/openjdk/23.0.1
set -x PATH $JAVA_HOME/bin $PATH

# Created by `pipx` on 2024-12-24 20:55:29
set PATH $PATH /home/jcarranzs/.local/bin
