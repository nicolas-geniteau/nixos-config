{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Paris";

  users.users.nicolas = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN3Rdil1/ym6DN1eLtBeVc1OJ1gsVoQAHUxn9MtG/MSO nicolas"
    ];
  };

  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;

  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
  ];

  services.openssh = {
    enable = true;
  };

  system.stateVersion = "23.11";
}
