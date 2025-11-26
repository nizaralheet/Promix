#!/bin/bash

# Set variables for paths
ICON_TARGET_DIR="$HOME/.local/share/icons"
TEMPLATES_DIR="$HOME/.config/wpg/templates"
REPO_DIR="$(pwd)"  # Assuming the script is run from the cloned repo

# Function to print colored output
print_status() {
    echo -e "\033[1;34m$1\033[0m"
}

# Function to print error messages
print_error() {
    echo -e "\033[1;31mError: $1\033[0m"
}

# Function to check if a command was successful
check_success() {
    if [ $? -ne 0 ]; then
        print_error "$1"
        exit 1
    fi
}

# Function to install the theme
install_theme() {
    print_status "Starting Promix icon theme installation..."

    # Create directories if they don't exist
    mkdir -p "$ICON_TARGET_DIR" "$TEMPLATES_DIR"
    check_success "Failed to create necessary directories"

    # Step 1: Copy Promix folder to ~/.local/share/icons
    if [ -d "$REPO_DIR/Promix" ]; then
        cp -r "$REPO_DIR/Promix" "$ICON_TARGET_DIR"
        check_success "Failed to copy Promix folder to $ICON_TARGET_DIR"
        print_status "Copied Promix folder to $ICON_TARGET_DIR"
    else
        print_error "Promix folder not found in $REPO_DIR"
        exit 1
    fi

    # Step 2: Create a symbolic link in ~/.config/wpg/templates
    SYMLINK_TARGET="$ICON_TARGET_DIR/Promix/scripts/replace_folder_file.sh"
    SYMLINK_NAME="$TEMPLATES_DIR/Promix_scripts_replace_folder_file.sh"
    if [ ! -L "$SYMLINK_NAME" ]; then
        ln -s "$SYMLINK_TARGET" "$SYMLINK_NAME"
        check_success "Failed to create symbolic link"
        print_status "Symbolic link created: $SYMLINK_NAME -> $SYMLINK_TARGET"
    else
        print_status "Symbolic link already exists: $SYMLINK_NAME"
    fi

    # Step 3: Copy Promix_scripts_replace_folder_file.sh.base to ~/.config/wpg/templates
    cp "$REPO_DIR/Promix_scripts_replace_folder_file.sh.base" "$TEMPLATES_DIR"
    check_success "Failed to copy Promix_scripts_replace_folder_file.sh.base"
    print_status "Copied Promix_scripts_replace_folder_file.sh.base to $TEMPLATES_DIR"

    # Step 4: Update the GTK icon cache for the Promix theme
    gtk-update-icon-cache -f -t "$ICON_TARGET_DIR/Promix"
    check_success "Failed to update GTK icon cache"
    print_status "GTK icon cache updated for Promix theme"

    print_status "Installation complete."
}

# Function to uninstall the theme
uninstall_theme() {
    print_status "Uninstalling Promix icon theme..."

    # Remove the Promix folder from ~/.local/share/icons
    rm -rf "$ICON_TARGET_DIR/Promix"
    check_success "Failed to remove Promix folder from $ICON_TARGET_DIR"

    # Remove the symbolic link from ~/.config/wpg/templates
    rm -f "$TEMPLATES_DIR/Promix_scripts_replace_folder_file.sh"
    check_success "Failed to remove symbolic link from $TEMPLATES_DIR"

    # Remove the base script from ~/.config/wpg/templates
    rm -f "$TEMPLATES_DIR/Promix_scripts_replace_folder_file.sh.base"
    check_success "Failed to remove base script from $TEMPLATES_DIR"

    print_status "Uninstallation complete."
}

# Main script logic
if [ "$1" = "uninstall" ]; then
    uninstall_theme
else
    install_theme
fi
