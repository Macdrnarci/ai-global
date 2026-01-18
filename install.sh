#!/bin/bash

# AI-Link Installation Script
# Usage: curl -fsSL https://raw.githubusercontent.com/nanxiaobei/ai-link/main/install.sh | bash

set -e

CONFIG_DIR="$HOME/.ai-config"
REPO_URL="https://raw.githubusercontent.com/nanxiaobei/ai-link/main"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[INFO]${NC} Installing ai-link..."

mkdir -p "$CONFIG_DIR"

# Download ai-link script
curl -fsSL "$REPO_URL/ai-link" -o "$CONFIG_DIR/ai-link"
chmod +x "$CONFIG_DIR/ai-link"

# Add to PATH
if [[ -d /usr/local/bin ]] && [[ -w /usr/local/bin ]]; then
    ln -sf "$CONFIG_DIR/ai-link" /usr/local/bin/ai-link
    echo -e "${GREEN}[OK]${NC} Added ai-link to /usr/local/bin"
elif [[ -d "$HOME/.local/bin" ]] || mkdir -p "$HOME/.local/bin"; then
    ln -sf "$CONFIG_DIR/ai-link" "$HOME/.local/bin/ai-link"
    echo -e "${GREEN}[OK]${NC} Added ai-link to ~/.local/bin"
    echo -e "${BLUE}[INFO]${NC} Make sure ~/.local/bin is in your PATH"
else
    echo -e "${BLUE}[INFO]${NC} Add this to your shell config:"
    echo "    export PATH=\"\$HOME/.ai-config:\$PATH\""
fi

echo ""
echo -e "${GREEN}[OK]${NC} Installation complete!"
echo ""
echo "Run 'ai-link' to scan and link all your AI tools"
