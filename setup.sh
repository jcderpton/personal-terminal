#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

curl -L git.io/antigen > $SCRIPT_DIR/antigen.zsh

ln -s $SCRIPT_DIR/ ~/.shell_config
ln -s $SCRIPT_DIR/gitconfig ~/.gitconfig
ln -s $SCRIPT_DIR/vimrc ~/.vimrc
ln -s $SCRIPT_DIR/zshrc ~/.zshrc
ln -s $SCRIPT_DIR/bin ~/.bin
