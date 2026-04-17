# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];

  # ─── Bootloader ───────────────────────────────────────────────────────────
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ─── Netzwerk ─────────────────────────────────────────────────────────────
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # ─── Sprache & Zeitzone ───────────────────────────────────────────────────
  time.timeZone = "Europe/Vienna";
  i18n.defaultLocale = "de_AT.UTF-8";
  console.keyMap = "de";

  # ─── Hyprland ─────────────────────────────────────────────────────────────
  programs.hyprland.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

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
    shell = pkgs.bash;
  };

  # ─── Pakete ───────────────────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # Editoren
    micro
    helix

    # Dateimanager
    yazi

    # Terminal
    foot
    zellij
    kitty

    # Browser
    firefox

    # Netzwerk & Bluetooth (TUI)
    bluetui
    impala

    # Hyprland Basics
    waybar
    wofi
    hyprpaper

    # Flake-Werkzeuge
    git
    nix-prefetch-git

    # Nützliches
    wget
    curl
    ripgrep
    fd
  ];

#--------------------─ Flakes aktivieren ────────────────────────────────────────────────────
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11";
}
