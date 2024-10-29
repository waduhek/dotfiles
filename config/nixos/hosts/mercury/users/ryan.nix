{ config, pkgs, ... }:
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
    };

    services.gpg-agent = {
        enable = true;
        defaultCacheTtl = 1800;
        enableSshSupport = true;
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
        editor.neovim.enable = true;
    };
}
