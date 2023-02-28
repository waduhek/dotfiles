#!/bin/bash

echo "### Hack Nerd Font ###"

git_path="https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts"
font_name="Hack"
font_styles=("Regular" "Italic" "Bold" "BoldItalic")
font_files=(
    "Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
    "Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
    "Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf"
    "Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
)
saved_font_file_names=(
    "HackRegularNerdFontCompleteMono.ttf"
    "HackItalicNerdFontCompleteMono.ttf"
    "HackBoldNerdFontCompleteMono.ttf"
    "HackBoldItalicNerdFontCompleteMono.ttf"
)

echo ">>> Checking if user fonts directory is present"
user_fonts_dir="${HOME}/.local/share/fonts"

if [ ! -d "$user_fonts_dir" ]
then
    echo ">>> User fonts directory not present. Creating..."
    mkdir "$user_fonts_dir"
fi

echo ">>> Creating font directory"
font_dir="${user_fonts_dir}/${font_name}Nerd"
mkdir "$font_dir"

echo ">>> Downloading Hack Nerd fonts"

for i in "${!font_styles[@]}"
do
    curr_font_style=${font_styles[$i]}
    curr_font_file=${font_files[$i]}
    curr_saved_font_file=${saved_font_file_names[$i]}

    curl -fLo "${font_dir}/${curr_saved_font_file}" "${git_path}/${font_name}/${curr_font_style}/complete/${curr_font_file}"
done

echo ">>> Updating font cache"
fc-cache --force --verbose
