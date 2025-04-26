{ config, pkgs,inputs, ... }:
{
    home.username = "julienr";
    home.homeDirectory = "/home/julienr";
    home.stateVersion = "23.11";

    imports = [
        ../../modules/home-manager/configs.nix
        inputs.nix-colors.homeManagerModules.default
    ];
    home.packages = [
      pkgs.jdk21
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.fira-code
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.home-manager.enable = true;
    programs.firefox.enable = true;

    colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
    
}
