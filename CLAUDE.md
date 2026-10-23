# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed as a Nix flake (nix-darwin + home-manager + Homebrew). It manages Neovim with LazyVim, Zsh shell, modern terminal tools and Homebrew packages. Language runtimes (Ruby, Node, Rust) belong to each project's devenv; Mise is kept only until projects have moved to devenv.

## Common Commands

### Installation and Setup
```bash
# First time only (installs darwin-rebuild)
sudo nix run nix-darwin -- switch --flake ~/projects/dotfiles#Mike-M5

# Apply changes after editing nix/*.nix or adding links
sudo darwin-rebuild switch --flake ~/projects/dotfiles

# Build without activating (safe check)
nix build .#darwinConfigurations.Mike-M5.system --no-link

# Update pinned inputs (nixpkgs, nix-darwin, home-manager)
nix flake update
```

Edits to files under `config/` take effect immediately (they are symlinked to this checkout); only changes to the `.nix` files need a rebuild. New files must be `git add`ed (at least `git add -N`) before Nix can see them.

### Adding a Homebrew package
Add it to `brews` or `casks` in `nix/homebrew.nix`, then run `darwin-rebuild switch`. `cleanup = "none"`, so removing a line does not uninstall the package.

### Language Versions
Ruby, Node and Rust are declared per project in `devenv.nix` (`languages.ruby.enable`, etc.), loaded by direnv via a `.envrc`:
```bash
devenv init
direnv allow
```

Python is managed by uv, not Mise or devenv globally:
```bash
uv python install --default
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
├── flake.nix                   # Flake entry point (machine Mike-M5)
├── flake.lock                  # Pinned inputs
├── starship.toml               # Starship prompt configuration
├── nix/
│   ├── darwin.nix              # System settings, fonts
│   ├── homebrew.nix            # Homebrew taps, brews, casks
│   └── home.nix                # Symlinks, home packages, activation steps
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
│   │   ├── ignore              # Global gitignore
│   │   └── cleanup.sh          # Branch cleanup script
│   ├── tmux/
│   │   └── tmux.conf           # Tmux configuration
│   ├── zsh/
│   │   └── zshrc               # Zsh shell config
│   ├── mise/
│   │   └── config.toml         # Version manager config (transitional)
│   ├── tmuxinator/             # Tmuxinator project templates
│   ├── zellij/                 # Alternative terminal multiplexer
│   ├── claude/                 # Claude Code settings, statusline, rules
│   ├── gh/                     # GitHub CLI config
│   └── ruby/                   # Ruby configs (irb, gem, debugger)
├── shortcuts/                  # macOS Shortcuts automation
└── zsh/                        # Legacy zsh location
```

### File Structure Philosophy
- **PARA Method**: Creates `~/projects`, `~/areas`, `~/resources`, `~/archive`
- **XDG Config**: Centralizes configs in `~/.config` where possible
- **Symlink Strategy**: Declared in `nix/home.nix`, linked back to this checkout

### Symlink Management
Symlinks are declared in `nix/home.nix` (`home.file` for `~`, `xdg.configFile` for `~/.config`). They use `mkOutOfStoreSymlink`, so each target points back at this checkout rather than a read-only store copy. Files already at a target are renamed with a `.pre-nix` suffix.

Examples:
- `config/zsh/zshrc` → `~/.zshrc`
- `config/git/gitconfig.symlink` → `~/.gitconfig`
- `config/nvim/` → `~/.config/nvim`
- `config/claude/settings.json` → `~/.claude/settings.json`

To link a new file, add an entry to `nix/home.nix` and rebuild.

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

## Mise (transitional)

`config/mise/config.toml` still pins global `node`, `ruby` and `rust`, and `zshrc` still runs `mise activate`. Once projects are on devenv, remove Mise from `zshrc`, `config/mise/`, `nix/home.nix` and `nix/homebrew.nix`.

## Development Tools Stack

### CLI Utilities (via nix/homebrew.nix)
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

## Activation Behavior

`darwin-rebuild switch` does the following:
1. Installs and configures Homebrew packages from `nix/homebrew.nix` (no auto-update or upgrade)
2. Installs Powerline fonts
3. Links all dotfiles via home-manager
4. Installs `devenv`, `direnv` (with nix-direnv) and `tmuxinator`
5. Creates `~/projects`, `~/areas`, `~/resources`, `~/archive`
6. Creates local config files (`~/.config/.aliases`, `~/.config/.env`)
7. Clones tmux plugin manager (tpm) to `~/.tmux/plugins/tpm` if missing

Still manual: `uv python install --default`, bun (for tmux-palette), and Mise runtimes until projects move to devenv.

## Configuration Patterns

### Environment Customization
Local machine-specific settings belong in:
- `~/.config/.env` - Environment variables
- `~/.config/.aliases` - Shell aliases

These files are created on switch but not tracked in git.

### Nix and secrets
Nix is installed by the Determinate installer, so `nix.enable = false` in `nix/darwin.nix`. System-wide Nix settings (binary caches, trusted users) go in `/etc/nix/nix.custom.conf`. The GitHub access token lives in `~/.config/nix/access-tokens.conf` (mode 600, included from `~/.config/nix/nix.conf`); never put it in this repo.

### Adding New Tools
1. Add brew packages to `nix/homebrew.nix` (or Nix packages to `home.packages` in `nix/home.nix`)
2. Add config files under `config/<tool>/`
3. Add a symlink entry in `nix/home.nix` if needed
4. Run `darwin-rebuild switch`

### Neovim Plugin Development
1. Add plugin spec to `config/nvim/lua/plugins/<name>.lua`
2. Follow LazyVim plugin spec format
3. Restart Neovim to auto-install

## Key File Paths

| File | Purpose |
|------|---------|
| `flake.nix` | Flake entry point |
| `nix/homebrew.nix` | Homebrew packages |
| `nix/home.nix` | Symlinks and home setup |
| `nix/darwin.nix` | System settings |
| `starship.toml` | Prompt configuration |
| `config/tmux/tmux.conf` | Tmux configuration |
| `config/zsh/zshrc` | Shell configuration |
| `config/nvim/lua/config/lazy.lua` | Plugin manager setup |
| `config/git/gitconfig.symlink` | Git configuration |
| `config/mise/config.toml` | Version manager config |
