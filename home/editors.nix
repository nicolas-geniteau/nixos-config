{pkgs, inputs, ...}: {
  programs.helix = {
    enable = true;
    package = inputs.helix-editor.packages.${pkgs.system}.default;

    defaultEditor = true;
    settings = {
      theme = "gruvbox";

      editor = {
        bufferline = "always";
        scrolloff = 10;
        cursorline = true;
        idle-timeout = 100; # Used for autocomplete
        auto-pairs = false;
        auto-format = false;
      };

      editor.lsp = {
        display-messages = true;
        display-inlay-hints = true;
      };

      editor.statusline = {
        left = ["mode" "spinner"];
        center = ["file-name"];
        right = ["version-control" "diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type"];
        separator = "│";
        mode.normal = "NORMAL";
        mode.insert = "INSERT";
        mode.select = "SELECT";
      };

      editor.cursor-shape.insert = "bar";
      editor.whitespace.render = "all";

      editor.indent-guides = {
        render = true;
        character = "⸽";
        skip-levels = 1;
      };

      keys.normal = {
        D = ["ensure_selections_forward" "extend_to_line_end" "delete_selection"]; # Copy vim D (delete end of line)
        C-left = ["move_prev_word_start" "move_char_left" "move_char_right"];
        C-right = ["move_next_word_start" "move_char_left" "move_char_right"];
        A-x = ["extend_line_up" "extend_line_below"];
      };
    };

    languages = {
      # the language-server option currently requires helix from the master branch at https://github.com/helix-editor/helix/
      language-server.ruff = with pkgs; {
        command = "${ruff}/bin/ruff";
        args = ["server" "--preview"];
      };

      language = [
        {
          name = "python";
          auto-format = false;
          language-servers = ["ruff" "pylsp"];
        }
      ];
    };
  };

  home.packages = with pkgs; [
    nil
    terraform-ls
    zed-editor
  ];
}
