{ pkgs, ... }:

{
  home = {
    username = "nicolas";
    homeDirectory = "/home/nicolas";
  };

  home.packages = [
    pkgs.bottom
  ];

  nix.gc = {
    automatic = true;
    frequency = "weekly";
  };
}
