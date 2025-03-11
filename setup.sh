#!/bin/bash

set -e

if [ -t 1 ]; then
  INTERACTIVE=1
  echo "Interactive shell detected"
else
  INTERACTIVE=0
  echo "Interactive shell NOT detected"
fi

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

  if [[ ! -f "$path" && $INTERACTIVE -eq 1 ]]; then
    echo "Creating gitconfig"
    echo "Enter your preferred git email"
    read -r email
    git config --file "$path" user.email "$email"
  fi
}

init_dotfiles() {
  # Create any directories that don't exist
  home_file_directories=$(find ./home-files -mindepth 1 -type d )
  for dir_with_prefix in $home_file_directories; do
    dir="$HOME/${dir_with_prefix#./home-files/}"
    if [[ ! -d "$dir" ]]; then
      mkdir -p "$dir"
      echo "Created directory $dir"
    else
      echo "Directory $dir already exists"
    fi
  done

  # Create files that don't exist
  home_files=$(find ./home-files -mindepth 1 -type f)
  for local_path in $home_files; do
    relative_path=${local_path#./home-files/}
    abs_local_path=$(realpath "$local_path")
    dest_path="$HOME/${local_path#./home-files/}"

    # If the file already exists, ask for confirmation and replace the file
    if [[ -f "$dest_path" ]]; then
      if [[ $INTERACTIVE -eq 0  ]]; then
        echo "Noninteractive. Appending files instead of replacing".
        cat "$abs_local_path" >> "$dest_path"
        continue
      fi

      echo "File $relative_path already exists. Replace it? (y/n)"
      read -r replace
      if [[ $replace == "y" ]]; then
        ln -sf "$abs_local_path" "$dest_path"
      else
        echo "Skipping $relative_path"
      fi
    else
      ln -s "$abs_local_path" "$dest_path"
      echo "Linked $relative_path"
    fi
  done
}


init_dotfiles

if [[ $NON_INTERACTIVE -eq 0 ]]; then
  echo "Noninteractive. Skipping dev directory and git config setup"
else
  init_dev_dir
  init_git_config
fi
