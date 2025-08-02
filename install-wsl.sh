#!/usr/bin/env bash
set -euo pipefail

echo "Installing Oh My Posh to /usr/local/bin..."
curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin

echo "Creating theme config directory..."
mkdir -p ~/.oh-my-posh

echo "Downloading Powerline Prism theme config..."
curl -sSL https://raw.githubusercontent.com/Jose-AE/oh-my-posh-template-powerline-prism/main/powerline_prism.omp.json \
    -o ~/.oh-my-posh/powerline_prism.omp.json

echo "Updating ~/.bashrc to initialize Oh My Posh..."

eval_line='eval "$(oh-my-posh init bash --config ~/.oh-my-posh/powerline_prism.omp.json)"'

if ! grep -qxF "$eval_line" ~/.bashrc; then
    echo "$eval_line" >> ~/.bashrc
    echo "Added Oh My Posh init to ~/.bashrc"
else
    echo "Oh My Posh init already present in ~/.bashrc"
fi

echo "Installation complete! Run 'source ~/.bashrc' or restart your terminal to apply changes."
