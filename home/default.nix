{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./editors.nix
    ./shell.nix
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
