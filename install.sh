#!/bin/bash
#=============================================================================#
# Title       : install.sh
# Description : Sets up my configuration files
# Author      : Cristian Llanos <cristianllanos@outlook.com>
# Date        : 2016-06-12T19:46:00Z-05:00
# Usage       : bash install.sh <username>
#=============================================================================#

SOURCE=${BASH_SOURCE[0]}
USER=${1-$(whoami)}

# If the user needs sudo privileges, proxy the command using sudo.
if [[ "$EUID" -ne 0 ]]
then
    sudo ${SOURCE} "${@-$USER}"
    exit 0
fi

DOTFILES=$(cd $(dirname ${SOURCE}) && pwd)
USER=$1

#==============================================================================
# Git
#==============================================================================

ln -s ${DOTFILES}/.gitconfig ${HOME}/.gitconfig
ln -s ${DOTFILES}/.gitignore-global ${HOME}/.gitignore-global
echo "Git [configurations] registered"

#==============================================================================
# Vim
#==============================================================================

# Vim resource file
ln -s ${DOTFILES}/.vimrc ${HOME}/.vimrc
echo "Vim [vimrc] registered"

# Vim Vundle plugins and configuration
ln -s ${DOTFILES}/plugins.vimrc ${HOME}/plugins.vimrc
echo "Vim [vundle plugins] registered"

# Vim colors
mkdir -p ~/.vim/colors
ln -s ${DOTFILES}/vim/colors ${HOME}/.vim/colors
echo "Vim [colors] registered"

# Vim snippets
mkdir -p ~/.vim/snippets
ln -s ${DOTFILES}/vim/snippets ${HOME}/.vim/snippets
echo "Vim [snippets] registered"

# Install VimVundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "VimVundle installed"

# Vim install plugins
vim +PluginInstall +qall
echo "Vim Plugins installed"

#==============================================================================
# Fish
#==============================================================================

mkdir -p ~/.config/fish
ln -s ${DOTFILES}/config.fish /home/${USER}/.config/fish/config.fish
echo "Fish [configurations] registered"

#==============================================================================
# Binaries
#==============================================================================

# Enables vhost command
cp ${DOTFILES}/scripts/vhost.sh /usr/local/bin/vhost
sudo chmod a+x /usr/local/bin/vhost
echo "Command [vhost] enabled"
