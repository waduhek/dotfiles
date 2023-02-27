#!/bin/sh

echo "### NeoVim ###"
source "scripts/util.sh"

curr_dir=$(pwd)
app_dir="config/nvim"
app_config_dest=$(construct_path $HOME ".config/nvim")

echo ">>> Checking if Packer.nvim is installed"
nvim_pack_dir=$(construct_path $HOME ".local/share/nvim/site/pack/packer")

if [ ! -d "$nvim_pack_dir" ]
then
    echo ">>> Packer.nvim was not found. Installing..."
    git clone --depth 1 https://github.com/wbthomason/packer.nvim $(construct_path $nvim_pack_dir "start" "packer.nvim")
else
    echo ">>> Packer.nvim was found"
fi

echo ">>> Checking if lua directory exists"
dest_lua_dir=$(construct_path $app_config_dest "lua")

if [ ! -d "$dest_lua_dir" ]
then
    echo ">>> Lua directory does not exist. Creating..."
    mkdir $dest_lua_dir
fi

echo ">>> Checking if constants folder exists"
dest_constants_dir=$(construct_path $dest_lua_dir "constants")

if [ ! -d "$dest_constants_dir" ]
then
    echo ">>> constants are not present. Copying constants..."
    cp -rv $(construct_path $curr_dir $app_dir "lua" "constants") $dest_constants_dir
else
    echo ">>> constants are present. Skipping overwrite"
fi

echo ">>> Copying init.lua"
cp -v $(construct_path $curr_dir $app_dir "init.lua") $(construct_path $app_config_dest "init.lua")

echo ">>> Copying plugins.lua"
cp -v $(construct_path $curr_dir $app_dir "lua" "plugins.lua") $(construct_path $dest_lua_dir "plugins.lua")

echo ">>> Copying configs"
if [ ! -d $(construct_path $dest_lua_dir "configs") ]
then
    mkdir $(construct_path $dest_lua_dir "configs")
fi

for config_file in $(construct_path $curr_dir $app_dir "lua" "configs" "*.lua")
do
    cp -v $config_file $(construct_path $dest_lua_dir "configs")
done

echo ">>> Copying maps"
if [ ! -d $(construct_path $dest_lua_dir "maps") ]
then
    mkdir $(construct_path $dest_lua_dir "maps")
fi

for config_file in $(construct_path $curr_dir $app_dir "lua" "maps" "*.lua")
do
    cp -v $config_file $(construct_path $dest_lua_dir "maps")
done
