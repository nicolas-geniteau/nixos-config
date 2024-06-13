{pkgs, ...}: {
  home = {
    username = "nicolas";
    homeDirectory = "/home/nicolas";
  };

  nix.gc = {
    automatic = true;
    frequency = "weekly";
  };
}
