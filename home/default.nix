{ config, pkgs, ... }:

{
  imports = [
    ./browsers.nix
    ./common.nix
    ./editors.nix
    ./shell.nix
    ./wayland
    ./xdg.nix
  ];

  programs.git = {
    enable = true;
    userEmail = "nicolas.geniteau@gmail.com";
    userName = "Nicolas Geniteau";
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
