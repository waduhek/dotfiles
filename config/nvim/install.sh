#!/usr/bin/env bash

echo "### NeoVim ###"
source "scripts/util.sh"

curr_dir=$(pwd)
app_dir="config/nvim"
app_config_dest=$(construct_path "$HOME" ".config/nvim")

echo ">>> Checking if lua directory exists"
dest_lua_dir=$(construct_path "$app_config_dest" "lua")

if [ ! -d "$dest_lua_dir" ]
then
    echo ">>> Lua directory does not exist. Creating..."
    mkdir --parents "$dest_lua_dir"
fi

echo ">>> Checking if constants folder exists"
if [ ! -d "$(construct_path "$dest_lua_dir" "constants")" ]
then
    echo ">>> constants are not present. Copying constants..."
    cp -rv "$(construct_path "$curr_dir" $app_dir "lua" "constants")" "$(construct_path "$dest_lua_dir")"
else
    echo ">>> constants are present. Skipping overwrite"
fi

echo ">>> Copying init.lua"
cp -v "$(construct_path "$curr_dir" $app_dir "init.lua")" "$(construct_path "$app_config_dest" "init.lua")"

echo ">>> Copying plugins.lua"
cp -v "$(construct_path "$curr_dir" $app_dir "lua" "plugins.lua")" "$(construct_path "$dest_lua_dir" "plugins.lua")"

echo ">>> Copying configs"
if [ -d "$(construct_path "$dest_lua_dir" "configs")" ]
then
    rm -r "$(construct_path "$dest_lua_dir" "configs")"
fi

cp -rv "$(construct_path "$curr_dir" "$app_dir" "lua" "configs")" "$(construct_path "$dest_lua_dir")"

echo ">>> Copying maps"
if [ -d "$(construct_path "$dest_lua_dir" "maps")" ]
then
    rm -r "$(construct_path "$dest_lua_dir" "maps")"
fi

cp -rv "$(construct_path "$curr_dir" "$app_dir" "lua" "maps")" "$(construct_path "$dest_lua_dir")"

echo ">>> Copying after directory"
if [ -d "$(construct_path "$app_config_dest" "after")" ]
then
    rm -r "$(construct_path "$app_config_dest" "after")"
fi

cp -rv "$(construct_path "$curr_dir" "$app_dir" "after")" "$(construct_path "$app_config_dest")"
