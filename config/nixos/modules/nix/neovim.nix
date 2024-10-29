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
            clang
        ];
    };
}
