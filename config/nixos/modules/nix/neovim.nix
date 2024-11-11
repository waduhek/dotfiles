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
            enable = lib.mkEnableOption "Setup NeoVim";
            defaultEditor = lib.mkEnableOption "Set NeoVim as default editor";
        };
    };

    config = lib.mkIf cfg.enable {
        programs.neovim = {
            enable = true;
            defaultEditor = cfg.defaultEditor;
            package = unstablePkgs.neovim-unwrapped;
        };

        environment.systemPackages = with pkgs; [
            clang # Required for Treesitter.

            # LSP servers
            rust-analyzer
            gopls
            nodePackages.bash-language-server
            lua-language-server
            yaml-language-server
            marksman
            pyright
            nodePackages.typescript-language-server
            nixd
        ];
    };
}
