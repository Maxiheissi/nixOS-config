{ config, pkgs, ... }:

{
  home.username = "maxiheissi";
  home.homeDirectory = "/home/maxiheissi";

  home.stateVersion = "23.11";


  programs.zsh = {
    enable = true;
    enableAutosuggestion = true;
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
  };  

  programs.helix = {
    enable = true;
    settings = {
      theme = "darcula";  
    };
  };


  
}
