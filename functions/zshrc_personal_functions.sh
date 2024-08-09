# Custom functions and aliases from .zshrc_personal

# --- Aliases ---
alias ll="ls -la"
alias gs="git status"
alias gp="git pull"
alias gc="git commit -m"
alias cdproj="cd $DEV_DIR"
alias brewup="brew update && brew upgrade"
alias editzsh="$EDITOR ~/.zshrc_personal"
alias python="python3"
alias pip="pip3"

# --- Functions ---
load_env() {
    if [ -f "$HOME/.env_personal" ]; then
        export $(cat $HOME/.env_personal | xargs)
    else
        echo ".env_personal file not found."
    fi
}

activate_pyenv() {
    if [ -z "$1" ]; then
        echo "Usage: activate_pyenv <python_version>"
        return 1
    fi

    pyenv install -s "$1"
    pyenv virtualenv "$1" "${1}_env"
    pyenv activate "${1}_env"
    echo "Activated Python $1 environment"
}
