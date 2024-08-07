#!/bin/bash

d=$(pwd)

for file in $(ls -a $d/home-files); do
  if [ $file == "." ] || [ $file == ".." ]; then
    continue
  fi

  # If the file already exists, ask for confirmation and replace the file
  if [ -f "$HOME/$file" ]; then
    echo "File $file already exists in $HOME. Replace it? (y/n)"
    read replace
    if [ $replace == "y" ]; then
     ln -sf $d/home-files/$file $HOME/$file
    fi
  else
    ln -s $d/home-files/$file $HOME/$file
  fi
done
