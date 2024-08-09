# Custom functions from .zshrc_dev

load_env() {
    if [ -f "$HOME/.env_dev" ]; then
        export $(cat $HOME/.env_dev | xargs)
    else
        echo ".env_dev file not found."
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

oi() {
    OIDIR="$HOME/development/oienv"
    if [ ! -d "$OIDIR" ]; then
        echo "Creating Open Interpreter virtual environment with pyenv..."
        pyenv virtualenv 3.10.11 oienv
        pyenv local oienv
    fi
    pyenv activate oienv
    if ! command -v interpreter &> /dev/null; then
        echo "Installing Open Interpreter..."
        pip install open-interpreter
    fi

    echo "Starting Open Interpreter with OpenAI GPT-4..."
    interpreter --model "gpt-4o" --api_key "$OPENAI_API_KEY"

    pyenv deactivate
}
