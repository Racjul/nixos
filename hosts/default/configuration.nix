{ config, pkgs, inputs, ... }:

{
 imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ({ config, lib, ... }: {
      # Compatibility layer for older configurations
      system.nixos.tags = ["latest"];
      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    })
  ];
  boot = {
  loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;  # Keep last 10 generations
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";  # Verify this matches your ESP mount
    };
  };
  
  # Remove any GRUB-related configurations
  initrd.supportedFilesystems = ["btrfs" "ext4"];
};

  networking.hostName = "nixos";
  nix = {
    settings = {
      auto-optimise-store = true;
      substituters = ["https://cache.nixos.org/"];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };
  # Desktop configuration
  services = {
    xserver = {
      enable = true;
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
        defaultSession = "plasma";
      };
      desktopManager.plasma6.enable = true;
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    pulseaudio.enable = false;  # Ensure PipeWire takes precedence
  };

  # Hardware configuration
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
  };

  # User configuration
  users.users.julienr = {
    isNormalUser = true;
    description = "JulienRacette";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    neovim
    networkmanagerapplet
    blueman
    wl-clipboard
    grim
    slurp
    fzf  # Added for neovim plugin dependency
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    cm_unicode
  ];

  # Hyprland configuration
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  system.stateVersion = "23.11";
}
