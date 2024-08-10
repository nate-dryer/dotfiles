# ~/.zshrc - Nate Dryer's Zsh Configuration

# --- Load environment variables from .env file ---
# This section loads environment variables from a .env file located in the home directory.
# This is useful for keeping sensitive information like API keys out of your main configuration files.
# Ensure that your .env file is secure and includes variables in the format: KEY='value'
if [ -f $HOME/.env ]; then
    export $(cat $HOME/.env | xargs)
fi

if [ -f "$HOME/.personal_info" ]; then
    export $(cat $HOME/.personal_info | xargs)
fi

# Load environment variables from .env_dev and .env_personal if they exist
if [ -f "$HOME/.env_dev" ]; then
    export $(cat $HOME/.env_dev | xargs)
fi

if [ -f "$HOME/.env_personal" ]; then
    export $(cat $HOME/.env_personal | xargs)
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
export HISTSIZE=20000
export SAVEHIST=20000

# FUNCNEST: Prevents recursive function calls from exceeding a certain depth
export FUNCNEST=100

# --- Path Configuration ---
# PATH: Adds custom directories to your executable search path
export PATH="$HOME/.pyenv/bin:$HOME/.poetry/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"

# Homebrew Configuration
eval "$(/opt/homebrew/bin/brew shellenv)"

# Pyenv Configuration
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Poetry Configuration
export PATH="$HOME/.poetry/bin:$PATH"

# GitHub Copilot CLI Configuration
if command -v gh &> /dev/null; then
    eval "$(gh copilot alias -- zsh)"
fi

# Source aliases from aliases.zsh
if [ -f "$HOME/development/dotfiles/aliases.zsh" ]; then
    source "$HOME/development/dotfiles/aliases.zsh"
fi

# Source custom functions
if [ -f "$HOME/development/dotfiles/functions/activate_venv.sh" ]; then
    source "$HOME/development/dotfiles/functions/activate_venv.sh"
fi

if [ -f "$HOME/development/dotfiles/functions/load_env.sh" ]; then
    source "$HOME/development/dotfiles/functions/load_env.sh"
fi

if [ -f "$HOME/development/dotfiles/functions/activate_pyenv.sh" ]; then
    source "$HOME/development/dotfiles/functions/activate_pyenv.sh"
fi

if [ -f "$HOME/development/dotfiles/functions/oi.sh" ]; then
    source "$HOME/development/dotfiles/functions/oi.sh"
fi

# --- Zsh-Specific Settings ---
# Zsh auto-completion setup to enhance command-line productivity
autoload -Uz compinit
compinit

# Customized prompt with branch info for Git repositories
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
PROMPT='%F{cyan}%n@%m%f %F{green}%~%f $vcs_info_msg_0_ %# '

# Load Oh My Zsh if it's installed, providing additional plugins and themes
if [ -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
    source ~/.oh-my-zsh/oh-my-zsh.sh
fi
