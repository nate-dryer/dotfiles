# load_env_dev.sh - Function to load environment variables for development

load_env() {
    if [ -f "$HOME/.env_dev" ]; then
        export $(cat $HOME/.env_dev | xargs)
    else
        echo ".env_dev file not found."
    fi
}

# Note: This file should be sourced in the .zshrc file

export -f load_env
