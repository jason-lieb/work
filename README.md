# Dotfiles

Personal macOS configuration for a new machine.

## Setup

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./setup.sh
```

This will:
- Install Homebrew (if not present)
- Install packages from `Brewfile` (CLI tools and GUI apps)
- Symlink config files for fish, bash, zsh, git, ghostty, direnv, gh, Claude, npm, and VS Code
- Install VS Code extensions from `vscode/extensions.txt`
- Enable Touch ID for sudo
- Set fish as the default shell
- Back up any existing configs to `<config>.backup`

**Note:** Install Docker separately after setup.
