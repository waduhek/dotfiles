{
    description = "My NixOS Config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-24.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    
    outputs = { nixpkgs, home-manager, ... }:
    let
        system = "x86_64-linux";

        pkgs = import nixpkgs {
            inherit system;
        };

        lib = nixpkgs.lib;
    in {
        nixosConfigurations = {
            testbox = lib.nixosSystem {
                inherit system;

                modules = [
                    ./config/nixos/hosts/testbox/configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.ryan = import ./config/nixos/hosts/testbox/home.nix;
                        };
                    }
                ];
            };

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
        };
    };
}
