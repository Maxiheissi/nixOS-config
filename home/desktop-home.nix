{pkgs, ... }:
{
  home.packages = with pkgs;[

      ghostty
      kitty
  
      firefox
    
      waybar
      wofi
      hyprpaper

      thunderbird
      wl-clipboard  
  ];

  #Ghostty
  xdg.configFile."ghostty/config.ghostty".text=''
    resize-overlay = never
    font-family = JetBrainsMono Nerd Font
    font-size = 13
  '';




}
