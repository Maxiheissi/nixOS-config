
{
  description = "my NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
  	  url = "github:nix-community/home-manager";
	  inputs.nixpkgs.follows = "nixpkgs";
    };
       
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.laptop= nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/laptop/default.nix
        
        {
          nixpkgs.config.allowUnfree = true;
          nixpkgs.config.permittedInsecurePackages = [
            "openssl-1.1.1w"
          ];
        }

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

           home-manager.users.maxiheissi = import ./home/hosts/laptop.nix;
        }
      ];
    };
  };
}
