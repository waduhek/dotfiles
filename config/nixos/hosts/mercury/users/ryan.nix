{ ... }:
let
    swayPCConfig = ''
        set $primary_display 'BNQ BenQ EX2510 5CL01826019'
        set $secondary_display 'LG Electronics LG IPS FULLHD 0x00002D4C'

        bindsym $mod+m output $secondary_display toggle

        #
        # ==== Outputs ===
        #

        # Set the resolution and refresh rate of the monitor
        output $primary_display {
            mode 1920x1080@143.981Hz
            position 0 0
        }

        output $secondary_display {
            mode 1920x1080@74.973Hz
            position 1920 0
        }

        #
        # === Inputs ===
        #

        # Change the mouse sensitivity
        input 1133:49291:Logitech_G502_HERO_Gaming_Mouse {
            accel_profile flat
            pointer_accel -0.9
        }

        #
        # === Workspace Assignment ===
        #

        # Assign odd workspaces to primary display
        workspace 1 output $primary_display
        workspace 3 output $primary_display
        workspace 5 output $primary_display
        workspace 7 output $primary_display
        workspace 9 output $primary_display

        # Assign even workspaces to secondary display
        workspace 2 output $secondary_display
        workspace 4 output $secondary_display
        workspace 6 output $secondary_display
        workspace 8 output $secondary_display
        workspace 10 output $secondary_display
    '';
    nvimLspConstants = ''
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
                { name = "gopls" },
                { name = "bashls" },
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
                {
                    name = "yamlls",
                    settings = {
                        redhat = {
                            telemetry = {
                                enabled = false,
                            },
                        },
                        yaml = {
                            schemas = {
                                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.2-standalone/all.json"] = "k8s/**/*.{yaml,yml}",
                                ["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
                                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                                ["https://json.schemastore.org/dependabot-2.0.json"] = "./github/dependabot.yaml",
                                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yaml",
                                ["https://bitbucket.org/atlassianlabs/intellij-bitbucket-references-plugin/raw/master/src/main/resources/schemas/bitbucket-pipelines.schema.json"] = "bitbucket-pipelines.yaml"
                            },
                        },
                    },
                },
                { name = "marksman" },
                { name = "nixd" },
            }
        end

        return P
    '';
in {
    imports = [
        ../../../modules/home
    ];

    home.stateVersion = "24.05";

    home.username = "ryan";
    home.homeDirectory = "/home/ryan";

    programs.home-manager.enable = true;

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

    # Config options set by modules.
    sys = {
        terminal = {
            alacritty.enable = true;
            tmux.enable = true;
        };
        desktop.sway = {
            enable = true;
            pcConfig = swayPCConfig;
        };
        fonts.nerdfonts = {
            enable = true;
            installFonts = [ "Hack" ];
        };
        editor.neovim = {
            enable = true;
            defaultEditor = true;
            lspConfig = nvimLspConstants;
        };
        language = {
            rust.enable = true;
            go.enable = true;
            python.enable = true;
            protobuf.enable = true;
        };
        productivity.libreoffice.enable = true;
        services.ssh.enable = true;
        encryption.gpg = {
            enable = true;
            enableSshSupport = true;
            sshKeys = [ "0D47736C1BD42CF5C821483D6AC6A336578B0964" ];
        };
        buildTools.gnumake.enable = true;
    };
}
