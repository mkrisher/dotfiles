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
mise use -g ruby@3.4.7
mise use -g node@22
mise use -g rust

# Python is managed by uv, not mise
uv python install --default

# Check current versions
mise current
```

### Git Operations
Git config is managed via `config/git/gitconfig.symlink` with extensive aliases:
- `git st` - status (ignoring submodules)
- `git cm` - commit
- `git br` - branch
- `git co` - checkout
- `git df` - diff
- `git lg` - log with patch
- `git lo` - one-line log
- `git pom` - pull origin master
- `git pop` / `git save` - stash operations
- `git edit` - open modified files in editor

### Tmux Operations
- **Prefix**: `Ctrl+A` (not default Ctrl+B)
- **Install plugins**: `<prefix> + I` (first run)
- **Reload config**: `<prefix> + Ctrl+r`
- **Edit config**: `<prefix> + Ctrl+e`

## Architecture and Organization

### Directory Structure
```
dotfiles/
├── Rakefile                    # Installation automation
├── Brewfile                    # Homebrew package definitions
├── starship.toml               # Starship prompt configuration
├── config/
│   ├── nvim/                   # LazyVim-based Neovim config
│   │   ├── init.lua            # Bootstrap loader
│   │   ├── lazyvim.json        # LazyVim extras config
│   │   ├── lua/config/         # Core Neovim settings
│   │   │   ├── lazy.lua        # Plugin manager setup
│   │   │   ├── options.lua     # Vim options
│   │   │   ├── keymaps.lua     # Custom keymaps
│   │   │   └── autocmds.lua    # Autocommands
│   │   ├── lua/plugins/        # Plugin configurations
│   │   │   ├── claude.lua      # Claude Code integration
│   │   │   ├── colorscheme.lua # GitHub Colorblind theme
│   │   │   ├── goose.lua       # Goose AI plugin
│   │   │   └── lsp_lines.lua   # LSP diagnostics
│   │   └── snippets/           # Code snippets (ruby, rails, rspec)
│   ├── git/
│   │   ├── gitconfig.symlink   # Git configuration
│   │   ├── gitignore.symlink   # Global gitignore
│   │   └── cleanup.sh          # Branch cleanup script
│   ├── tmux/
│   │   └── tmux.conf           # Tmux configuration
│   ├── zsh/
│   │   └── zshrc               # Zsh shell config
│   ├── mise/
│   │   └── config.toml         # Version manager config
│   ├── tmuxinator/             # Tmuxinator project templates
│   ├── zellij/                 # Alternative terminal multiplexer
│   ├── gh/                     # GitHub CLI config
│   └── ruby/                   # Ruby configs (irb, gem, debugger)
├── shortcuts/                  # macOS Shortcuts automation
└── zsh/                        # Legacy zsh location
```

### File Structure Philosophy
- **PARA Method**: Creates `~/projects`, `~/areas`, `~/resources`, `~/archive`
- **XDG Config**: Centralizes configs in `~/.config` where possible
- **Symlink Strategy**: Two-tier approach for compatibility

### Symlink Management
The Rakefile creates symlinks with this pattern:

**Direct XDG (preferred)**:
- `config/nvim/` → `~/.config/nvim`
- `config/mise/config.toml` → `~/.config/mise/config.toml`
- `config/zellij/config.kdl` → `~/.config/zellij/config.kdl`

**Dual symlink (compatibility)**:
- Git: `config/git/gitconfig.symlink` → `~/.config/.gitconfig` → `~/.gitconfig`
- Tmux: `config/tmux/tmux.conf` → `~/.config/.tmux.conf` → `~/.tmux.conf`

**Root level**:
- `Brewfile` → `~/Brewfile`

## Neovim Configuration

### LazyVim Extras Enabled
From `config/nvim/lazyvim.json`:
- **AI**: copilot
- **Coding**: luasnip, mini-snippets
- **Editor**: neo-tree, telescope
- **Formatting**: black
- **Languages**: docker, git, json, python, ruby, rust, sql, tailwind, toml, typescript, vue, yaml
- **UI**: edgy, mini-animate, smear-cursor

### Custom Plugins
| Plugin | Purpose | Key Bindings |
|--------|---------|--------------|
| claudecode.nvim | Claude AI integration | `<leader>a*` prefix |
| github-nvim-theme | GitHub Colorblind colorscheme | - |
| goose.nvim | AI code generation | - |
| lsp_lines.nvim | Enhanced LSP diagnostics | - |

### Key Settings
- **Leader key**: `\` (backslash)
- **Line numbers**: Absolute + relative
- **Colorscheme**: GitHub Colorblind

## Tmux Configuration

### Key Bindings Reference
| Action | Binding |
|--------|---------|
| Prefix | `Ctrl+A` |
| Previous/Next window | `Ctrl+[` / `Ctrl+]` |
| Last window (MRU) | `Tab` |
| New window | `c` |
| Split horizontal | `\|` |
| Split vertical | `_` |
| Select pane | `[` / `]` |
| Resize pane | `+` / `-` |
| Kill session | `Q` |
| Detach | `D` |
| Copy mode | `Alt+Up` |

### Theme
- Catppuccin Frappe color scheme
- Status bar shows: directory, user, host, session

## Zsh Configuration

### PATH Extensions
- Homebrew (`/opt/homebrew/bin`, `/usr/local/bin`)
- Cargo (`~/.cargo/bin`)
- Local bin (`~/.local/bin`)
- LLVM (`/opt/homebrew/opt/llvm/bin`)

### Integrations
- Starship prompt
- Zoxide (z command for navigation)
- Mise version management
- Google Cloud SDK (if installed)

### Key Bindings
- `Alt+D` / `Alt+C` - Backward/forward word
- `Alt+A` / `Alt+E` - Beginning/end of line

## Mise Version Configuration

From `config/mise/config.toml`:
```toml
[tools]
node = "22"
ruby = "3.4.7"
rust = "latest"
```

## Development Tools Stack

### CLI Utilities (via Brewfile)
| Tool | Purpose |
|------|---------|
| bat | Syntax-highlighted cat |
| eza | Modern ls replacement |
| fd | Fast find replacement |
| fzf | Fuzzy finder |
| ripgrep | Fast grep replacement |
| tree | Directory visualization |
| zoxide | Smart directory navigation |
| jq, jless | JSON processing |
| btop, bottom | System monitoring |
| tldr | Simplified man pages |

### Git Tools
- gh (GitHub CLI)
- lazygit (TUI for git)
- git-secrets (secret scanning)
- gitleaks (secret detection)

## Installation Behavior

The `rake install` task performs:
1. Creates PARA directory structure (`~/projects`, `~/areas`, `~/resources`, `~/archive`)
2. Creates local config files (`~/.config/.aliases`, `~/.config/.env`)
3. Symlinks all configuration files
4. Installs Homebrew if not present
5. Runs `brew bundle install`
6. Clones and installs Powerline fonts
7. Installs language runtimes via Mise:
   - Ruby 3.4.4 with bundler, tmuxinator, neovim gems
   - Node 22
   - Rust (latest)
   - Python 3 via uv (`uv python install --default`)
8. Clones tmux plugin manager (tpm) to `~/.tmux/plugins/tpm`

## Configuration Patterns

### Environment Customization
Local machine-specific settings belong in:
- `~/.config/.env` - Environment variables
- `~/.config/.aliases` - Shell aliases

These files are created by install but not tracked in git.

### Adding New Tools
1. Add brew packages to `Brewfile`
2. Add config files under `config/<tool>/`
3. Update `Rakefile` with symlink commands if needed
4. Run `rake install` to apply

### Neovim Plugin Development
1. Add plugin spec to `config/nvim/lua/plugins/<name>.lua`
2. Follow LazyVim plugin spec format
3. Restart Neovim to auto-install

## Key File Paths

| File | Purpose |
|------|---------|
| `Rakefile` | Installation automation (149 lines) |
| `Brewfile` | Package definitions (110 lines) |
| `starship.toml` | Prompt configuration (88 lines) |
| `config/tmux/tmux.conf` | Tmux configuration (212 lines) |
| `config/zsh/zshrc` | Shell configuration (58 lines) |
| `config/nvim/lua/config/lazy.lua` | Plugin manager setup (53 lines) |
| `config/git/gitconfig.symlink` | Git configuration |
| `config/mise/config.toml` | Version manager config |
