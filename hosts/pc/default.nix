{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/common.nix
    ../../modules/desktop.nix
  ];

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nixos-pc";
  networking.networkmanager.enable = true;

  hardware.opengl.enable = true;

  users.users.maxiheissi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "bluetooth" ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "24.11";
}
