import ../mkHost.nix {
  waybarHeight = 35;
  waybarFontSize = 14;
  monitors = [
    "DP-2,1920x1080@60,0x0,1"
    "HDMI-A-1,1920x1080@60,1920x0,1"
  ];
}
