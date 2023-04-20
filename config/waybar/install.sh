#!/bin/bash

echo "### Waybar ###"

source "scripts/util.sh"

curr_dir=$(pwd)
app_dir="config/waybar"
app_config_dest=".config/waybar"

if [ ! -d "$(construct_path "$HOME" "$app_config_dest")" ];
then
    mkdir "$(construct_path "$HOME" "$app_config_dest")"
fi

echo ">>> Copying Waybar config"
cp -v "$(construct_path "$curr_dir" "$app_dir" "config")" "$(construct_path "$HOME" "$app_config_dest")"

echo ">>> Copying Waybar styles"
cp -v "$(construct_path "$curr_dir" "$app_dir" "style.css")" "$(construct_path "$HOME" "$app_config_dest")"
