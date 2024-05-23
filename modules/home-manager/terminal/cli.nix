{pkgs,lib,config, ...}:
{
    options = {
        cli.enable = lib.mkEnableOption "enable cli tools";
    };
    config = lib.mkIf config.cli.enable{
        home.packages = with pkgs;[
            done
                usbutils
                fzf
                ripgrep
                procps
                bat
                zoxide
                lsd
                wget
                unzip
                git
                xz

        ];
        programs.fish = {

            interactiveShellInit =''
                zoxide init fish | source;
                alias cd z
            '';
            shellAbbrs  = {

            };
            shellAliases = {
                ls = "lsd";
                cat = "bat";
            };


        };
    };
}
