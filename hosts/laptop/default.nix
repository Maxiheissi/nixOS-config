{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/common.nix
    ../../modules/desktop.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = false;
  networking.wireless.iwd.enable = true;


  users.users.maxiheissi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "bluetooth" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "24.11";
}
