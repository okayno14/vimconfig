#!/usr/bin/env bash

wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage
mkdir -p ~/.local/bin
chmod +x nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage ~/.local/bin

