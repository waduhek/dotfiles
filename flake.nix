{
    description = "My NixOS Config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
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
