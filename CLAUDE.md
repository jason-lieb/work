# CLAUDE.md

## General Guidelines

- **Ask before fixing issues beyond the initial request** - Only fix what I explicitly ask for
- **Don't re-check known information** - Use earlier findings from this session instead of re-running commands
- **Stay within defined scope** - If I ask to fix X, don't also fix Y, Z, or "improve" surrounding code
- **No over-engineering** - Simple, targeted fixes only

## My Environment

- **Shell**: fish (default on macOS)
- **Package managers**: Homebrew (primary), Nix (for specific tools)
- **Node**: Managed via nvm
- **Editor**: VS Code

### Homebrew Notes
- `bun` requires tap first: `brew tap oven-sh/bun`
- Use `make` not `gnumake`
- Use `grep` not `ggrep`

### Shell Configuration
- Fish config: `~/.config/fish/config.fish`
- Environment variables should go in fish, not bash/zsh

## Git Operations

- Always check branch isolation before running reviews on multiple branches
- When squashing commits, verify if it involves the initial commit (requires `git rebase -i --root`)
- After changes, ensure lockfiles are updated and committed
- Prefer creating new commits over amending unless I specifically ask

## Code Changes

- Run tests after making changes, but don't fix pre-existing test failures unless asked
- Don't add comments, docstrings, or type annotations to code I didn't ask you to change
- Don't create abstractions or helpers for one-off operations

## When Unsure

Ask me instead of guessing. A quick question is better than undoing unwanted changes.
