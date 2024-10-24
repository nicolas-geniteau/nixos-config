{pkgs-stable, ...}: {
  services.pcscd = {
    enable = true;
    plugins = [pkgs-stable.ccid];
  };
}
