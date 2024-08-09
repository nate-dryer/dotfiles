#!/bin/bash
# example_function.sh - A function to quickly navigate to a project directory

function goto_project() {
    cd ~/development/projects/$1 || echo "Project $1 not found!"
}

# Export the function for use in all terminal sessions
export -f goto_project
