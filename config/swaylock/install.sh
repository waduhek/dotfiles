#!/bin/bash

echo "### Swaylock ###"

source "scripts/util.sh"

curr_dir=$(pwd)
app_dir="config/swaylock"
app_config_dest=".config/swaylock"

echo ">>> Copying Swaylock config"
if [ ! -d "$(construct_path "$HOME" "$app_config_dest")" ];
then
    mkdir "$(construct_path "$HOME" "$app_config_dest")"
fi
cp -v "$(construct_path "$curr_dir" "$app_dir" "config")" "$(construct_path "$HOME" "$app_config_dest")"
