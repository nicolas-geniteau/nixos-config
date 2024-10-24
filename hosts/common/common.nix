{pkgs, ...}: {
  imports = [
    ./network.nix
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://helix.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
    ];
  };
  
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.tmp.useTmpfs = true;

  time.timeZone = "Europe/Paris";

  programs.dconf.enable = true;

  environment.pathsToLink = ["/share/xdg-desktop-portal" "/share/applications"];

  users.users.nicolas = {
    isNormalUser = true;
    extraGroups = ["wheel" "input"];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN3Rdil1/ym6DN1eLtBeVc1OJ1gsVoQAHUxn9MtG/MSO nicolas"
    ];
  };

  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;
  security.pam.services.waylock = {};

  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  system.stateVersion = "23.11";
}
