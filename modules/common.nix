{ pkgs, ... }:
{
  programs.zsh.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

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

  time.timeZone = "Europe/Vienna";
  i18n.defaultLocale = "de_AT.UTF-8";
  console.keyMap = "de";


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
