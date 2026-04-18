{ config, pkgs, ... }:

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
      flavors = {
    kanagawa = pkgs.fetchFromGitHub {
      owner = "dangooddd";
      repo = "kanagawa.yazi";
      rev = "main";
      sha256 = lib.fakeSha256;
    };
  };      manager = {
        border_style = "plain";
      };
      
      indicator = {
        padding = { open = "▐"; close = "▌"; };
        };
      status = {
        padding = { open = "▐"; close = "▌"; };
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
