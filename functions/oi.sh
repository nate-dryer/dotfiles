# oi.sh - Function to create and manage an Open Interpreter virtual environment

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

# Export the function for use in all terminal sessions
export -f oi

# Note: This file should be sourced in the .zshrc file
