{ config, pkgs, ... }:

{
    imports = [
        # Include the results of the hardware scan.
        ./hardware-configuration.nix

        ../../modules/nix
    ];

    system.stateVersion = "24.05";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    i18n.defaultLocale = "en_IN.UTF-8";
    i18n.supportedLocales = [ "all" ];

    # Allow Unfree software.
    nixpkgs.config.allowUnfree = true;

    # Bootloader config.
    boot.loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = false;
        grub = {
            enable = true;
            efiSupport = true;
            mirroredBoots = [
                {
                    devices = [ "nodev" ];
                    path = "/boot";
                    efiBootloaderId = "NixOS";
                }
            ];
        };
    };

    # Hostname.
    networking.hostName = "mercury";

    # Enable NetworkManager.
    networking.networkmanager.enable = true;
    networking.firewall = {
        logReversePathDrops = true;
        # Allow WireGuard connections on port 51820.
        extraCommands = ''
            ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
            ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
        '';
        extraStopCommands = ''
            ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
            ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
        '';
    };

    # Timezone.
    time.timeZone = "Asia/Kolkata";

    # User accounts.
    users.users = {
        ryan = {
            description = "Ryan Noronha";
            isNormalUser = true;
            extraGroups = [ "wheel" "networkmanager"];
        };
        gaming = {
            description = "Ryan Noronha (Gaming)";
            isNormalUser = true;
            extraGroups =  [ "wheel" "networkmanager" ];
        };
    };

    # Config options set by modules.
    sys = {
        gpu.nvidia.enable = true;
        audio.pipewire.enable = true;
        desktop = {
            sway.enable = true;
            plasma.enable = true;
        };
        virtualisation = {
            docker.enable = true;
            kubernetes.enable = true;
        };
    };

    # Set the default shell to ZSH. Configuration is managed by the home manager
    # module.
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    # MIME type associations.
    xdg.mime.defaultApplications = {
        "application/pdf" = "librewolf.desktop";
        "image/jpeg" = "librewolf.desktop";
        "image/jpg" = "librewolf.desktop";
        "image/png" = "librewolf.desktop";
    };

    # System-wide packages.
    environment.systemPackages = with pkgs; [
        wget
        git
        librewolf
        xdg-utils
    ];

    # https://wiki.archlinux.org/title/Lm_sensors#MAG_B650_TOMAHAWK_WIFI_(MS-7D75)/MAG_B550_MORTAR_WIFI_(MS-7C94)
    boot.extraModulePackages = with config.boot.kernelPackages; [ nct6687d ];
}
