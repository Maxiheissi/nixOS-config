{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/common.nix
    ../../modules/desktop.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-lap";
  networking.networkmanager.enable = false;
  networking.wireless.iwd.enable = true;


  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = "bluetooth";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      PLATFORM_PROFILE_ON_BAT = "low-power";
      PLATFORM_PROFILE_ON_AC = "performance";
      NMI_WATCHDOG = 0;      
      };
  };

  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  users.users.maxiheissi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "bluetooth" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "24.11";
}
