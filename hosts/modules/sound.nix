{pkgs, ...}: {
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  systemd.user.services.pipewire-pulse.path = [pkgs.pulseaudio];
}
