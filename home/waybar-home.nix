{ height ? 25, fontSize ? 12 }:
{ pkgs, ... }:
let
  c = import ./colors.nix;
  hex = color: (builtins.substring 1 6 color) + "ff";
in
{
  programs.waybar = {
    enable = true;
    settings = [{
      layer    = "top";
      position = "top";
      inherit height;
      spacing  = 0;

      modules-left   = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right  = [ "battery" "wireplumber" "bluetooth" "network" "tray" ];

      "hyprland/workspaces" = {
        format   = "[{id}]";
        on-click = "activate";
      };

      clock.format = "{:%H:%M  %d.%m.%Y}";

      battery = {
        format          = "BAT:{capacity}%";
        format-charging = "CHR:{capacity}%";
        format-full     = "BAT:full";
        format-critical = "LOW:{capacity}%";
        critical        = 20;
        on-click        = "foot -e btm --battery";
      };

      wireplumber = {
        format   = "VOL:{volume}%";
        on-click = "foot -e wiremix";
      };

      bluetooth = {
        format           = "BT: {status}";
        format-connected = "BT: {device_alias}";
        on-click         = "foot -e bluetui";
      };

      network = {
        format-wifi         = "WLAN: {essid}";
        format-ethernet     = "ETH: connected";
        format-disconnected = "NET: off";
        on-click            = "foot -e impala";
      };
    }];

    style = ''
      * {
        font-family: "Iosevka Nerd Font";
        font-size: ${toString fontSize}px;
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
      #clock { color: ${c.gold}; padding: 0 12px; }
      #battery { color: ${c.gold}; padding: 0 10px; border-left: 1px solid ${c.border}; }
      #battery.charging { color: ${c.green}; }
      #battery.critical { color: ${c.red}; }
      #wireplumber { color: ${c.gold}; padding: 0 10px; border-left: 1px solid ${c.border}; }
      #wireplumber.muted { color: ${c.red}; }
      #bluetooth { color: ${c.green}; padding: 0 10px; border-left: 1px solid ${c.border}; }
      #network { color: ${c.green}; padding: 0 10px; border-left: 1px solid ${c.border}; }
      #tray { padding: 0 8px; border-left: 1px solid ${c.border}; }
    '';
  };
}
