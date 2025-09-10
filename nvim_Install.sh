#!/bin/bash

sudo apt install snap -y 

sudo apt install nvim --classic

mkdir -p ~/.config/

git clone https://github.com/crocodileBigger/astroVim.git ~/.config/nvim

nvim
