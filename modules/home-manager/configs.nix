{pkgs,lib,config, ... }:{
    imports = [
        #Terminal modules
        ./terminal/fish.nix
        ./terminal/starship.nix
        ./terminal/cli.nix
        ./terminal/kitty.nix

        # Hyprland application
        ./hyprland/waybar.nix
        ./hyprland/hyprland.nix

        # Neovim config
        ./nvim/nvim.nix

        # Rofi config
        ./rofi/rofi.nix

    ];
    config = {

        # Terminal settings
        starship.enable = true;
        fish.enable = true;
        cli.enable = true;
        kitty.enable = true;

        # Hyprland and hyprland applications settings
        waybar.enable = true;
        hyprland.enable = true;

        # Neovim settings
        nvim.enable = true;

        # Rofi settings
        rofi.enable = true;



    };
}

