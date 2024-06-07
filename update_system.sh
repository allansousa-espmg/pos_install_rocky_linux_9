#!/bin/bash

# Atualizar o sistema
echo "Atualizando o sistema..."
sudo dnf update -y

# Instalar aplicativos
echo "Instalando aplicativos: zsh, neovim, curl, wget, tldr, net-tools, git, hyfetch"
sudo dnf install -y zsh neovim curl wget tldr net-tools git

# Instalar hyfetch
echo "Instalando hyfetch..."
# Clonar o repositório hyfetch
git clone https://github.com/hykilpikonna/hyfetch.git
# Entrar no diretório do hyfetch
cd hyfetch
# Compilar e instalar o hyfetch
sudo make install

# Finalização
echo "Atualização e instalação concluídas."
