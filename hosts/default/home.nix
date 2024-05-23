{ config, pkgs,inputs, ... }:

{
    home.username = "julienracette";
    home.homeDirectory = "/home/julienracette";
    home.stateVersion = "23.11";

    imports = [
        ../../modules/home-manager/configs.nix
        inputs.nix-colors.homeManagerModules.default
    ];
    home.packages = [
        (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode"]; })
    ];

    home.file = {
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.home-manager.enable = true;

    colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
    
}
