# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];


  
  # ─── Bootloader ───────────────────────────────────────────────────────────
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #-----zsh-------------------
  programs.zsh.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      };
  };



 # ─── Fonts ────────────────────────────────────────────────────────────────
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      jetbrains-mono
      iosevka
       nerd-fonts.iosevka
    ];
    fontconfig.defaultFonts = {
      monospace = [ "Iosevka Nerd Font" ];
    };
  }; 
  # ─── Netzwerk ─────────────────────────────────────────────────────────────
  networking.hostName = "nixos";
  networking.networkmanager.enable = false;
  networking.wireless.iwd.enable = true;
  # ─── Sprache & Zeitzone ───────────────────────────────────────────────────
  time.timeZone = "Europe/Vienna";
  i18n.defaultLocale = "de_AT.UTF-8";
  console.keyMap = "de";

  # ─── Hyprland ─────────────────────────────────────────────────────────────
  programs.hyprland.enable = true;


  # ─── Bluetooth ────────────────────────────────────────────────────────────
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # ─── Audio (Pipewire) ─────────────────────────────────────────────────────
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # ─── Benutzer ─────────────────────────────────────────────────────────────
  # WICHTIG: DEINNAME durch deinen Benutzernamen ersetzen!
  users.users.maxiheissi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "bluetooth" ];
    shell = pkgs.zsh;
  };

  # ─── Pakete ───────────────────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # Editoren
    micro
    helix

    # Dateimanager
    yazi

    # Netzwerk & Bluetooth (TUI)
    bluetui
    impala

    # Flake-Werkzeuge
    git
    nix-prefetch-git

    # Nützliches
    wget
    curl
    ripgrep
    fd
    btop
    htop
    gcc
  ];

#--------------------─ Flakes aktivieren ────────────────────────────────────────────────────
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11";
}
