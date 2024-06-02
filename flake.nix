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
        solarized-osaka.url = "github:craftzdog/solarized-osaka.nvim";
        solarized-osaka.flake = false;

        nvim-tree.url = "github:nvim-tree/nvim-tree.lua";
        nvim-tree.flake = false;

        nvim-copilot.url = "github:zbirenbaum/copilot.lua";
        nvim-copilot.flake = false;

    };
    
    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations= {
            nixos = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs;};
                modules = [
                    ./hosts/default/configuration.nix
                    inputs.home-manager.nixosModules.default
                ];
            };
            homeConfigurations = {

                "julienracette@nixos" = inputs.home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.x86_64-linux;
                    extraSpecialArgs = {inherit inputs;};
                    modules = [
                        ./hosts/default/home.nix
                    ];
                };

            };
        };
    };

}
