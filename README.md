# Dotfiles

Personal macOS configuration for a new machine.

## Setup

```bash
git clone <https-repo-url>
cd work
./setup.sh
```

This will:
- Install Homebrew (if not present)
- Install packages from `Brewfile` (CLI tools and GUI apps)
- Symlink config files for fish, bash, zsh, git, ghostty, direnv, gh, Claude, npm, SSH, and VS Code
- Install VS Code extensions from `vscode/extensions.txt`
- Enable Touch ID for sudo
- Generate SSH key and add to GitHub (if no key exists)
- Set fish as the default shell
- Back up any existing configs to `<config>.backup`

**Note:** Install Docker separately after setup.

**Claude Code Plugins:** After setup, install plugins manually:
```bash
claude plugin add code-reviewer@renaissance-marketplace
claude plugin add superpowers@renaissance-marketplace
```
