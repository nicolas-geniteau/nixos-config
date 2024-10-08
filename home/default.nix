{inputs, ...}: {
  imports =
    [
      ./browsers.nix
      ./common.nix
      ./desktop.nix
      ./editors.nix
      ./gcloud.nix
      ./git.nix
      ./packages.nix
      ./pass.nix
      ./python.nix
      ./shell.nix
      ./ssh.nix
      ./tools.nix
      ./wayland
      ./xdg.nix
      ./yubikey.nix
    ]
    ++ inputs.nixos-config-work.outputs.home_configs;

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
