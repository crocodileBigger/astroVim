#!/bin/bash
# Script para identificar a distribuição base e instalar Neovim via snap

if command -v dnf &>/dev/null; then
  sudo dnf install -y snapd
  echo "Base: Red Hat / Fedora (dnf encontrado)"

elif command -v yum &>/dev/null; then
  sudo yum install -y snapd
  echo "Base: Red Hat / CentOS (yum encontrado)"

elif command -v apt &>/dev/null; then
  sudo apt update && sudo apt install -y snapd
  echo "Base: Debian / Ubuntu (apt encontrado)"

elif command -v zypper &>/dev/null; then
  sudo zypper install -y snapd
  echo "Base: SUSE (zypper encontrado)"

elif command -v pacman &>/dev/null; then
  sudo pacman -Sy --noconfirm snapd
  echo "Base: Arch Linux (pacman encontrado)"

elif command -v apk &>/dev/null; then
  sudo apk add snapd
  echo "Base: Alpine Linux (apk encontrado)"

else
  echo "Não consegui identificar pelo gerenciador de pacotes."
fi

echo "Instalando Neovim atualizado..."
sudo snap install nvim --classic

if [[ ! -d ~/.config ]]; then
  echo "Criando ~/.config"
  mkdir -p ~/.config
fi

if [[ -d ~/.config/nvim ]]; then
  echo "Salvando configurações antigas (.bak)"
  mv ~/.config/nvim{,.bak}
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}
fi

echo "Movendo novas configurações do nvim"
mv nvim ~/.config/nvim

nvim
