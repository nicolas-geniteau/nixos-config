{pkgs, ...}: {
  programs.poetry = {
    enable = true;
    settings = {
      virtualenvs.create = true;
      virtualenvs.in-project = true;
    };
  };

  home.packages = with pkgs; [
    jetbrains.pycharm-professional
    poetry
    python3
    python311Packages.python-lsp-server
    ruff
    rye
    uv
  ];
}
