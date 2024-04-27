{pkgs,lib,config, ... }:{
    imports = [
        ./terminal/fish.nix
        ./terminal/starship.nix
        ./terminal/cli.nix
    ];
    config = {
        starship.enable = true;
        fish.enable = true;
        cli.enable =true;
    };
}

