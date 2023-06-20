#!/bin/bash

echo "### Alacritty ###"

source "scripts/util.sh"

curr_dir=$(pwd)
app_dir="config/alacritty"
app_config_dest=".config/alacritty"

alacritty_theme="alacritty-theme"

echo ">>> Copying themes"
cp -rv "$(construct_path "$curr_dir" $app_dir $alacritty_theme)" "$(construct_path "$HOME" $app_config_dest)"

echo ">>> Copying alacritty.yml"
cp -v "$(construct_path "$curr_dir" $app_dir "alacritty.yml")" "$(construct_path "$HOME" $app_config_dest "alacritty.yml")"
