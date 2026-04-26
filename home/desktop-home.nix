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
  
programs.waybar = {
  enable = true;

  settings = [{
    layer    = "top";
    position = "top";
    height   = 25;
    spacing  = 0;

    modules-left   = [ "hyprland/workspaces" ];
    modules-center = [ "clock" ];
    modules-right  = [ "battery" "wireplumber" "bluetooth" "network" "tray" ];

    "hyprland/workspaces" = {
      format   = "[{id}]";
      on-click = "activate";
    };

    clock = {
      format = "{:%H:%M  %d.%m.%Y}";
    };

    battery = {
      format = "BAT:{capacity}%";
      format-charging = "CHR:{capacity}%";
      format-full = "BAT:full";
      format-critical = "LOW:{capacity}%";
      critical = 20;
      on-click = "foot -e btm --battery";
    };


    "wireplumber" = {
      format = "VOL:{volume}%";
      on-click = "foot -e wiremix";
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
      color: ${c.fg};
      border-bottom: 1px solid ${c.border};
    }

    #workspaces button {
      padding: 0 8px;
      color: ${c.fgdark};
      background: transparent;
      border-radius: 0;
    }

    #workspaces button.active {
      color: ${c.orange};
      background: ${c.bg1};
    }

    #workspaces button:hover {
      background: ${c.bg1};
      color: ${c.fg};
    }

    #clock {
      color: ${c.gold}; 
      padding: 0 12px;
    }
    
    #battery {
      color: ${c.gold};
      padding: 0 10px;
      border-left: 1px solid ${c.border};
    }

    #battery.charging {
      color: ${c.green};
    }

    #battery.critical {
      color: ${c.red};
    }

    
    #wireplumber {
      color: ${c.gold};
      padding: 0 10px;
      border-left: 1px solid ${c.border};
    }

    #wireplumber.muted {
      color: ${c.red};
    }    
    #bluetooth {
      color: ${c.green};
      padding: 0 10px;
      border-left: 1px solid ${c.border};
    }

    #network {
      color: ${c.green};
      padding: 0 10px;
      border-left: 1px solid ${c.border};
    }

    #tray {
      padding: 0 8px;
      border-left: 1px solid ${c.border};
    }
  '';
};


home.file.".config/xdg-desktop-portal-termfilechooser/config".text = ''
  [filechooser]
  cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
  default_dir=$HOME
  env=TERMCMD=foot
  env=PATH="$PATH:/run/current-system/sw/bin"
  open_mode = suggested
  save_mode = last
'';

}
