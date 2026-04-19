{ config, pkgs, ... }:
{
  home.packages = with pkgs;[

      ghostty
      kitty
      foot
  
      firefox
    
      wofi
      fuzzel
      hyprpaper

      thunderbird
      wl-clipboard  
  ];

  #Ghostty
  xdg.configFile."ghostty/config".text=''
    resize-overlay = never
    confirm-close-surface = false
    font-family = Iosevka Nerd Font
    font-size = 13
  #'';


  
  xdg.configFile."foot/foot.ini".text = ''
    [main]
      font=Iosevka Nerd Font:size=12
      pad=8x6
     # font-bold=JetBrains Mono:size=13:weight=bold
     # font-italic=JetBrains Mono:size=13:slant=italic
     # font-bold-italic=JetBrains Mono:size=13:weight=bold:slant=italic
  '';  

  programs.waybar = {
        enable = true;
        settings = {
          mainBar = {
            layer = "top";
            position = "top";
            height = 30;

            modules-left = ["hyprland/workspaces"];
            modules-right = ["battery" "clock"];

            "hyprland/workspaces" ={
              
               format   = "[{id}]";
               active-only = false;
               on-click = "activate";  
            };

            "clock" = {
              format = "{:%H:%M}";
            };

            "battery" = {
              format = "{capacity}% {icon}";
              format-icons = [ "" "" "" "" "" ];
            };
          };        
        };
  };

}
