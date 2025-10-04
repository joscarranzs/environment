set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths

# Set the default editor
set -gx EDITOR nvim

# Common aliases
alias cdh="cd ~"
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -l -a"
alias lg="lazygit"
alias create_folder="mkdir"
alias create_file="touch"
alias delete="rm -rf"
alias back="cd .."
alias tm="tmux"
alias kill="tmux kill-server"
alias yt="yt-dlp"
alias clear='printf "\033c"'
alias cls='printf "\033c"'
alias cl='printf "\033c"'

command -qv nvim && alias vim nvim

# Function to open Vim directly with the FZF interface
function vfz
    fzf | read -l selected  # Capture the output of `fzf` directly into the variable `selected`
    if test -n "$selected"  # Check if something was selected
        vim $selected       # Open the selected file in Vim
    end
end

# Remember to always update the JAVA_HOME variable path
set -x JAVA_HOME /home/linuxbrew/.linuxbrew/opt/openjdk@21
set -x PATH $JAVA_HOME/bin $PATH

# Created by `pipx` on 2024-12-24 20:55:29
set PATH $PATH /home/jcarranzs/.local/bin

# Added by LM Studio CLI (lms)
# set -gx PATH $PATH /home/jcarranzs/.lmstudio/bin

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


# Function to start Docker service
# function initDocker
#     sudo systemctl start docker
#     echo "🐳 Docker service started."
# end

# Function to stop Docker service
# function closeDocker
#     sudo systemctl stop docker
#     echo "🐳 Docker service stopped."
# end

# Function to start SQL Server container
# function initSQLServer
#     sudo docker start sqlserver
#     echo "🗄️ SQL Server container started."
# end

# Function to stop SQL Server container
# function closeSQLServer
#     sudo docker stop sqlserver
#     echo "🛑 SQL Server container stopped."
# end

# Function to connect to SQL Server using sqlcmd
# function sqlServerConnect
#     sqlcmd -S localhost -U sa -P 'Carranz2808'
# end
#
# function nvimDB
#     nvim +DBUI
# end

# Function to download and convert YouTube videos to MP3
function ytmp3
    if test (count $argv) -eq 0
        echo "🚫 Debes ingresar un enlace de YouTube."
        return 1
    end

    yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 $argv[1]

    if test $status -eq 0
        echo "✅ Descarga y conversión completadas."
    else
        echo "❌ Ocurrió un error durante la descarga."
    end
end

# Created by `pipx` on 2025-05-12 06:27:39
set PATH $PATH /home/jcarranz/.local/bin

# Function to explain a query using GitHub Copilot
# function copilot-explain
#     for arg in $argv
#         if string match --quiet -- "--query=*" $arg
#             set query (string replace -- "--query=" "" $arg)
#             gh copilot explain "$query"
#             return
#         end
#     end
#
#     echo "❌ Debes proporcionar --query=\"algo a explicar\""
#     return 1
# end

# Function to start a tmux session for development
function tmuxdev
    ~/tmux-dev.fish
end
