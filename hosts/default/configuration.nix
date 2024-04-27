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
networking.networkmanager.enable = true;

# Set your time zone.
time.timeZone = "America/Toronto";

# Select internationalisation properties.
i18n.defaultLocale = "en_CA.UTF-8";

# Enable CUPS to print documents.
services.printing.enable = true;

# Enable sound with pipewire.
sound.enable = true;
hardware.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

};


users.users.julienracette = {
    isNormalUser = true;
    description = "JulienRacette";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
        firefox-wayland
        thunderbird
        spotify
        discord
    ];
};
home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users ={
        "julienracette" = import ./home.nix;

    };

};

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

# Allow Flakes and nix-command
nix.settings.experimental-features = ["nix-command" "flakes"];

# Installed Packages
environment.systemPackages = with pkgs; [
    home-manager
    nh

    # wayland / hyprland dependencies
    hyprland
    hyprpaper
    waybar
    rofi-wayland
    wl-clipboard

    # Notification
    dunst
    libnotify
    
    # basic terminal tools
    wget
    unzip
    git
    kitty
    neovim

    # For bluetooth and wifi:
    networkmanagerapplet
    blueman

    # Packages Manager / Installer
    kdePackages.qt6ct
    qt6.full
    gnumake
    nodejs_21
    cargo
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