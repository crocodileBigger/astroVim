#!/bin/bash

sudo apt install snap -y 

sudo apt install nvim --classic

mkdir -p ~/.config/

mv astroVim ~/.config/nvim

nvim
