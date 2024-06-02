{pkgs,lib,config, ...}:
{
  options = {
    rofi.enable = lib.mkEnableOption "enable rofi";
  };
  config = lib.mkIf config.rofi.enable{
    home.packages = with pkgs; [
      dracula-icon-theme
    ];

    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      font = "JetBrainsMono Nerd Font 13";
      location = "center";
      theme = ./theme.rasi;

    };
  };
}
