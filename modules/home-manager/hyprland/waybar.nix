{pkgs,lib,config, ...}:
{
  options = {
    waybar.enable = lib.mkEnableOption "enable waybar";
  };
  config = lib.mkIf config.waybar.enable{
    programs.waybar = {
      enable = true;
      settings = 
      {
        mainBar = {
          "height"= 35;
          "layer"= "top";
          "margin-bottom"= 0;
          "margin-left"= 0;
          "margin-right"= 0;
          "margin-top"= 0;
          "position"= "top";
          modules-center= [
            "hyprland/workspaces"
            "hyprland/window"
          ];
          modules-left= [
            "custom/launcher"
            "custom/playerctl#backward"
            "custom/playerctl#play"
            "custom/playerctl#foward"
            "custom/playerlabel"
          ];
          modules-right= [
            "backlight"
            "tray"
            "battery"
            "pulseaudio"
            "network"
            "clock"
          ];

          "battery"= {
            "format"= "{icon}  {capacity}%";
            "format-alt"= "{icon} {time}";
            "format-charging"= "{capacity}% ";
            "format-icons"= [
              ""
              ""
              ""
              ""
              ""
            ];
            "format-plugged"= " {capacity}% ";
            "states"= {
              "critical"= 15;
              "good"= 95;
              "warning"= 30;
            };
          };
          "hyprland/window"={
            "max-length"=30;
          };   
          "backlight"= {
            "device"= "acpi_video1";
            "format"= "{percent}% {icon}";
            "format-icons"= [""  ""  ""  ""  ""  ""  ""  "" ""];
          };
          "clock"= {
            "format"= "  {:%I:%M}";
            "format-alt"= "  {:%d/%m}";
            "tooltip"= "true";
            "tooltip-format"= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
          "cpu"= {
            "format"="󰻠 {usage}%";
            "format-alt"= "󰻠 {avg_frequency} GHz";
            "interval"= 5;
          };
          "custom/launcher"= {
            "format"= "";
            "tooltip"= "false";
            "on-click"="rofi -show drun -show-icons";
          };
          "custom/playerctl#backward"= {
            "format"= "󰙣 ";
            "on-click"= "playerctl previous";
            "on-scroll-down"= "playerctl volume .05-";
            "on-scroll-up"= "playerctl volume .05+";
          };
          "custom/playerctl#foward"= {
            "format"= "󰙡 ";
            "on-click"= "playerctl next";
            "on-scroll-down"= "playerctl volume .05-";
            "on-scroll-up"= "playerctl volume .05+";
          };
          "custom/playerctl#play"= {
            "exec"= "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
            "format"= "{icon}";
            "format-icons"= {
              "Paused"= "<span> </span>";
              "Playing"= "<span>󰏥 </span>";
              "Stopped"= "<span> </span>";
            };
            "on-click"= "playerctl play-pause";
            "on-scroll-down"= "playerctl volume .05-";
            "on-scroll-up"= "playerctl volume .05+";
            "return-type"= "json";
          };
          "custom/playerlabel"= {
            "exec"= "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
            "format"= "<span>󰎈 {} 󰎈</span>";
            "max-length"= 40;
            "on-click"= "";
            "return-type"= "json";
          };

          "memory"= {
            "format"= "󰍛 {}%";
            "format-alt"= "󰍛 {used}/{total} GiB";
            "interval"= 5;
          };

          "network"= {
            "format-disconnected"= "󰖪 0% ";
            "format-ethernet"= "󰈀 100% ";
            "format-linked"= "{ifname} (No IP)";
            "format-wifi"= "   {signalStrength}%";
            "tooltip-format"= "Connected to {essid} {ifname} via {gwaddr}";
            "on-click"="nm-connection-editor";
          };
          "pulseaudio"= {
            "format"= "{icon} {volume}%";
            "format-icons"= {
              "default"= [
                "󰕿"
                "󰖀"
                "󰕾"
              ];
            };
            "format-muted"= "󰝟";
            "on-click"= "pavucontrol";
            "scroll-step"= 5;
          };
          "tray"= {
            "icon-size"= 20;
            "spacing"= 8;
          };
          "wlr/workspaces"= {
            "active-only"= false;
            "all-outputs"= false;
            "disable-scroll"= false;
            "format"= "{name}";
            "format-icons"= {
              "active"= "";
              "default"= "";
              "sort-by-number"= true;
              "urgent"= "";
            };
            "on-click"= "activate";
            "on-scroll-down"= "hyprctl dispatch workspace e+1";
            "on-scroll-up"= "hyprctl dispatch workspace e-1";
          };

        };

      };





      style = 
      ''

      * {
        border: none;
        border-radius: 0px;
        font-family: FiraCode;
        font-size: 14px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(0,0,0,0);
      }

#workspaces {
  background: #25253a;
  margin: 5px 5px;
  padding: 8px 5px;
  border-radius: 16px;
  color: #cba6f7
}
#workspaces button {
  padding: 0px 5px;
  margin: 0px 3px;
  border-radius: 16px;
  color: transparent;
  background: rgba(17,17,27,1);
  transition: all 0.3s ease-in-out;
}

#workspaces button.active {
  background-color: #89b4fa;
  color: #11111B;
  border-radius: 16px;
  min-width: 50px;
  background-size: 400% 400%;
  transition: all 0.3s ease-in-out;
}

#workspaces button:hover {
  background-color: #6FB8AC;
  color: #11111B;
  border-radius: 16px;
  min-width: 50px;
  background-size: 400% 400%;
}

#tray, #pulseaudio, #network, #battery,
#custom-playerctl.backward, #custom-playerctl.play, #custom-playerctl.foward,
#clock,#backlight{
  background: #25253a;
  font-weight: bold;
  margin: 5px 0px;
}
#tray, #pulseaudio, #network, #battery, #clock,#backlight{
  color: #f5f5f5;
  border-radius: 10px 24px 10px 24px;
  padding: 0 20px;
  margin-left: 7px;
}


#custom-playerctl.backward, #custom-playerctl.play, #custom-playerctl.foward {
  background: #25253a;
  font-size: 22px;
}

#custom-playerctl.backward {
  color: #89b4fa;
  border-radius: 24px 0px 0px 10px;
  padding-left: 16px;
  margin-left: 7px;
}
#custom-playerctl.play {
  color: #89b4fa;
  padding: 0 5px;
}
#custom-playerctl.foward {
  color: #89b4fa;
  border-radius: 0px 10px 24px 0px;
  padding-right: 12px;
  margin-right: 7px
}
#custom-playerlabel {
  background: #25253a;
  padding: 0 20px;
  color: #f5f5f5;
  border-radius: 24px 10px 24px 10px;
  margin: 5px 0;
  font-weight: bold;
}
#window{
  background: #25253a;
  color: #f5f5f5;
  padding-left: 15px;
  padding-right: 15px;
  border-radius: 16px;
  margin-top: 5px;
  margin-bottom: 5px;
  font-weight: bold;
  font-style: normal;
}
#custom-launcher {
  color: #89b4fa;
  background: #25253a;
  border-radius: 30px 30px 30px 30px;
  margin: 0px;
  padding: 0px 25px 0px 15px;
  font-size: 28px;
}




'';

};
};

}
