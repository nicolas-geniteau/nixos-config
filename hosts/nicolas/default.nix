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

  boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/3135a19d-a38b-4e2e-a834-623eced31550";

  networking.hostName = "nicolas";

  networking.wireless.iwd.enable = true;

  users.users.nicolas.extraGroups = ["scanner" "lp"];
}
