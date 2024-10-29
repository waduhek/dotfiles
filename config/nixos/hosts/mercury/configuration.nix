{ config, lib, pkgs, ... }:

{
    imports = [
        # Include the results of the hardware scan.
        ./hardware-configuration.nix

        ../../modules/nix
    ];

    system.stateVersion = "24.05";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Allow Unfree software.
    nixpkgs.config.allowUnfree = true;

    # Use the GRUB bootloader.
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;

    # Hostname.
    networking.hostName = "mercury";

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

    # Config options set by modules.
    sys = {
        gpu.nvidia.enable = true;
        audio.pipewire.enable = true;
        desktop.sway.enable = true;
        editor.neovim = {
            enable = true;
            defaultEditor = true;
        };
        shell.zsh = {
            enable = true;
            defaultShell = true;
            swayEnabled = true;
            usingNvidia = true;
        };
        terminal = {
            alacritty.enable = true;
            tmux.enable = true;
        };
        fonts.nerdfonts.enable = true;
    };

    # Enable GNOME Keyring for allowing applications to request passwords.
    services.gnome.gnome-keyring.enable = true;

    # System-wide packages.
    environment.systemPackages = with pkgs; [
        wget
        light
        git
        librewolf
    ];

    # Enable OpenSSH daemon.
    services.openssh.enable = true;
}
