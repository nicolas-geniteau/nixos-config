{pkgs, ...}: {
  programs.firefox = {
    enable = true;
  };

  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    extensions = [
      {id = "bhghoamapcdpbohphigoooaddinpkbai";} # Authenticator
    ];
  };
}
