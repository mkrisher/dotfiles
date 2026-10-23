{
  description = "mkrisher's macOS setup: nix-darwin + home-manager + Homebrew";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nix-darwin, home-manager, ... }:
    let
      user = "mkrisher";
      # Absolute path to this checkout. Dotfiles are symlinked here (not copied
      # into the Nix store) so edits are live without a rebuild.
      dotfiles = "/Users/${user}/projects/dotfiles";
    in
    {
      # Apply with: sudo darwin-rebuild switch --flake .#Mike-M5
      darwinConfigurations."Mike-M5" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit user dotfiles; };
        modules = [
          ./nix/darwin.nix
          ./nix/homebrew.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # Existing files at link targets get renamed instead of failing.
            home-manager.backupFileExtension = "pre-nix";
            home-manager.extraSpecialArgs = { inherit user dotfiles; };
            home-manager.users.${user} = import ./nix/home.nix;
          }
        ];
      };
    };
}
