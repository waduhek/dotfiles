{
    description = "My NixOS Config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    
    outputs = { nixpkgs, home-manager, ... }:
    let
        system = "x86_64-linux";

        lib = nixpkgs.lib;
    in {
        nixosConfigurations = {
            mercury = lib.nixosSystem {
                inherit system;
                modules = [
                    ./config/nixos/hosts/mercury/configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users = {
                                ryan = import ./config/nixos/hosts/mercury/users/ryan.nix;
                                gaming = import ./config/nixos/hosts/mercury/users/gaming.nix;
                            };
                        };
                    }
                ];
            };

            venus = lib.nixosSystem {
                inherit system;
                modules = [
                    ./config/nixos/hosts/venus/configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users = {
                                ryan = import ./config/nixos/hosts/venus/users/ryan.nix;
                            };
                        };
                    }
                ];
            };
        };
    };
}
