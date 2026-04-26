{ waybarHeight ? 30
, waybarFontSize ? 14
, fuzzelFontSize ? 12
, monitors ? []
, extraModules ? []
}:
{
  imports = [
    ./common-home.nix
    ./desktop-home.nix
    ./hyprland.nix
    (import ./waybar.nix { height = waybarHeight; fontSize = waybarFontSize; })
    (import ./fuzzel.nix { fontSize = fuzzelFontSize; })
  ] ++ extraModules;

  wayland.windowManager.hyprland.settings.monitor = monitors;
}
