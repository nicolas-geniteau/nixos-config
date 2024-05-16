{...}: {
  imports = [
    ./browsers.nix
    ./common.nix
    ./editors.nix
    ./git.nix
    ./shell.nix
    ./ssh.nix
    ./wayland
    ./xdg.nix
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
