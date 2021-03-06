#! /bin/env bash

XDG_CONFIG_HOME=$HOME/.config

# files
declare -A dot_files
dot_files=(
  ["zshrc"]="zsh/.zshrc" \
)
for file in "${!dot_files[@]}"; do
  if [[ -f  $HOME/$file ]]; then
    mv $HOME/$file $HOME/.$file.$(date +'%Y%m%d%H%M%S').backup
  fi 

  ln -s $DOTPATH/${dot_files[$file]} $HOME/.$file
done

# directories
link_dirs=(zsh)
for dir in "${link_dirs[@]}"; do
  if [ -d "$XDG_CONFIG_HOME/$dir" ]; then
    mv $XDG_CONFIG_HOME/$dir $XDG_CONFIG_HOME/$dir.$(date +'%Y%m%d%H%M%S').backup
  fi
  ln -snf $DOTPATH/$dir $XDG_CONFIG_HOME/$dir
done