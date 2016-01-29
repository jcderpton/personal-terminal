#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s $SCRIPT_DIR/antigen ~/.antigen
ln -s $SCRIPT_DIR/gitconfig ~/.gitconfig
ln -s $SCRIPT_DIR/tmux.conf ~/.tmux.conf
ln -s $SCRIPT_DIR/vimrc ~/.vimrc
ln -s $SCRIPT_DIR/zshrc ~/.zshrc
