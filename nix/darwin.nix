# System-level macOS settings (nix-darwin).
{ pkgs, user, ... }:
{
  # Nix itself is installed and managed by the Determinate installer, so
  # nix-darwin must not try to manage the daemon or nix.conf.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;

  system.primaryUser = user;
  users.users.${user}.home = "/Users/${user}";

  # Keeps /etc/zshrc wired up for nix-darwin; the user's zshrc is linked in home.nix.
  programs.zsh.enable = true;

  fonts.packages = [ pkgs.powerline-fonts ];

  # Bump only after reading the nix-darwin changelog.
  system.stateVersion = 6;
}
