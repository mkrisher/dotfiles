# User-level config (home-manager): dotfile symlinks and home directory setup.
{ config, lib, pkgs, dotfiles, ... }:
let
  # Link straight to the checkout rather than a read-only store copy, so tools
  # that write to their config (e.g. lazy-lock.json) keep working.
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    devenv # per-project dev environments (languages, services, gems)
    tmuxinator # global command; the projects it launches are in config/tmuxinator
  ];

  # Loads each project's devenv when you cd into it. Projects opt in with a
  # .envrc containing:  eval "$(devenv direnvrc)" && use devenv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.file = {
    ".zshrc".source = link "config/zsh/zshrc";
    ".tmux.conf".source = link "config/tmux/tmux.conf";
    ".gitconfig".source = link "config/git/gitconfig.symlink";
    ".gemrc".source = link "config/ruby/gemrc.symlink";
    ".irbrc".source = link "config/ruby/irbrc.symlink";
    ".rdebugrc".source = link "config/ruby/rdebugrc.symlink";
    ".tmuxinator".source = link "config/tmuxinator";

    ".claude/settings.json".source = link "config/claude/settings.json";
    ".claude/statusline.js".source = link "config/claude/statusline.js";
    ".claude/rules".source = link "config/claude/rules";
  };

  xdg.configFile = {
    "nvim".source = link "config/nvim";
    "mise/config.toml".source = link "config/mise/config.toml";
    "zellij/config.kdl".source = link "config/zellij/config.kdl";
    "starship.toml".source = link "starship.toml";
    "git/ignore".source = link "config/git/ignore";
    "gh/config.yml".source = link "config/gh/config.yml";
  };

  # Things that aren't plain symlinks. These run on every switch, so each
  # step must be safe to repeat.
  home.activation = {
    paraDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      run mkdir -p "$HOME/projects" "$HOME/areas" "$HOME/resources" "$HOME/archive"
    '';

    # Machine-local, untracked files sourced by zshrc.
    localEnv = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      run touch "$HOME/.config/.env" "$HOME/.config/.aliases"
    '';

    tpm = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        run ${pkgs.git}/bin/git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
      fi
    '';
  };

  # Runtimes (Ruby, Node, Rust) and gems like bundler live in each project's
  # devenv.nix, not here. Still manual / unmigrated:
  #   - Python: `uv python install --default`
  #   - bun (for tmux-palette): curl -fsSL https://bun.sh/install | bash
  #   - mise: kept until projects are on devenv, then drop it from zshrc,
  #     config/mise, and the Homebrew list
}
