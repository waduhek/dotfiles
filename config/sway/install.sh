#!/usr/bin/env bash

echo "### Sway ###"

source "scripts/util.sh"

curr_dir=$(pwd)
app_dir="config/sway"
app_config_dest=".config/sway"

echo ">>> Copying Sway config"
if [ ! -d "$(construct_path "$HOME" "$app_config_dest")" ];
then
    mkdir "$(construct_path "$HOME" "$app_config_dest")"
fi
cp -v "$(construct_path "$curr_dir" "$app_dir" "config")" "$(construct_path "$HOME" "$app_config_dest")"

echo ">>> Copying scripts folder"
cp -rv "$(construct_path "$curr_dir" "$app_dir" "scripts")" "$(construct_path "$HOME" "$app_config_dest")"
# shellcheck disable=SC2046
chmod -v +x $(construct_path "$HOME" "$app_config_dest" "scripts" "*.sh")
