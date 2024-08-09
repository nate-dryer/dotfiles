# activate_pyenv_personal.sh - Function to activate a Python environment using pyenv for personal use

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

# Note: This file should be sourced in the .zshrc file

export -f activate_pyenv
