#!/bin/bash
# Setup script for dotfiles
# Run this script to symlink all dotfiles to your home directory

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
HOME_DIR="$HOME"

echo "Setting up dotfiles from $DOTFILES_DIR"

# Create necessary directories
mkdir -p "$HOME_DIR/.config/fish"
mkdir -p "$HOME_DIR/.config/ghostty"
mkdir -p "$HOME_DIR/.config/gh"
mkdir -p "$HOME_DIR/.config/direnv"
mkdir -p "$HOME_DIR/.aws"
mkdir -p "$HOME_DIR/.claude"
mkdir -p "$HOME_DIR/.npm-packages"
mkdir -p "$HOME_DIR/Library/Application Support/Code/User/snippets"

# Function to create symlink with backup
link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "Backing up existing $dest to ${dest}.backup"
        mv "$dest" "${dest}.backup"
    fi

    if [ -L "$dest" ]; then
        rm "$dest"
    fi

    echo "Linking $src -> $dest"
    ln -s "$src" "$dest"
}

# Link shell configs
link_file "$DOTFILES_DIR/.config/fish/config.fish" "$HOME_DIR/.config/fish/config.fish"
link_file "$DOTFILES_DIR/.bashrc" "$HOME_DIR/.bashrc"
link_file "$DOTFILES_DIR/.zshrc" "$HOME_DIR/.zshrc"

# Link git configs
link_file "$DOTFILES_DIR/.gitconfig" "$HOME_DIR/.gitconfig"
link_file "$DOTFILES_DIR/.gitignore" "$HOME_DIR/.gitignore"

# Link app configs
link_file "$DOTFILES_DIR/.config/ghostty/config" "$HOME_DIR/.config/ghostty/config"
link_file "$DOTFILES_DIR/.config/gh/config.yml" "$HOME_DIR/.config/gh/config.yml"
link_file "$DOTFILES_DIR/.config/direnv/direnvrc" "$HOME_DIR/.config/direnv/direnvrc"

# Link other configs
link_file "$DOTFILES_DIR/.aws/config" "$HOME_DIR/.aws/config"
link_file "$DOTFILES_DIR/.claude/settings.json" "$HOME_DIR/.claude/settings.json"
link_file "$DOTFILES_DIR/.npmrc" "$HOME_DIR/.npmrc"

# Link VSCode settings (macOS path)
VSCODE_USER_DIR="$HOME_DIR/Library/Application Support/Code/User"
link_file "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"

# Link VSCode snippets
for lang in typescript typescriptreact javascript javascriptreact; do
    link_file "$DOTFILES_DIR/vscode/snippets/typescript.json" "$VSCODE_USER_DIR/snippets/${lang}.json"
done

echo ""
echo "Dotfiles setup complete!"
echo ""
echo "Next steps:"
echo "1. Install Homebrew: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
echo "2. Install packages: brew bundle --file=$DOTFILES_DIR/Brewfile"
echo "3. Set fish as default shell: chsh -s /opt/homebrew/bin/fish"
echo "4. Install VSCode extensions: cat $DOTFILES_DIR/vscode/extensions.txt | xargs -L1 code --install-extension"
echo "5. Update AWS config with your credentials: $HOME_DIR/.aws/config"
echo "6. Enable Touch ID for sudo (System Preferences > Touch ID & Password > Use Touch ID for sudo)"
