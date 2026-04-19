{ config, pkgs, ... }:

let
  c = import ./colors.nix;
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

  settings = [{
    layer    = "top";
    position = "top";
    height   = 24;
    spacing  = 0;

    modules-left   = [ "hyprland/workspaces" ];
    modules-center = [ "clock" ];
    modules-right  = [ "bluetooth" "network" "tray" ];

    "hyprland/workspaces" = {
      format   = "[{id}]";
      on-click = "activate";
    };

    clock = {
      format = "{:%H:%M  %d.%m.%Y}";
    };

    bluetooth = {
      format           = "BT: {status}";
      format-connected = "BT: {device_alias}";
      on-click         = "foot -e bluetui";
    };

    network = {
      format-wifi       = "WLAN: {essid}";
      format-ethernet   = "ETH: connected";
      format-disconnected = "NET: off";
      on-click          = "foot -e impala";
    };
  }];

  style = ''
    * {
      font-family: "Iosevka Nerd Font";
      font-size: 12px;
      border: none;
      border-radius: 0;
      min-height: 0;
    }

    window#waybar {
      background: ${c.bg};
      color: #ebdbb2;
      border-bottom: 1px solid #3c3836;
    }

    #workspaces button {
      padding: 0 8px;
      color: #504945;
      background: transparent;
      border-radius: 0;
    }

    #workspaces button.active {
      color: #fe8019;
      background: #1d2021;
    }

    #workspaces button:hover {
      background: #1d2021;
      color: #ebdbb2;
    }

    #clock {
      color: #e5c07b;
      padding: 0 12px;
    }

    #bluetooth {
      color: #8ec07c;
      padding: 0 10px;
      border-left: 1px solid #3c3836;
    }

    #network {
      color: #8ec07c;
      padding: 0 10px;
      border-left: 1px solid #3c3836;
    }

    #tray {
      padding: 0 8px;
      border-left: 1px solid #3c3836;
    }
  '';
};}
