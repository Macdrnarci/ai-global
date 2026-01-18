#!/bin/bash

# AI-Config Installation Script
# Usage: curl -fsSL https://raw.githubusercontent.com/nanxiaobei/ai-config/main/install.sh | bash

set -e

REPO_URL="https://raw.githubusercontent.com/nanxiaobei/ai-config/main"
CONFIG_DIR="$HOME/.ai-config"

echo "Installing AI-Config..."

# Create config directory
mkdir -p "$CONFIG_DIR"

# Download main script
curl -fsSL "$REPO_URL/ai-config" -o "$CONFIG_DIR/ai-config"
chmod +x "$CONFIG_DIR/ai-config"

# Add to PATH
if [[ -d /usr/local/bin ]] && [[ -w /usr/local/bin ]]; then
    ln -sf "$CONFIG_DIR/ai-config" /usr/local/bin/ai-config
    echo "Installed to /usr/local/bin/ai-config"
else
    mkdir -p "$HOME/.local/bin"
    ln -sf "$CONFIG_DIR/ai-config" "$HOME/.local/bin/ai-config"
    echo "Installed to ~/.local/bin/ai-config"
    echo ""
    echo "Make sure ~/.local/bin is in your PATH:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

echo ""
echo "AI-Config installed! Run 'ai-config' to get started."
