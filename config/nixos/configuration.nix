{ config, lib, pkgs, ... }:

{
    imports = 
        [
            # Include the results of the hardware scan.
            ./hardware-configuration.nix
        ];

    system.stateVersion = "24.05";

    # Use the GRUB bootloader.
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;

    # Hostname.
    networking.hostName = "nixie";

    # Enable NetworkManager.
    networking.networkmanager.enable = true;

    # Timezone.
    time.timeZone = "Asia/Kolkata";

    # User accounts.
    users.users.ryan = {
        description = "Ryan Noronha";
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager"];
    };

    # Audio setup.
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    # Programs setup.
    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
    };
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        ohMyZsh = {
            enable = true;
            plugins = [ "git" "gitfast" "vi-mode" ];
            theme = "robbyrussell";
        };
    };

    # XDG Portal setup to get Sway to work.
    xdg = {
        portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-wlr
                xdg-desktop-portal-gtk
            ];
        };
    };

    # Enable GNOME Keyring for allowing applications to request passwords.
    services.gnome.gnome-keyring.enable = true;

    # System-wide packages.
    environment.systemPackages = with pkgs; [
        wget
        light
        git
        tmux
        alacritty
        librewolf
        mako # Notification daemon for Sway.
        grim # Screenshot utility.
        slurp # Allows selecting portions of the screen.
        wl-clipboard # Provide `wl-copy` and `wl-paste` commands for clipboard.
        vulkan-validation-layers # For Vulkan support.
        waybar
        swaylock
        bemenu
        swaybg
        nerdfonts
    ];

    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "HackNerdFont" ]; })
    ];

    # Enable OpenSSH daemon.
    services.openssh.enable = true;
}
