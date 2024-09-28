#!/bin/bash

d=$(pwd)

# shellcheck disable=SC2045
for file in $(ls -a "$d/home-files"); do
  if [[ "$file" == "." ]] || [[ "$file" == ".." ]]; then
    continue
  fi

  # If the file already exists, ask for confirmation and replace the file
  if [[ -f "$HOME/$file" ]]; then
    echo "File $file already exists in $HOME. Replace it? (y/n)"
    read -r replace
    if [[ $replace == "y" ]]; then
     ln -sf "$d/home-files/$file" "$HOME/$file"
    fi
  else
    ln -s "$d/home-files/$file" "$HOME/$file"
  fi
done

if [[ ! -d "$HOME/Dev" ]]; then
  echo "Creating dev directory"
  mkdir "$HOME/Dev"
fi

if [[ ! -f "$HOME/Dev/.gitconfig" ]]; then
  echo "Creating gitconfig"
  echo "Enter your preferred git email"
  read -r email
  cat <<EOF > "$HOME/Dev/.gitconfig"
[user]
  email = "$email"
EOF
fi
