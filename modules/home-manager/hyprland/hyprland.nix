{pkgs,lib,config, ...}:
{
  options = {
    hyprland.enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf config.hyprland.enable{
      

  programs.hyprland = {
    enable = true;
    config = {
      # Monitor Configuration
      monitors = {
        eDP-1 = {
          resolution = "1920x1080";
          refreshRate = 144;
          position = "0x0";
          scale = 1.0;
        };
      };

      # Window Rules
      windowRules = [
        {
          ruleType = "tile";
          ruleValue = "title:.*\\.pdf.*";
          floating = false;
        }
      ];

      # Startup Applications
      execOnce = [
        "waybar"
      ];

      # Variables
      variables = {
        terminal = "kitty";
        fileManager = "dolphin";
        menu = "rofi -show drun";
        browser = "firefox";
      };

      # Environment Variables
      env = {
        XCURSOR_SIZE = "24";
        QT_QPA_PLATFORMTHEME = "qt5ct";
      };

      # Input Configuration
      input = {
        kb_layout = "us";
        follow_mouse = true;
        touchpad = {
          natural_scroll = false;
        };
        sensitivity = 0;
      };

      # General Settings
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        col = {
          active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          inactive_border = "rgba(595959aa)";
        };
        layout = "dwindle";
        allow_tearing = false;
      };

      # Decoration Settings
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        col = {
          shadow = "rgba(1a1a1aee)";
        };
      };

      # Animations
      animations = {
        enabled = true;
        bezier = {
          name = "myBezier";
          points = [ 0.05 0.9 0.1 1.05 ];
        };
        presets = {
          windows = {
            duration = 1;
            curve = "myBezier";
            options = {};
          };
          windowsOut = {
            duration = 1;
            curve = "default";
            options = { mode = "popin"; duration = "80%"; };
          };
          border = {
            duration = 1;
            curve = "default";
            options = {};
          };
          fade = {
            duration = 1;
            curve = "default";
            options = {};
          };
        };
      };

      # Dwindle Settings
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Gestures
      gestures = {
        workspace_swipe = "on";
      };

      # Miscellaneous
      misc = {
        force_default_wallpaper = -1;
      };

      # Keybindings
      bindings = [
        { mod = "SUPER"; key = "T"; action = "exec kitty"; }
        { mod = "SUPER"; key = "Q"; action = "killactive"; }
        { mod = "SUPER"; key = "M"; action = "exit"; }
        { mod = "SUPER"; key = "E"; action = "exec dolphin"; }
        { mod = "SUPER"; key = "V"; action = "togglefloating"; }
        { mod = "SUPER"; key = "A"; action = "exec rofi -show drun"; }
        { mod = "SUPER"; key = "F"; action = "exec firefox"; }
        { mod = "SUPER"; key = "P"; action = "pseudo"; }
        { mod = "SUPER"; key = "J"; action = "togglesplit"; }
        # Add workspace bindings
      ];
    };
  };
};
    
  }
 
