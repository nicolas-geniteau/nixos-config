{ pkgs, ... }:

{
  imports = [
    ./river.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    nerdfonts
    waylock
    wlr-randr
  ];
}
