#!/bin/bash

init_dev_dir() {
  path="$HOME/Dev"

  if [[ ! -d "$path" ]]; then
    echo "Creating dev directory"
    mkdir "$path"
  else
    echo "Dev directory already exists"
  fi
}

init_git_config() {
  path="$HOME/Dev/.gitconfig"

  if [[ ! -f "$path" ]]; then
    echo "Creating gitconfig"
    echo "Enter your preferred git email"
    read -r email
    git config --file "$path" user.email "$email"
  else
    echo "Dev gitconfig already exists"
  fi
}

init_dotfiles() {
  home_files=$(ls -a "./home-files")

  for file in $home_files; do
    echo "$file"
    continue

    # Skip the current and parent directory
    if [[ "$file" == "." ]] || [[ "$file" == ".." ]]; then
      continue
    fi

    # If the file already exists, ask for confirmation and replace the file
    if [[ -f "$HOME/$file" ]]; then
      echo "File $file already exists in $HOME. Replace it? (y/n)"
      read -r replace
      if [[ $replace == "y" ]]; then
      ln -sf "./home-files/$file" "$HOME/$file"
      else
        echo "Skipping $file"
      fi
    else
      ln -s "./home-files/$file" "$HOME/$file"
      echo "Linked $file"
    fi
  done
}


init_dotfiles
init_dev_dir
init_git_config
