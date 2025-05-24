{ config, pkgs, ... }:
let
    nvimLspConstants = ''
        local P = {}

        function P.get_lsp_servers()
            return {
                { name = "gopls" },
                {
                    name = "lua_ls",
                    settings = {
                        Lua = {
                            runtime = {
                                version = "LuaJIT",
                            },
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },
                { name = "nixd" },
            }
        end

        return P
    '';

in {
    imports = [
        ../../../modules/home
    ];

    home.stateVersion = "24.11";

    home.username = "ryan";
    home.homeDirectory = "/home/ryan";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [ steam webcord ];

    home.file.".profile".text = ''
        . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
    '';

    programs.git = {
        enable = true;
        userName = "Ryan Noronha";
        userEmail = "ryannor56a@proton.me";
        signing = {
            signByDefault = true;
            key = "1CEABC4E67177BB7!";
        };
        extraConfig = {
            core.editor = "nvim";

            init.defaultBranch = "main";

            diff.tool = "nvimdiff";
            "difftool \"nvimdiff\"".cmd = "nvim -d $LOCAL $REMOTE";

            merge.tool = "nvim";
            "mergetool \"nvim\"".cmd = "nvim $MERGED";

            pager = {
                branch = false;
                stash = false;
            };
        };
    };

    sys = {
        shell.zsh = {
            enable = true;
            omzPlugins = [ "git" "gitfast" "vi-mode" "docker" "kubectl" "wd" ];
        };
        fonts.nerdfonts.enable = true;
        terminal = {
            alacritty.enable = true;
            tmux.enable = true;
        };
        services.ssh.enable = true;
        encryption.gpg = {
            enable = true;
            enableSshSupport = true;
            sshKeys = [ "0D47736C1BD42CF5C821483D6AC6A336578B0964" ];
        };
        editor.neovim = {
            enable = true;
            defaultEditor = true;
            lspConfig = nvimLspConstants;
        };
        language.go.enable = true;
    };
}
