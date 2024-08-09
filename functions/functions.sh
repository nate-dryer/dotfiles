# Custom functions from .zshrc

# --- Custom Functions ---
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

alias virtualenv='activate_venv'

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
