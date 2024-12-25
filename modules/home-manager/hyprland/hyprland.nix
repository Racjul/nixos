{pkgs,lib,config, ...}:
{

  options = {
    hyprland.enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf config.hyprland.enable{

    #Files for hyprpaper
    home.file = {
      "wallpapers/wallpaper.jpg" = {source = ./wallpapers/wallpaper.jpg;};
      ".config/hypr/hyprpaper.conf" = {source = ./config/hyprpaper.conf;};
    };

    home.packages = with pkgs; [
      hyprpaper
    ];

    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
      # Mod key
      "$mod" = "SUPER";

      # Monitors
      monitor = [
        "eDP-1,1920x1080@144,0x0,1"
      ];

      # Window rules
      windowrulev2 = [
        "tile, title:.*\\.pdf.*, floating=0"
        "suppressevent maximize, class:.*"
      ];

      # Execute at launch
      exec-once = [
        "waybar"
        "hyprpaper"
      ];

      # Variables
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "rofi -show drun";
      "$browser" = "firefox";
      "$moveactivewindow"=''grep -q "true" <<< $(hyprctl activewindow -j | jq -r .floating) && hyprctl dispatch moveactive'';

      # Environment variables
      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      # Input settings
      input = {
        kb_layout = "us,ca";
        kb_options = "caps:swapescape";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "no";
        };
        sensitivity = 0;
      };

      # General settings
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        allow_tearing = "false";
      };

      # Decoration settings
      decoration = {
        rounding = 10;
        blur = {
          enabled = "true";
          size = 3;
          passes = 1;
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };      # Layout settings
    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };

      # Gestures
      gestures = {
        workspace_swipe = "on";
      };

      # Miscellaneous
      misc = {
        force_default_wallpaper = "-1";
        disable_splash_rendering = true;
      };

      # Keybindings
      bind =
        [
          # Launch apps
          "$mod, F, exec, $browser"
          "$mod, T, exec, $terminal"
          "$mod, E, exec, $fileManager"
          "$mod, A, exec, pkill -x rofi || $menu"

          # System actions
          "$mod, Q, killactive"
          "$mod, Delete, exit"
          "$mod, W, togglefloating"
          "Alt, Return, fullscreen"

          # Group
          "$mod, G, togglegroup"
          "$mod CTRL , L, changegroupactive, f"
          "$mod CTRL , H, changegroupactive, b"

          # Move/Change window focus
          "$mod, Left, movefocus, l"
          "$mod, Right, movefocus, r"
          "$mod, Up, movefocus, u"
          "$mod, Down, movefocus, d"
          "Alt, Tab, movefocus, d"

          #Change kb language
          ''$mod+SPACE, exec,hyprctl switchxkblayout at-translated-set-2-keyboard next''
          "$mod+Ctrl, Right, workspace, r+1"
          "$mod+Ctrl, Left, workspace, r-1"
          "$mod+Ctrl+Alt, Right, movetoworkspace, r+1"
          "$mod+Ctrl+Alt, Left, movetoworkspace, r-1"
          "$mod+Alt, S, movetoworkspacesilent, special"
          "$mod, S, togglespecialworkspace,"

          "$mod SHIFT $CONTROL, left,exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow l"
          "$mod SHIFT $CONTROL, right,exec, $moveactivewindow 30 0 || hyprctl dispatch movewindow r"
          "$mod SHIFT $CONTROL, up,exec, $moveactivewindow  0 -30 || hyprctl dispatch movewindow u"
          "$mod SHIFT $CONTROL, down,exec, $moveactivewindow 0 30 || hyprctl dispatch movewindow d"

          # Pseudo tiling
          "$mod, P, pseudo"
          "$mod, J, togglesplit"
        ]
        ++ (
          # Dynamic workspace bindings (1-9)
          builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
          )
          9)
          );
        };
      };
    };

  }

