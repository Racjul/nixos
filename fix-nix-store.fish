#!/usr/bin/fish

# Fix kernel module path error script for Fish shell
# Save as fix-nix-store.fish and run with sudo

function main
    echo "Starting Nix store repair process..."
    
    # Clean flake lock
    if test -e flake.lock
        echo "Removing old flake.lock"
        rm -f flake.lock
    end

    # Update flake inputs
    echo "Updating flake inputs"
    nix flake update
    nix flake lock --recreate-lock-file

    # Clean store
    echo "Collecting garbage..."
    nix-collect-garbage --delete-older-than 7d
    nix-store --verify --check-contents --repair
    nix-store --optimise

    # Rebuild system
    echo "Rebuilding system..."
    nixos-rebuild switch --flake . --upgrade --option keep-going true --repair

    # Optional nuclear option
    if contains -- --nuclear $argv
        echo "Running nuclear option..."
        nix-channel --remove nixos
        rm -rf /nix/var/nix/daemon-socket/socket
        systemctl restart nix-daemon
        nixos-rebuild switch --flake . --upgrade
    end

    echo "Process completed! Check if error persists."
end

# Run with sudo check
if test (id -u) -ne 0
    echo "This script must be run as root! Restarting with sudo..."
    exec sudo fish $argv
else
    main $argv
end
