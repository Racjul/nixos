{pkgs,lib,config, ... }:
{
    imports = [
        ./starship.nix
            ./cli.nix
    ];
    options ={
        fish.enable = lib.mkEnableOption "enables fish";
    };

    config = lib.mkIf config.fish.enable {
        home.packages = with pkgs; [
            fishPlugins.done
                fishPlugins.fzf-fish
                fishPlugins.forgit
                fishPlugins.hydro
                fishPlugins.grc
                grc
                nix-your-shell
                fastfetch
        ];
        programs.bash = {
            enable = true;
            initExtra = ''
                if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
                    then
                        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
                        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
                        fi

                       
                                ''; 
        };
        programs.fish = {

            enable = true;

            interactiveShellInit= ''
                set fish_greeting; # Disable greeting
                fastfetch;
                 if command -q nix-your-shell
                            nix-your-shell fish | source
                                end
            '';

            plugins = [
            { name = "grc"; src = pkgs.fishPlugins.grc.src; }
            { name = "done"; src = pkgs.fishPlugins.done.src; }
            { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
            { name = "forgit"; src = pkgs.fishPlugins.forgit.src; }
            { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
            ];

            functions = {

            };

            shellAbbrs = {

            };
           

        };
        programs.kitty.shellIntegration.enableFishIntegration = true;
    };
}
