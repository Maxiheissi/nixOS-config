{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

 xdg.portal = {
  enable = true;
  extraPortals = [
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-termfilechooser
  ];
  config.common."org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
  };
}
