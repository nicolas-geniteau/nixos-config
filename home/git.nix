{pkgs, ...}: {
  programs.git = {
    enable = true;

    userEmail = "nicolas.geniteau@gmail.com";
    userName = "Nicolas Geniteau";

    aliases = {
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --";
      dft = "difftool";
    };

    extraConfig = {
      push.autoSetupRemote = true;
      merge.conflictstyle = "diff3";
      commit.verbose = true;
      pull.rebase = true;
      init.defaultBranch = "main";

      diff.tool = "difftastic";
      difftool = {
        prompt = false;
        difftastic.cmd = "difft \"$LOCAL\" \"$REMOTE\"";
      };
    };

    delta = {
      enable = true;

      options = {
        navigate = true;
        side-by-side = true;
      };
    };

    ignores = [
      ".venv"
      "venv"
      ".idea"
      "__pycache__"
      ".coverage"
      ".terraform"
      "*.egg-info"
      "pip-wheel-metadata"
      "node_modules"
      ".serverless"
      "tsconfig.tsbuildinfo"
      "coverage"
      "yarn-error.log"
      ".vscode"
    ];
  };

  home.packages = with pkgs; [
    difftastic
  ];
}
