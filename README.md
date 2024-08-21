# Nate's Dotfiles

This repository contains all the configuration files for setting up my development environment.

## Folder and File Descriptions

### dotfiles
- `.gitignore`: Contains patterns for ignoring build artifacts, logs, OS-generated files, and `.env` files.
- `.env`: Contains environment variables for the project, with instructions for using a secure vault for secrets.
- `.zshrc`: Zsh configuration file with sections for loading environment variables, setting environment variables, configuring the path, defining aliases, and custom functions.
- `.zshrc_dev`: Development-specific Zsh configuration file with additional environment variables, path configurations, and functions.
- `.zshrc_personal`: Personal-specific Zsh configuration file with additional environment variables, path configurations, and functions.
- `.personal_info`: Contains personal information like name, email, GitHub URL, phone number, personal website, remote login, and local hostname.

### docker
- `docker-compose.yml`: Configuration file for Docker Compose, defining services for the application and database, including environment variables and volumes.
- `Dockerfile`: Dockerfile for building the application's Docker image, including system dependencies, Python dependencies, and the command to run the application.

### functions
- `example_function.sh`: A script containing a function to quickly navigate to a project directory.

### homebrew
- `brewfile`: Homebrew configuration file listing taps and packages to be installed.

### script
- `install.sh`: A script to set up the development environment, including symlinking dotfiles, installing Homebrew packages, setting up macOS preferences, and installing Python dependencies.

### system
- `system_prefs.sh`: A script to apply system preferences, such as setting the computer name, disabling the guest account, and requiring a password after sleep or screen saver begins.

### macos
- `macos_setup.sh`: A script to set up macOS system preferences, such as showing hidden files in Finder, automatically hiding and showing the Dock, and setting a fast keyboard repeat rate.

### git
- `gitconfig`: Git configuration file with user information, aliases, core settings, and push settings.
- `gitignore_global`: Global Git ignore file with patterns for compiled source files, packages, logs, databases, and OS-generated files.

### LICENSE.md
- `LICENSE.md`: Contains the MIT License for the project.

### GitHub Actions Workflow
- `ci.yml`: A GitHub Actions workflow file located in the `.github/workflows/` directory. This workflow sets up a CI environment, installs dependencies, and runs tests. It includes steps to set up Python using `actions/setup-python@v2`, install dependencies from `requirements.txt`, and run tests using `pytest`. The workflow is designed to be easily customizable for different languages and frameworks.

## Customizing the GitHub Actions Workflow

To customize the GitHub Actions workflow, you can modify the `ci.yml` file located in the `.github/workflows/` directory. Here are some common customizations:

- **Change Python Version**: Modify the `python-version` field in the `Set up Python` step to specify a different version of Python.
- **Add Dependencies**: Add commands to the `Install dependencies` step to install additional dependencies required by your project.
- **Run Different Tests**: Add or modify commands in the `Run tests` step to run tests using different frameworks or tools.
- **Add More Steps**: Add additional steps to the workflow to handle other languages, frameworks, or tasks specific to your project.

For more information on GitHub Actions and YAML syntax, refer to the [GitHub Actions documentation](https://docs.github.com/en/actions).
