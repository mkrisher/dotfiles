# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository using a Ruby-based Rake automation system. It manages development environment setup including Neovim with LazyVim, Zsh shell, modern terminal tools, and language runtimes via Mise.

## Common Commands

### Installation and Setup
```bash
# Full dotfiles installation
rake install

# Remove all dotfiles and configurations
rake uninstall

# Install Homebrew packages from Brewfile
brew bundle install

# List all installed language versions
mise ls
```

### Language Version Management
```bash
# Install specific language versions
mise use -g ruby@3.4.4
mise use -g python@3
mise use -g node@22
mise use -g rust

# Install additional versions
mise exec ruby@3.4.4
mise exec python@3
mise exec node@22
mise use -g rust@1.82 && cargo build
```

### Git Operations
Git config is managed via `config/git/gitconfig.symlink` with extensive aliases for common operations.

### Tmux Plugin Management
After first tmux session, press `leader + I` to install plugins using tpm.

## Architecture and Organization

### File Structure Philosophy
- **PARA Method**: Uses Projects, Areas, Resources, Archives directories in `$HOME`
- **XDG Config**: Attempts to centralize all configs in `~/.config`
- **Symlink Strategy**: Files are kept in dotfiles repo and symlinked to system locations

### Key Directories
- `config/nvim/`: LazyVim-based Neovim configuration
- `config/git/`: Git configuration and global gitignore
- `config/zsh/`: Zsh shell customization
- `config/tmux/`: Terminal multiplexer configuration
- `config/zellij/`: Modern terminal multiplexer (alternative to tmux)
- `config/raycast/`: macOS launcher extensions
- `fonts/`: Powerline-compatible font collection
- `shortcuts/`: macOS Shortcuts automation files

### Core Technologies
- **Shell**: Zsh with Starship prompt
- **Editor**: Neovim with LazyVim distribution
- **Terminal**: Supports both Tmux and Zellij multiplexers
- **Package Manager**: Homebrew (managed via Brewfile)
- **Version Manager**: Mise for Ruby, Python, Node, Rust
- **File Organization**: PARA method implementation

### Development Tools Stack
Essential tools installed via Brewfile include:
- `bat`, `eza`, `fd`, `fzf`, `ripgrep`, `tree` (modern CLI utilities)
- `gh`, `lazygit`, `git-secrets`, `gitleaks` (Git workflow)
- `neovim`, `tmux`, `zellij` (development environment)
- `jq`, `jless` (JSON processing)
- `btop`, `bottom` (system monitoring)

### Installation Behavior
The `rake install` task:
1. Creates PARA directory structure in `$HOME`
2. Creates `.aliases` and `.env` files in `~/.config`
3. Symlinks all configuration files to appropriate locations  
4. Installs Homebrew if not present
5. Installs Powerline fonts for terminal display
6. Sets up language runtimes via Mise
7. Configures tmux plugin manager (tpm)

### Configuration Management
- Environment-specific settings go in `~/.config/.env` and `~/.config/.aliases`
- All configs attempt XDG compliance but some tools require `$HOME` locations
- Git, tmux configs are symlinked to both `~/.config` and `$HOME` for compatibility