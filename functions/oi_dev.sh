# oi_dev.sh - Function to create and manage an Open Interpreter virtual environment for development

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

# Export the function for use in all terminal sessions
export -f oi

# Note: This file should be sourced in the .zshrc file
