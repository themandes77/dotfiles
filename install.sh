#!/bin/bash

echo "Installing"

# Make symlink

if [ ! -d "$HOME/.config/wezterm" ]; then
	printf "wezterm config folder not found, creating symlink\n"
	ln -s "$(pwd)/wezterm" "$HOME/.config/wezterm"
	printf "done\n"
else
	printf "wezterm config folder found... \n"
fi

if [ ! -d "$HOME/.config/nvim" ]; then
	printf "nvim folder not found, making symlink\n"
	ln -s "$(pwd)/nvim" "$HOME/.config/nvim"
	printf "done...\n"
else
	printf "allready installed\n"
fi

if [ ! -d "$HOME/.config/ohmyposh" ]; then
	printf "oh my posh folder not found, making symlink\n"
	ln -s "$(pwd)/ohmyposh" "$HOME/.config/ohmyposh"
	printf "done...\n"
else
	printf "allready installed\n"
fi


printf "completed syslinks"
