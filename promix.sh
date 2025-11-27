#!/bin/bash

ICON_DIR="$HOME/.local/share/icons/Promix"
TEMPLATES_DIR="$HOME/.config/wpg/templates"
REPO_DIR="$(pwd)"
if [ "$1" = "uninstall" ]; then
    rm -rf "$ICON_DIR"
    rm -f "$TEMPLATES_DIR/Promix_scripts_replace_folder_file.sh.base"
    rm -f "$TEMPLATES_DIR/Promix_scripts_replace_folder_file.sh"
    echo "Uninstalled!"
else
        
    mkdir -p "$HOME/.local/share/icons"
    mkdir -p "$TEMPLATES_DIR"

    # Copy icons
    cp -r "$REPO_DIR/Promix" "$HOME/.local/share/icons/"



    # Add the script to wpgtk (this creates the actual executable)
    wpg -ta "$ICON_DIR/scripts/replace_folder_file.sh"

    # Copy the .base template file you made
    cp "$REPO_DIR/Promix_scripts_replace_folder_file.sh.base" "$TEMPLATES_DIR/"
    # Make scripts executable
    chmod +x "$ICON_DIR/scripts/"*.sh

    # Update icon cache
    gtk-update-icon-cache -f -t "$ICON_DIR" 2>/dev/null || true

    echo "Done! Run 'wpg' to apply your wallpaper and test."
fi 
