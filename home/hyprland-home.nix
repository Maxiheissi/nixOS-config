{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {


      input = {

        kb_layout = "de";
      };

      
      "$mod" = "SUPER";
      "$term" = "ghostty";
      "$filemanager" = "yazi";
      "$launcher" = "wofi --show drun";

    

      bind = [
        "$mod, Return, exec, $term"
        "$mod, Q, killactive"
        "$mod, R, exec, $launcher"
        "$mod, E, exec, $term -e $filemanager"
        
        "$mod, F, fullscreen"
        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        # Fenster verschieben
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"

        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"


        
      ];

      decoration = {
        rounding = 10;
        blur.enabled = true;
      };

      animations.enabled = true;

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };
    };
  };
}
