# activate_venv.sh - Function to activate a Python virtual environment

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

# Export the function for use in all terminal sessions
export -f activate_venv

# Note: This file should be sourced in the .zshrc file
