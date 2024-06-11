{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    pass
  ];

  home.sessionVariables = {
    PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
  };

  programs.browserpass = {
    enable = true;
    browsers = [
      "brave"
      "firefox"
    ];
  };

  programs.chromium = {
    extensions = [
      {
        id = "naepdomgkenhinolocfifgehidddafch"; # Browserpass
      }
    ];
  };
}
