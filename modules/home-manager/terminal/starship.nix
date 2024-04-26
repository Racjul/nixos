
{pkgs,lib,config, ... }:
{
    options = {
        starship.enable = lib.mkEnableOption "enable starship";
    };
    config = lib.mkIf config.starship.enable {
        programs.starship = {
            enable = true;
            settings = 
            {
                format = lib.concatStrings[ 
                    "[   ](fg:#394261 bg:#a3aed2 bold)"
                    "$username"
                    "[](bg:#769ff0 fg:#a3aed2)"
                    "$directory"
                    "[](fg:#769ff0 bg:#394260)"
                    "$git_branch"
                    "$git_status"
                    "[](fg:#394260 bg:#212736)"
                    "$nodejs"
                    "$lua"
                    "$python"
                    "$cmake"
                    "$rust"
                    "$golang"
                    "$php"
                    "$localip"
                    "[](fg:#212736 bg:#1d2230)"
                    "$battery"
                    "$time"
                    "[ ](fg:#1d2230)"
                    "$nix_shell"
                    "\n$character"
                    ];
                username = 
                {
                    show_always = true;
                    style_user = "bg:#a3aed2 fg:#090c0c";
                    format = "[$user]($style)";

                };
                battery = 
                {
                    format = "[ $symbol$percentage](fg:#a0a9cb bg:#1d2230)";
                    display = [
                        {
                            threshold = 100;
                        }
                        {
                            threshold = 15;
                            style = "bold red";
                        }
                        {
                            threshold = 25;
                            style = "bold yellow";
                        }
                    ];
                    
                };
                directory = {

                    style = "fg:#e3e5e5 bg:#769ff0";
                    format = "[ $path ]($style)";
                    truncation_length = 3;
                    truncation_symbol = "…/";
                };

                git_branch = 
                {
                    symbol = "";
                    style = "bg:#394260";
                    format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
                };

                git_status = 
                {
                    style = "bg:#394260";
                    format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
                };

                localip = 
                {
                    ssh_only = true;
                    format = "@[$localipv4]($style)";
                    style = "bg:#212736";
                    disabled = false;
                };

                nodejs = 
                {
                    symbol = "";
                    style = "bg:#212736";
                    format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
                };

                rust = 
                {
                    symbol = "";
                    style = "bg:#212736";
                    format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
                };

                golang = 
                {
                    symbol = "";
                    style = "bg:#212736";
                    format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
                };

                cmake = 
                {
                    style = "bg:#212736";
                    format = "[ via $symbol($version )]($style)";
                    symbol =  "";
                };

                php = 
                {
                    symbol = "";
                    style = "bg:#212736";
                    format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
                };

                python = 
                {
                    symbol = " ";
                    style = "bg:#212736";
                    format = "[ [$symbol$pyenv_prefix($version )(\($virtualenv\) )](fg:#769ff0 bg:#212736)]($style)";
                };

                lua = 
                {
                    symbol = " ";
                    style = "bg:#212736";
                    format = "[[ $symbol](fg:#769ff0 bg:#212736)]($style)";
                };

                time = 
                {
                    disabled = false;
                    time_format = "%R"; 
                    style = "bg:#1d2230";
                    format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
                };
            };


        };



    };

}

