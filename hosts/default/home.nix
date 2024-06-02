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
        pkgs.jdk21
        (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode"]; })
    ];

    home.file = {
      "SDKs/Java/21".source = pkgs.jdk21.home;
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.home-manager.enable = true;

    colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
    
}
