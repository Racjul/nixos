{pkgs,lib,config, ... }:
{

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
                done
                fzf
                ripgrep
                grc
                procps
                neofetch
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
            interactiveShellInit = ''
            starship init fish | source;
            set fish_greeting; # Disable greeting
            neofetch;
            '';
            plugins = [
                { name = "grc"; src = pkgs.fishPlugins.grc.src; }
                { name = "done"; src = pkgs.fishPlugins.done.src; }
                { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
                { name = "forgit"; src = pkgs.fishPlugins.forgit.src; }
                { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
            ];
        };
        programs.kitty.shellIntegration.enableFishIntegration = true;
    };
}
