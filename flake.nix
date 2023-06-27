{
  description = "Matthew's NixOS config for every device that can run NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      laptop = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./modules/sway.nix
          ./hardware-configuration.nix
          ./modules/i3.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.matus = {
              imports = [ ./home-manager/home.nix ];
            };
          }
        ];
      };
    };
    desktop = lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./modules/nvidia.nix
        ./modules/steam.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.matus = {
            imports = [ ./home-manager/home.nix ];
          };
        }
      ];
    };
    desktop-nonvidia = lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        ./nixos/hardware-configuration.nix
        ./modules/steam.nix
        ./modules/sway.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.matus = {
            imports = [ ./home-manager/home.nix ];
          };
        }
      ];
    };
  };
}
