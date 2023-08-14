#!/usr/bin/env bash

echo "### Tmux ###"

source "scripts/util.sh"

curr_dir=$(pwd)
app_dir="config/tmux"

echo ">>> Copying .tmux.conf"
cp -v "$(construct_path "$curr_dir" $app_dir "tmux.conf")" "$(construct_path "$HOME" ".tmux.conf")"
