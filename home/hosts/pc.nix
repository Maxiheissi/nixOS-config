{ lib, ... }:
{
  imports = [
    ../common-home.nix
    ../desktop-home.nix
    ../hyprland-home.nix
  ];

 wayland.windowManager.hyprland.settings.monitor = [
    "HDMI-A-1,1920x1080@60,0x0,1"
    "DP-1,1920x1080@60,1920x0,1"
  ];
  programs.waybar.style = lib.mkAfter ''
    * {
      font-size: 14px;
    }
    window#waybar {
      min-height: 35px;
    }
  '';    
 }
