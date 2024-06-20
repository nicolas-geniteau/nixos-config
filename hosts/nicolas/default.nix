{...}: {
  imports = [
    ../common/common.nix
    ./hardware-configuration.nix
    ../modules/sound.nix
    ../modules/podman.nix
    ../modules/printers.nix
  ];

  boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/3135a19d-a38b-4e2e-a834-623eced31550";

  networking.hostName = "nicolas";

  networking.wireless.iwd.enable = true;

  services.pcscd.enable = true;
}
