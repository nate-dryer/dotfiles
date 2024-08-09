# load_env.sh - Function to load environment variables

load_env() {
    if [ -f "$HOME/.env_dev" ]; then
        export $(cat $HOME/.env_dev | xargs)
    elif [ -f "$HOME/.env_personal" ]; then
        export $(cat $HOME/.env_personal | xargs)
    else
        echo ".env_dev or .env_personal file not found."
    }
}

# Note: This file should be sourced in the .zshrc file
