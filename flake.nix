
{
  description = "my NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
  	  url = "github:nix-community/home-manager";
	  inputs.nixpkgs.follows = "nixpkgs";
	  nix-colors.url = "github:misterio77/nix-colors";
    };    
  };

  outputs = { nixpkgs, home-manager, nix-colors, ... }: {
    nixosConfigurations.laptop= nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/laptop/default.nix
        ./hosts/laptop/hardware.nix

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
