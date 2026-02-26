# Dotfiles

Personal macOS configuration for a new machine.

## Prerequisites

Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Setup

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./setup.sh
```

This will:
- Install packages from `Brewfile` (CLI tools and GUI apps)
- Symlink config files for fish, bash, zsh, git, ghostty, direnv, gh, and VS Code
- Back up any existing configs to `~/.dotfiles-backup/`

## Post-Setup

1. **Set fish as default shell:**
   ```bash
   echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
   chsh -s /opt/homebrew/bin/fish
   ```

2. **Configure AWS SSO:** Edit `~/.aws/config` and replace placeholders

3. **Install VS Code extensions:**
   ```bash
   cat ~/dotfiles/vscode/extensions.txt | xargs -L 1 code --install-extension
   ```

4. **Start Colima (Docker runtime):**
   ```bash
   colima start
   ```
