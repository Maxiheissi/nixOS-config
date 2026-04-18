{ inputs, ... }:
{
  imports = [

    "${inputs.nix-colors}/modules/home-manager.nix"
    ../common-home.nix
    ../desktop-home.nix
    ../hyprland-home.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
}
