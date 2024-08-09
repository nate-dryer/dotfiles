# load_env_personal.sh - Function to load environment variables for personal use

load_env() {
    if [ -f "$HOME/.env_personal" ]; then
        export $(cat $HOME/.env_personal | xargs)
    else
        echo ".env_personal file not found."
    fi
}

# Note: This file should be sourced in the .zshrc file

export -f load_env
