{pkgs, ... }:
{
  home.packages = with pkgs;[

      ghostty
      kitty
  
      firefox
    
      wofi
      hyprpaper

      thunderbird
      wl-clipboard  
  ];

  #Ghostty
  xdg.configFile."ghostty/config".text=''
    resize-overlay = never
    confirm-close-surface = false
    font-family = JetBrainsMono Nerd Font
    font-size = 13
  '';

  programs.waybar.enable = true;


}
