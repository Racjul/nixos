{pkgs,lib,config, ...}:
{
    options = {
        cli.enable = lib.mkEnableOption "enable cli tools";
    };
    config = lib.mkIf config.cli.enable{
        home.packages = with pkgs;[
            done
            fzf
            ripgrep
            procps
            bat
            zoxide
            lsd
        ];
        programs.fish = {

            interactiveShellInit =''
                zoxide init fish | source;
            '';
            shellAbbrs  = {
                ls = "lsd";
                cat = "bat";
                cd = "z";

            };
        };
    };
}
