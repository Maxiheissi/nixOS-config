{ config, pkgs, lib,  ... }:

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
      flavor = {
        use = "kanagawa";
      };
      manager = {
        border_style = "plain";
        border_symbol = "|";
      };
      
      indicator = {
        padding = { open = "▐"; close = "▌"; };
        };
      status = {       
        sep_left = { open = ""; close = ""; };
        sep_right = { open = ""; close = ""; };
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
