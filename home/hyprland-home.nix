{config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {


      input = {

        kb_layout = "de";
      };

      exec-once = [
        "waybar"
      ];

      
      "$mod" = "SUPER";
      "$term" = "foot";
      "$filemanager" = "yazi";
      "$launcher" = "fuzzel";

    

      bind = [
        "$mod, Return, exec, $term"
        "$mod, Q, killactive"
        "$mod, R, exec, $launcher"
        "$mod, E, exec, $term -e $filemanager"
        
        "$mod, F, fullscreen"
        # Workspaces
        "$ALT, 1, workspace, 1"
        "$ALT, 2, workspace, 2"
        "$ALT, 3, workspace, 3"
        "$ALT, 4, workspace, 4"
        "$ALT, 5, workspace, 5"
       # Fenster verschieben
        "$mod, 1, movetoworkspace, 1"
        "$mod, 2, movetoworkspace, 2"
        "$mod, 3, movetoworkspace, 3"
        "$mod, 4, movetoworkspace, 4"
        "$mod, 5, movetoworkspace, 5"

        
        "ALT, Tab, workspace, e+1"
        


        
        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"

        "$mod SHIFT, R, exec, hyprctl reload"
        "$mod SHIFT, E, exit,"

        
      ];

      decoration = {
        rounding = 0;
        blur.enabled = false;
      };

      animations.enabled = true;

      general = { 
       "col.active_border" = "rgb(${config.colorScheme.palette.base0D})";
       "col.inactive_border" = "rgb(${config.colorScheme.palette.base01})";
        
        gaps_in = 2;
        gaps_out = 4;
        border_size = 1;
      };
    };
  };
}
