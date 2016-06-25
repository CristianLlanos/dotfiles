#!/bin/bash
#=============================================================================#
# Title       : install.sh
# Description : Sets up my configuration files
# Author      : Cristian Llanos <cristianllanos@outlook.com>
# Date        : 2016-06-12T19:46:00Z-05:00
# Usage       : bash install.sh
#=============================================================================#

SOURCE=${BASH_SOURCE[0]}
DOTFILES=$(cd $(dirname ${SOURCE}) && pwd)

# If the user needs sudo privileges, proxy the command using sudo.
if [[ "$EUID" -ne 0 ]]
then
    sudo ${SOURCE} "$@"
    exit
fi

#==============================================================================
# Git
#==============================================================================

ln -s ${DOTFILES}/.gitconfig ~/.gitconfig
ln -s ${DOTFILES}/.gitignore-global ~/.gitignore-global
echo "Git [configurations] registered"

#==============================================================================
# Vim
#==============================================================================

# Vim resource file
ln -s ${DOTFILES}/.vimrc ~/.vimrc
echo "Vim [vimrc] registered"

# Vim Vundle plugins and configuration
ln -s ${DOTFILES}/plugins.vimrc ~/plugins.vimrc
echo "Vim [vundle plugins] registered"

# Vim colors
mkdir -p ~/.vim/colors
ln -s ${DOTFILES}/vim/colors ~/.vim/colors
echo "Vim [colors] registered"

# Vim snippets
mkdir -p ~/.vim/snippets
ln -s ${DOTFILES}/vim/snippets ~/.vim/snippets
echo "Vim [snippets] registered"

#==============================================================================
# Fish
#==============================================================================

mkdir -p ~/.config/fish
ln -s ${DOTFILES}/config.fish ~/.config/fish/config.fish
echo "Fish [configurations] registered"

#==============================================================================
# Binaries
#==============================================================================

# Enables vhost command
cp ${DOTFILES}/scripts/vhost.sh /usr/local/bin/vhost
sudo chmod a+x /usr/local/bin/vhost
echo "Command [vhost] enabled"
