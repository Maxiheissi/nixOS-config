{ config, pkgs, lib,  ... }:

let
  c = import ./colors.nix;
  hex = color: (builtins.substring 1 6 color) + "ff";
in
 {
  home.username = "maxiheissi";
  home.homeDirectory = "/home/maxiheissi";

  home.stateVersion = "23.11";


  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };




  home.sessionVariables = {
  EDITOR = "hx";
  VISUAL = "hx";
  };



  
  programs.git = {
  enable = true;
  userName = "maxiheissi";
  userEmail = "mhe@aon.at";  
  };

  programs.yazi = {
    enable = true;

    settings = {
      opener = {
        edit = [
	        {run = "hx $@"; block = true; }
        ];
      }; 
    };
    
    theme = {
      icon = {
        globs = [ ];
        dirs  = [ ];
        files = [ ];
        exts  = [ ];
        conds = [ ];
      };
      manager = {
        cwd = { fg = c.gold; };

        hovered         = { fg = c.orange; bg = c.bg1; bold = true; };
        preview_hovered = { underline = true; };

        find_keyword  = { fg = c.orange; bold = true; };
        find_position = { fg = c.fg; };

        marker_selected = { fg = c.orange; bg = c.orange; };
        marker_copied   = { fg = c.gold;   bg = c.gold; };
        marker_cut      = { fg = c.red;    bg = c.red; };

        tab_active   = { fg = c.bg;    bg = c.orange; bold = true; };
        tab_inactive = { fg = c.fgdim; bg = c.bg1; };
        tab_width    = 1;

        border_symbol = "|";
        border_style  = { fg = c.border; };
      };
      
      indicator = {
        padding = { open = "▐"; close = "▌"; };
        };
      status = {       

        sep_left = {open = ""; close = ""; };
        sep_right = {open = ""; close = ""; };

        separator_style = { fg = c.border; };
        progress_label  = { fg = c.fg; bold = true; };
        progress_normal = { fg = c.orange; bg = c.bg1; };
        progress_error  = { fg = c.red;    bg = c.bg1; };

        permissions_t = { fg = c.green; };
        permissions_r = { fg = c.gold; };
        permissions_w = { fg = c.red; };
        permissions_x = { fg = c.orange; };
        permissions_s = { fg = c.fgdark; };
      };

      mode = {
        
        normal_main = { fg = c.bg; bg = c.gold;   bold = true; };
        normal_alt  = { fg = c.gold;   bg = c.bg1; };
        select_main = { fg = c.bg; bg = c.orange; bold = true; };
        select_alt  = { fg = c.orange; bg = c.bg1; };
        unset_main  = { fg = c.bg; bg = c.red;    bold = true; };
        unset_alt   = { fg = c.red;    bg = c.bg1; };        
       };      

      input = {
        border   = { fg = c.border; };
        title    = { fg = c.gold; };
        value    = { fg = c.fg; };
        selected = { reversed = true; };
      };

      select = {
        border   = { fg = c.border; };
        active   = { fg = c.orange; };
        inactive = { fg = c.fgdark; };
      };

      tasks = {
        border  = { fg = c.border; };
        title   = { fg = c.gold; };
        hovered = { underline = true; };
      };

      which = {
        mask            = { bg = c.bg1; };
        cand            = { fg = c.green; };
        rest            = { fg = c.fgdark; };
        desc            = { fg = c.gold; };
        separator       = " -> ";
        separator_style = { fg = c.border; };
      };

      filetype = {
        rules = [
          { mime = "inode/directory";          fg = c.orange; bold = true; }
          { mime = "application/x-executable"; fg = c.green; }
          { mime = "application/x-shellscript"; fg = c.green; }
          { mime = "application/zip";          fg = c.red; }
          { mime = "application/gzip";         fg = c.red; }
          { mime = "application/zstd";         fg = c.red; }
          { mime = "image/*";                  fg = c.purple; }
          { mime = "video/*";                  fg = c.blue; }
          { mime = "audio/*";                  fg = c.blue; }
          { name = "*.nix";                    fg = c.gold; }
          { name = "*.toml";                   fg = c.gold; }
          { name = "*.json";                   fg = c.gold; }
          { name = "*.yaml";                   fg = c.gold; }
          { name = "*";                        fg = c.fgdim; }
        ];
      };
       
    };
 };  

  programs.helix = {
    enable = true;
    settings = {
      theme = "darcula";  
    };
  };  
}
