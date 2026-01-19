#!/bin/bash

# AI Global Installation Script
# Usage: curl -fsSL https://raw.githubusercontent.com/nanxiaobei/ai-global/main/install.sh | bash

set -e

REPO_URL="https://raw.githubusercontent.com/nanxiaobei/ai-global/main"
CONFIG_DIR="$HOME/.ai-global"

echo "Installing AI Global..."

# Create config directory
mkdir -p "$CONFIG_DIR"

# Download main script
curl -fsSL "$REPO_URL/ai-global" -o "$CONFIG_DIR/ai-global"
chmod +x "$CONFIG_DIR/ai-global"

# Download package.json for version info
curl -fsSL "$REPO_URL/package.json" -o "$CONFIG_DIR/package.json"

# Add to PATH
if [[ -d /usr/local/bin ]] && [[ -w /usr/local/bin ]]; then
    ln -sf "$CONFIG_DIR/ai-global" /usr/local/bin/ai-global
    echo "Installed to /usr/local/bin/ai-global"
else
    mkdir -p "$HOME/.local/bin"
    ln -sf "$CONFIG_DIR/ai-global" "$HOME/.local/bin/ai-global"
    echo "Installed to ~/.local/bin/ai-global"
    echo ""
    echo "Make sure ~/.local/bin is in your PATH:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

echo ""
echo "AI Global installed! Run 'ai-global' to get started."
