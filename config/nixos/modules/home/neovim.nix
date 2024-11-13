{ lib, pkgs, config, ... }:
let
    cfg = config.sys.editor.neovim;

    unstablePkgs = import (fetchGit {
        url = "https://github.com/nixos/nixpkgs";
        ref = "nixos-unstable";
        rev = "76612b17c0ce71689921ca12d9ffdc9c23ce40b2";
    }) { inherit (pkgs) system; };
in {
    options = {
        sys.editor.neovim = {
            enable = lib.mkEnableOption "Enable NeoVim";
            defaultEditor = lib.mkEnableOption "Set NeoVim as default editor";
        };
        sys.editor.neovim.lspConfig = lib.mkOption {
            type = lib.types.str;
            description = "LSP servers to register";
            default = ''
                local P = {}

                function P.get_lsp_servers()
                    return {}
                end

                return P
            '';
            example = ''
                local P = {}

                function P.get_lsp_servers()
                    return {
                        {
                            name = "rust_analyzer",
                            settings = {
                                ["rust-analyzer"] = {
                                    check = {
                                        allTargets = false,
                                    },
                                },
                            },
                        },
                        { name = "nixd" },
                    }
                end

                return P
            '';
        };
    };

    config = lib.mkIf cfg.enable {
        programs.neovim = {
            enable = true;
            defaultEditor = cfg.defaultEditor;
            package = unstablePkgs.neovim-unwrapped;
        };

        home.packages = with pkgs; [
            clang # Required for Treesitter.

            # LSP servers
            # For `rust-analyzer` package, install it via `rustup` by setting
            # `sys.language.rust.enable` to `true`.
            gopls
            nodePackages.bash-language-server
            lua-language-server
            yaml-language-server
            marksman
            pyright
            nodePackages.typescript-language-server
            nixd
        ];

        xdg.configFile = {
            "nvim/lua/constants/lsp_servers.lua".text = cfg.lspConfig;
            nvim = {
                source = ../../../nvim;
                recursive = true;
            };
        };
    };
}
