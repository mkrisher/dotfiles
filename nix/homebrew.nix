# Homebrew, declared from Nix. Replaces the Brewfile.
#
# To add something: append it to `brews` or `casks` below, then run
#   sudo darwin-rebuild switch --flake ~/projects/dotfiles
#
# nix-darwin does not install Homebrew itself; it must already be present.
{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false; # don't `brew update` on every rebuild
      upgrade = false; # upgrade deliberately with `brew upgrade`
      # "none" leaves anything not listed here alone. Switch to "uninstall"
      # (or "zap") once this list is complete, so removing a line removes the package.
      cleanup = "none";
    };

    taps = [
      "st0012/cctop"
    ];

    # Libraries the old Brewfile listed only as dependencies (xz, libtiff, webp,
    # jpeg-xl, aom, glib, gmp, libheif, liblqr, openjpeg, shared-mime-info,
    # zlib, tcl-tk, libgit2) are dropped; brew installs them as needed.
    brews = [
      "astro"
      "awscli"
      "bat"
      "bottom"
      "btop"
      "cloudflared"
      "eza"
      "fd"
      "fzf"
      "gh"
      "git"
      "git-secrets"
      "gitleaks"
      "herdr"
      "imagemagick"
      "jless"
      "jq"
      "lazygit"
      "libpq"
      "llvm"
      "luarocks"
      "mise"
      "neovim"
      "openssl@3"
      {
        name = "postgresql@14";
        restart_service = "changed";
      }
      "redis"
      "ripgrep"
      "ruby-build"
      "starship"
      "tldr"
      "tmux"
      "tree"
      "uv"
      "zellij"
      "zoxide"
      "zsh"
    ];

    casks = [
      "agentsview"
      "raycast"
      "st0012/cctop/cctop"
    ];
  };
}
