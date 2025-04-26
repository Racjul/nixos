# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs,inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

# Bootloader
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "nixos";

services.xserver.enable = true ;
services.desktopManager.plasma6.enable = true; 
services.displayManager.sddm.wayland.enable = true;

# Enable networking
networking.networkmanager = {
  enable = true;
  settings = {
    main = {
      plugins = "keyfile";
    };
  };

}; 

# Set your time zone.
time.timeZone = "America/Toronto";
fonts.fonts = [ pkgs.cm_unicode ];
# Select internationalisation properties.
i18n.defaultLocale = "en_CA.UTF-8";

# Enable CUPS to print documents.
services.printing.enable = true;

hardware.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  jack.enable = true;

};

users.users.julienr = {
  isNormalUser = true;
  description = "JulienRacette";
  extraGroups = [ "networkmanager" "wheel" ];
  packages = with pkgs; [
    obsidian
    vlc
    obs-studio
    thunderbird
    spotify
    webcord-vencord
    zathura
    vscode-fhs
  ];
};

home-manager = {
  extraSpecialArgs = {inherit inputs;};
  users ={
    "julienr" = import ./home.nix;
  };

};

# Allow unfree packages
nixpkgs.config.allowUnfree = true;
# Allow Flakes and nix-command
nix.settings.experimental-features = ["nix-command" "flakes"];
programs.steam = {
enable = true;
remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};
# Installed Packages
environment.systemPackages = with pkgs; [
  home-manager
  nh

# Notification
dunst
libnotify

# basic terminal tools
neovim

# For bluetooth and wifi:
networkmanagerapplet
blueman

# Packages Manager / Installer
kdePackages.qt6ct
cargo
python3
playerctl
pavucontrol

#Screen Capture
grim
slurp
wl-clipboard

#app
rstudio
octave


            ];


# Before changing this value read the documentation for this option
system.stateVersion = "23.11"; # Did you read the comment?

# Enable Hyprland 
programs.hyprland = {
  enable = true;
  xwayland.enable = true;
};

xdg.portal.enable = true;
xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

environment.sessionVariables.NIX_OZONE_WL = "1";
}
