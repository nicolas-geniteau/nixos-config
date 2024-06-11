{...}: {
  imports = [
    ./browsers.nix
    ./common.nix
    ./editors.nix
    ./git.nix
    ./pass.nix
    ./shell.nix
    ./ssh.nix
    ./tools.nix
    ./wayland
    ./xdg.nix
    ./yubikey.nix
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
