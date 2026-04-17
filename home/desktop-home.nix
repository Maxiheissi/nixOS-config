{ config, pkgs, ... }:

{
  home.username = "maxiheissi";
  home.homeDirectory = "/home/maxiheissi";

  home.stateVersion = "23.11";

  programs.git.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      input = {
        kb_layout = "de";
      };
    };
  };
}
