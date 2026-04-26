# home/fuzzel.nix
{ fontSize ? 12 }:
{ ... }:
let
  c = import ./colors.nix;
  hex = color: (builtins.substring 1 6 color) + "ff";
in
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font          = "Iosevka Nerd Font:size=${toString fontSize}";
        prompt        = ''">> "'';
        icons-enabled = false;
        lines         = 10;
        width         = 40;
      };
      border = {
        width            = 1;
        radius           = 0;
        selection-radius = 0;
      };
      colors = {
        background     = hex c.bg;
        text           = hex c.fg;
        match          = hex c.orange;
        selection      = hex c.bg1;
        selection-text = hex c.fg;
        selection-match = hex c.orange;
        border         = hex c.border;
      };
    };
  };
}
