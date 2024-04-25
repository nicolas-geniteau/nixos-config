{ pkgs, ... }:
{
  home.shellAliases = {
    vim = "hx";
  };

  programs.bash = {
    enable = true;

    historyControl = ["ignoredups" "ignorespace"];
    historyFile = "$XDG_STATE_HOME/bash/history";  # directory must exists, see below
    historyFileSize = -1;

    shellOptions = ["extglob"];

    bashrcExtra = ''
    bind '"\t":menu-complete'
    '';
  };

  home.file = {
    ".local/state/bash/.keep" = {
      text = "";
    };
  };

  programs.readline = {
    enable = true;
    variables = {
      show-all-if-ambiguous = true;
      colored-completion-prefix = true;
      colored-stats = true;
      menu-complete-display-prefix = true;
      bind-tty-special-chars = false;
    };

    bindings = {
      "\\C-w" = "backward-kill-word";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
      docker_context.disabled = true;
      gcloud.disabled = true;
      git_status.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };
}
