{ waybarHeight ? 30
, waybarFontSize ? 14
, monitors ? []
, extraModules ? []
}:
{
  imports = [
    ./common-home.nix
    ./desktop-home.nix
    ./hyprland-home.nix
    (import ./waybar-home.nix { height = waybarHeight; fontSize = waybarFontSize; })
  ] ++ extraModules;

  wayland.windowManager.hyprland.settings.monitor = monitors;
}
