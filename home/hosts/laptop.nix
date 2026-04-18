{ inputs, ... }:
{
  imports = [
    ../common-home.nix
    ../desktop-home.nix
    ../hyprland-home.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
}
