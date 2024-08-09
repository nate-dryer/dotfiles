
# ~/.zshrc - Nate Dryer's Zsh Configuration

# --- Load environment variables from .env file ---
# This section loads environment variables from a .env file located in the home directory.
# This is useful for keeping sensitive information like API keys out of your main configuration files.
# Ensure that your .env file is secure and includes variables in the format: KEY='value'
if [ -f $HOME/.env ]; then
    export $(cat $HOME/.env | xargs)
fi

# --- Environment Variables ---
# EDITOR: Defines your preferred text editor, used by various command-line tools
export EDITOR="code"

# DEV_DIR: A custom variable pointing to your development directory
export DEV_DIR="$HOME/development"

# LANG and LC_ALL: Set the language and locale settings for your shell environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# HISTFILE: Specifies the file where your command history is saved
export HISTFILE="$HOME/.zsh_history"

# HISTSIZE and SAVEHIST: Set the maximum number of commands to remember in the history
export HISTSIZE=10000
export SAVEHIST=10000

# FUNCNEST: Prevents recursive function calls from exceeding a certain depth
export FUNCNEST=100

# --- Path Configuration ---
# PATH: Adds custom directories to your executable search path
export PATH="$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"

# --- Aliases ---
# Aliases provide shortcuts for commonly used commands or sequences
alias suggest='yes "" | gh copilot suggest'  # Shortcut for GitHub Copilot suggestions
alias explain='yes "" | gh copilot explain'  # Shortcut for GitHub Copilot explanations

# --- Custom Functions ---
# Functions allow you to define reusable commands with specific logic

# activate_venv: Activates a Python virtual environment located at the given path
activate_venv() {
    if [ -z "$1" ]; then
        echo "Usage: activate_venv <path_to_virtual_env>"
        return 1
    fi

    VENV_PATH="$1"
    if [ ! -d "$VENV_PATH" ]; then
        echo "Virtual environment not found at $VENV_PATH"
        return 1
    fi

    source "$VENV_PATH/bin/activate"
    echo "Activated virtual environment at $VENV_PATH"
}

# virtualenv: A quick alias to call activate_venv function
alias virtualenv='activate_venv'

# --- Open Interpreter Configuration ---
# oi: A function to create and manage an Open Interpreter virtual environment
oi() {
    OIDIR="$HOME/development/oienv"
    if [ ! -d "$OIDIR" ]; then
        echo "Creating Open Interpreter virtual environment..."
        python3 -m venv "$OIDIR"
    fi
    source "$OIDIR/bin/activate"
    if ! command -v interpreter &> /dev/null; then
        echo "Installing Open Interpreter..."
        pip install open-interpreter
    fi

    echo "Select hosting option:"
    echo "1. OpenAI (default)"
    read "option?Enter option number: "

    case "$option" in
        1)
            interpreter --model "gpt-4o" --api_key "$OPENAI_API_KEY"
            ;;
        *)
            echo "Invalid option selected."
            ;;
    esac

    deactivate
}

# --- Zsh-Specific Settings ---
# Zsh auto-completion setup to enhance command-line productivity
autoload -Uz compinit
compinit

# Customize your Zsh prompt (you can modify the colors and format as needed)
PROMPT='%F{cyan}%n@%m%f %F{green}%~%f %# '

# Load Oh My Zsh if it's installed, providing additional plugins and themes
if [ -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
    source ~/.oh-my-zsh/oh-my-zsh.sh
fi
