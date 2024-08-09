# Custom functions from .zshrc_personal

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
