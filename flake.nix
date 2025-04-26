{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:Misterio77/nix-colors";

    # Nvim plugins
    solarized-osaka = {
      url = "github:craftzdog/solarized-osaka.nvim";
      flake = false;
    };

    nvim-copilot = {
      url = "github:zbirenbaum/copilot.lua";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/default/configuration.nix
          home-manager.nixosModules.default
        ];
      };
    };

    homeConfigurations = {
      "julienracette@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./hosts/default/home.nix
        ];
      };
    };
  };
}
