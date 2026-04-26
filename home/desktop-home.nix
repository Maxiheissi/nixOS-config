{pkgs, ... }:

let
  c = import ./colors.nix;
  hex = color: (builtins.substring 1 6 color) + "ff";
in
{
  home.packages = with pkgs;[

      ghostty
      kitty
      foot
  
      firefox
    
      wofi
      fuzzel
      hyprpaper
      sublime4
      jetbrains.idea
      vscode

      thunderbird
      wl-clipboard
      wiremix
      python3  
  ];



gtk = {
  enable = true;
  gtk4.theme = null;  # neue Standardeinstellung
  theme = {
    name = "Gruvbox-Dark";
    package = pkgs.gruvbox-dark-gtk;
  };

  font = {
    name = "JetBrains Mono";
    size = 11;
  };
  cursorTheme = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };
};

  #Ghostty
  xdg.configFile."ghostty/config".text=''
    resize-overlay = never
    confirm-close-surface = false
    font-family = Iosevka Nerd Font
    font-size = 13
  '';


programs.foot = {
    enable = true;
    settings = {
      main = {
        pad = "8x6";
        font = "Iosevka Nerd Font:size=12";
        font-bold = "Iosevka Nerd Font:size=13:weight=bold";
        font-italic = "Iosevka Nerd Font:size=13:slant=italic";
        font-bold-italic = "Iosevka Nerd Font:size=13:weight=bold:slant=italic";
      };
      tweak = {
        font-monospace-warn = "no";
      };
      colors-dark = {
        background = builtins.substring 1 6 c.bg;
        foreground = builtins.substring 1 6 c.fg;

        regular0 = "282828";
        regular1 = "cc241d";
        regular2 = "98971a";
        regular3 = "d79921";
        regular4 = "458588";
        regular5 = "b16286";
        regular6 = "689d6a";
        regular7 = "a89984";

        bright0 = "928374";
        bright1 = "fb4934";
        bright2 = "b8bb26";
        bright3 = "fabd2f";
        bright4 = "83a598";
        bright5 = "d3869b";
        bright6 = "8ec07c";
        bright7 = "ebdbb2";
        selection-background = builtins.substring 1 6 c.bg1;
        selection-foreground = builtins.substring 1 6 c.orange;

    };
      cursor = {
        style = "block";
        blink = "no";
      };
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font          = "Iosevka Nerd Font:size=12";
        prompt        = ''">> "'';
        icons-enabled = false;
        lines         = 10;
        width         = 40;
       
        
      };
      
      border = {
        width = 1;
        radius = 0;
        selection-radius = 0;
      };
      colors = {
        background       = hex c.bg;
        text             = hex c.fg;
        match            = hex c.orange;
        selection        = hex c.bg1;
        selection-text   = hex c.fg;
        selection-match  = hex c.orange;
        border           = hex c.border;
      };
    };
  };
  

}
