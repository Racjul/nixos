{pkgs,lib,config, ... }:
{
    options = {
       kitty.enable = lib.mkEnableOption "enable kitty";
    };
    config = lib.mkIf config.kitty.enable{
        programs.kitty = {
            enable = true;
            theme = "Catppuccin-Mocha";
            font = {
              name  = "JetBrainsMono NF Medium" ;
              size = 12;
            };
            settings = {
                window_padding_width = 0;
                confirm_os_window_close=0;
            };
        };
    };

}
