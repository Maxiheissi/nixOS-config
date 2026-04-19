{ config, pkgs, ... }:
{
  home.packages = with pkgs;[

      ghostty
      kitty
      foot
  
      firefox
    
      wofi
      hyprpaper

      thunderbird
      wl-clipboard  
  ];

  #Ghostty
 # xdg.configFile."ghostty/config".text=''
  #  resize-overlay = never
   # confirm-close-surface = false
   # font-family = JetBrainsMono Nerd Font
   #font-size = 13
    #background = ${config.colorScheme.palette.base00}
  #'';


  
  xdg.configFile."foot/foot.ini".text = ''
    [main]
    font=JetBrains Mono:size=13
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

            "hyprland/workspaces" = {
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
