{ inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../common-home.nix
    ../desktop-home.nix
    ../hyprland-home.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
}
