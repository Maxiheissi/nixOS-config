
{
  description = "my NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    inputs.home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, ... }: {
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/pc/default.nix
        ./hosts/pc/hardware.nix


          home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.maxiheissi = import ./home/desktop-home.nix;
        }
      ];
    };
  };
}
