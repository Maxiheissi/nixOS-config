{ config, pkgs, ... }:

{
  home.username = "maxiheissi";
  home.homeDirectory = "/home/maxiheissi";

  home.stateVersion = "23.11";

  home.sessionVariables = {
  EDITOR = "hx";
  VISUAL = "hx";
  };

  
  programs.git = {
  enable = true;
  userName = "maxiheissi";
  userEmail = "mhe@aon.at";  
  };

  
  wayland.windowManager.hyprland = {
  enable = true;

   settings =
   {
    input =
    {
      kb_layout = "de";
    };

    "$mod" = "SUPER";
    "$terminal" = "ghostty";
    "$fileManager" = "yazi";
    "$menu" = "wofi --show drun";

      bind =
      [
      # Apps
      "$mod, RETURN, exec, $terminal"
      "$mod, E, exec, $terminal -e $fileManager"
      "$mod, R, exec, $menu"
# Fenster
      "$mod, Q, killactive"
      "$mod, F, fullscreen"
      "$mod, V, togglefloating"

      # Fokus bewegen (Pfeiltasten)
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Fenster verschieben
      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"

# Workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"

      # Fenster verschieben zu Workspace
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"

      # Reload
      "$mod SHIFT, R, exec, hyprctl reload"

      # Exit
      "$mod SHIFT, X, exit"


       ];
      
    };
  };
}
