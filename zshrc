# Path to your oh-my-zsh installation.

# Autocompletion
if [ -d $HOME/.zsh-completions ]; then
  fpath=($HOME/.zsh-completions $fpath)
fi

# antigen
source "$HOME/.shell_config/antigen.zsh"
antigen use oh-my-zsh

# Regular bundles
antigen bundles <<EOBUNDLES
  command-not-found
  common-aliases
  debian
  history
  jira
  nyan
  ruby
  sudo
  vagrant
  web-search
EOBUNDLES

# Github bundles
antigen bundles <<EOBUNDLES
  Tarrasch/zsh-autoenv
  unixorn/autoupdate-antigen.zshplugin
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions
EOBUNDLES

antigen theme tjkirch

export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

CASE_SENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"

# User configuration
#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:$PATH:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
export apt_pref=apt-get

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

alias reload=". $HOME/.zshrc"
alias tmux="TERM=xterm-256color tmux"
alias g='git'
alias c='clear'

# Apply local settings if applicable
if [ -f $HOME/.local-additions ]; then
  . $HOME/.local-additions
fi

if [ -d $HOME/.local-additions ]; then
  for f in $HOME/.local-additions/*.zsh; do
    . $f
  done
fi

antigen apply
