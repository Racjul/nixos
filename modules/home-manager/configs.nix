{pkgs,lib,config, ... }:{
    imports = [
        #Terminal modules
        ./terminal/fish.nix
        ./terminal/starship.nix
        ./terminal/cli.nix

        ./hyprland/waybar.nix
        
    ];
    config = {
        starship.enable = true;
        fish.enable = true;
        cli.enable =true;
        waybar.enable = true;
    };
}

