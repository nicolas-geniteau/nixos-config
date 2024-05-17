{pkgs, ...}: {
  programs.gpg = {
    enable = true;

    scdaemonSettings = {
      disable-ccid = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-bemenu;
  };

  home.packages = with pkgs; [
    pinentry-curses
  ];
}
