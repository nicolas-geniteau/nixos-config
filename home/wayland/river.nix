let
  pow = n : i :
    if i == 1 then n
    else if i == 0 then 1
    else n * pow n (i - 1);

  tags_info = builtins.genList (x: {tag = x + 1; tag_bit = pow 2  x;}) 9;

  generateTagsAttributes = (
    nameFn: valueFn:
    builtins.listToAttrs (
      map (tag_info: { name = nameFn tag_info; value = valueFn tag_info;}) tags_info
    ));

  tags_mapping = generateTagsAttributes
    (tag_info: "Super ${toString tag_info.tag}")
    (tag_info: "set-focused-tags ${toString tag_info.tag_bit}")
    // generateTagsAttributes
    (tag_info: "Super+Shift ${toString tag_info.tag}")
    (tag_info: "set-view-tags ${toString tag_info.tag_bit}")
    // generateTagsAttributes
    (tag_info: "Super+Control ${toString tag_info.tag}")
    (tag_info: "toggle-focused-tags ${toString tag_info.tag_bit}")
    // generateTagsAttributes
    (tag_info: "Super+Shift+Control ${toString tag_info.tag}")
    (tag_info: "toggle-view-tags ${toString tag_info.tag_bit}")
    ;

  # For normal and locked modes
  common_mapping = {
    "None XF86AudioRaiseVolume" = "spawn 'pamixer -i 5'";
    "None XF86AudioLowerVolume" = "spawn 'pamixer -d 5'";
    "None XF86AudioMute" = "spawn 'pamixer --toggle-mute'";

    "None XF86AudioMedia" = "spawn 'playerctl play-pause'";
    "None XF86AudioPlay" = "spawn 'playerctl play-pause'";
    "None XF86AudioPrev" = "spawn 'playerctl previous'";
    "None XF86AudioNext" = "spawn 'playerctl next'";

    "None  XF86MonBrightnessUp" = "spawn 'brightnessctl set +5%'";
    "None  XF86MonBrightnessDown" = "spawn 'brightnessctl set 5%-'";
  };

in
{
  wayland.windowManager.river = {
    enable = true;

    settings = {
      background-color = "0x282828";
      border-color-focused = "0x93a1a1";
      border-color-unfocused = "0x586e75";

      set-repeat = "50 300";

      focus-follows-cursor = "always";

      map = {
        normal = {
          "Super P" = "spawn fuzzel";
          "Super+Shift Return" = "spawn alacritty";
          "Super Z" = "spawn waylock";

          "Super Tab" = "focus-previous-tags";
          "Super+Shift C" = "close";
          "Super+Shift E" = "exit";

          "Super J" = "focus-view next";
          "Super K" = "focus-view previous";
          "Super+Shift J" = "swap next";
          "Super+Shift K" = "swap previous";
          "Super Return" = "zoom";
          "Super H" = "send-layout-cmd rivertile 'main-ratio -0.05'";
          "Super L" = "send-layout-cmd rivertile 'main-ratio +0.05'";
          "Super+Shift H" = "send-layout-cmd rivertile 'main-count +1'";
          "Super+Shift L" = "send-layout-cmd rivertile 'main-count -1'";

          "Super Period" = "focus-output next";
          "Super Comma" = "focus-output previous";
          "Super+Shift Period" = "send-to-output next";
          "Super+Shift Comma" = "send-to-output previous";

          "Super 0" = "set-focused-tags ${toString ((pow 2 32) - 1)}";
          "Super+Shift 0" = "set-view-tags ${toString ((pow 2 32) - 1)}";

          "Super Space" = "toggle-float";
          "Super F" = "toggle-fullscreen";
        } // tags_mapping // common_mapping;

        locked = {} // common_mapping;
      };

      map-pointer = {
        normal = {
          "Super BTN_LEFT" = "move-view";
          "Super BTN_RIGHT" = "resize-view";
          "Super BTN_MIDDLE" = "toggle-float";
        };
      };

      spawn = ["waybar"];

      default-layout = "rivertile";
    };

    extraConfig =
    ''
    rivertile -view-padding 0 -outer-padding 0 &
    '';
  };
}
