# Nixos configuration
My current nixos configuration using home-manager and Nix flakes.


## Install
If you want to use my config you can type those commands on nixos:
```bash
cd  git clone https://github.com/Racjul/nixos  && cd nixos
```
Change the username in the  and the home directory in the './hosts/default/home.nix' file then type:

```bash

nixos-rebuild switch --flake .
```
## TODO & Coming soon ...
* Add my hyprland .conf into nix files
* Change GTK theme 
* Create a dunst theme
* Create a rofi theme
* Create some nix-shell templates for basic project

## Credits
* [@VimEnjoyer](https://www.youtube.com/@vimjoyer)
* [@Josean-dev](https://github.com/josean-dev)
* [@ElRastaOk](https://github.com/linuxmobile/kaku/)
