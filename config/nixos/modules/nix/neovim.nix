{ lib, pkgs, config, ... }:
let
    cfg = config.sys.editor.neovim;
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
