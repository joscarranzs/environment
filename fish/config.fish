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
alias yt="yt-dlp"
command -qv nvim && alias vim nvim

# Function to open Vim directly with the FZF interface
function vfz
    fzf | read -l selected  # Capture the output of `fzf` directly into the variable `selected`
    if test -n "$selected"  # Check if something was selected
        vim $selected       # Open the selected file in Vim
    end
end

# Remember to always update the JAVA_HOME variable path
set -x JAVA_HOME /home/linuxbrew/.linuxbrew/Cellar/openjdk/23.0.2
set -x PATH $JAVA_HOME/bin $PATH

# Created by `pipx` on 2024-12-24 20:55:29
set PATH $PATH /home/jcarranzs/.local/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/jcarranzs/.lmstudio/bin

# Function to create a new Maven project
function maven-project --description "Create a new Maven project"
    # Default variables
    set project_name ""
    set package_name ""

    # Process the arguments
    for arg in $argv
        if string match -q -- "--name=*" $arg
            set project_name (string replace -- "--name=" "" $arg)
        else if string match -q -- "--package=*" $arg
            set package_name (string replace -- "--package=" "" $arg)
        else
            echo "Unknown argument: $arg"
            return 1
        end
    end

    # Validate that required arguments are provided
    if test -z "$project_name"
        echo "Error: The --name argument is required."
        return 1
    end

    if test -z "$package_name"
        echo "Error: The --package argument is required."
        return 1
    end

    # Create the Maven project
    echo "Creating Maven project..."
    mvn archetype:generate \
        -DgroupId=$package_name \
        -DartifactId=$project_name \
        -DarchetypeArtifactId=maven-archetype-quickstart \
        -DinteractiveMode=false

    # Check if the command was successful
    if test $status -eq 0
        echo "Project '$project_name' created successfully in the current directory."
    else
        echo "Error creating the Maven project."
        return 1
    end
end
