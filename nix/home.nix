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
    ffmpeg # audio/video decoding; used by pi-voice's transcribe_file tool
    # Pi's launcher runs `#!/usr/bin/env node`, so it needs a global node.
    # Project devenvs and mise still come first on PATH.
    nodejs_24
    tmuxinator # global command; the projects it launches are in config/tmuxinator
  ];

  # Loads each project's devenv when you cd into it. Projects opt in with a
  # .envrc containing:  eval "$(devenv direnvrc)" && use devenv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
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
    ".claude/skills".source = link "config/claude/skills";

    # Pi writes settings.json in place, so the symlink survives. pi-voice.json
    # is seeded by the piVoiceSettings step below instead, because pi-voice
    # saves by renaming a temp file over it, which would replace a symlink.
    ".pi/agent/settings.json".source = link "config/pi/settings.json";
    ".pi/agent/pi-jefferson.json".source = link "config/pi/pi-jefferson.json";
  };

  xdg.configFile = {
    "nvim".source = link "config/nvim";
    "mise/config.toml".source = link "config/mise/config.toml";
    "zellij/config.kdl".source = link "config/zellij/config.kdl";
    "starship.toml".source = link "starship.toml";
    "git/ignore".source = link "config/git/ignore";
    "gh/config.yml".source = link "config/gh/config.yml";
    "ghostty/config".source = link "config/ghostty/config";
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

    # Pi installs and updates itself (`pi update`) under ~/.pi/agent/install,
    # so only bootstrap it here. Once installed, the linked settings.json
    # makes Pi fetch its packages on first run. ~/.local/bin goes first on
    # PATH so the installer puts the `pi` link there without editing zshrc;
    # piping through cat skips its "Start pi now?" prompt. PI_* variables are
    # cleared because a switch run from inside Pi would otherwise point the
    # installer at that session's install. A failure only warns, so being
    # offline doesn't block the rest of the switch.
    piInstall = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -e "$HOME/.local/bin/pi" ] && [ ! -L "$HOME/.local/bin/pi" ]; then
        run mkdir -p "$HOME/.local/bin"
        run env -u PI_MANAGED_INSTALL_ROOT -u PI_CODING_AGENT_DIR PATH="$HOME/.local/bin:${pkgs.nodejs_24}/bin:/usr/bin:/bin:/usr/sbin:/sbin" \
          /bin/bash -o pipefail -c '/usr/bin/curl -fsSL https://pi.dev/install.sh | /bin/sh | /bin/cat' \
          || warnEcho "Pi install failed; run: curl -fsSL https://pi.dev/install.sh | sh"
      fi
    '';

    # Copy, don't link (see the note on .pi/agent/settings.json above). After
    # changing voice settings, copy ~/.pi/agent/pi-voice.json back into
    # config/pi to keep them.
    piVoiceSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -e "$HOME/.pi/agent/pi-voice.json" ]; then
        run mkdir -p "$HOME/.pi/agent"
        run cp "${dotfiles}/config/pi/pi-voice.json" "$HOME/.pi/agent/pi-voice.json"
        run chmod 600 "$HOME/.pi/agent/pi-voice.json"
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
