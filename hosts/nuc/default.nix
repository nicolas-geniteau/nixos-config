{...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/common.nix

    ../modules/avahi.nix
    ../modules/bluetooth.nix
    ../modules/podman.nix
    ../modules/printers.nix
    ../modules/scanners.nix
    ../modules/sound.nix
    ../modules/yubikey.nix
  ];

  networking.hostName = "nuc";

  networking.wireless.iwd.enable = false;

  users.users.nicolas.extraGroups = ["scanner" "lp"];
}
