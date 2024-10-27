{ config, lib, pkgs, ... }:

{
    imports =  [
        # Include the results of the hardware scan.
        ./hardware-configuration.nix

        ../../modules/nix
    ];

    system.stateVersion = "24.05";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Use the GRUB bootloader.
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;

    # Hostname.
    networking.hostName = "testbox";

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
    
    # Config options set by modules;
    sys = {
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
        brightnessctl
        git
        librewolf
        clang
    ];

    # Enable OpenSSH daemon.
    services.openssh.enable = true;
}
