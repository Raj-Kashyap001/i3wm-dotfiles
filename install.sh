#!/bin/bash


copy_configs() {
    local source_dir="$1"
    local dest_dir="$HOME/.config"

  
    mkdir -p "$dest_dir"

   
    for folder in "$source_dir"/*; do
        if [[ -d "$folder" ]]; then
            config_name=$(basename "$folder")
            dest_folder="$dest_dir/$config_name"

           
            if [[ -d "$dest_folder" ]]; then
                mv "$dest_folder" "$dest_folder.bkp"
            fi

            cp -r "$folder" "$dest_folder"
            echo "Copied $config_name config."
        fi
    done
}


echo "Installing config files..."


echo "Make sure you have installed the following packages:"
echo "- picom for blur effect: https://github.com/ibhagwan/picom-ibhagwan-git"
echo "- i3 for window gaps: https://github.com/Airblader/i3"
echo "Other packages can be installed via your operating system's package manager."


copy_configs "dotfiles"


echo "Note: I've changed keybindings for quitting window to Mod+q in i3. You can modify it in the i3/config file."

echo "To make polybar modules work make sure to make theme executable by this command chmod +x ~/.config/polybar/*.sh" 

echo "Installation complete."


