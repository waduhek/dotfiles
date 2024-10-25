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

    sys.gpu.nvidia.enable = true;

    # Audio setup.
    sys.audio.pipewire.enable = true;

    # Programs setup.
    sys.desktop.sway.enable = true;
    sys.editor.neovim.enable = true;
    sys.shell.zsh = {
        enable = true;
        defaultShell = true;
        swayEnabled = true;
        usingNvidia = true;
    };
    sys.terminal = {
        alacritty.enable = true;
        tmux.enable = true;
    };

    sys.fonts.nerdfonts.enable = true;

    # Enable GNOME Keyring for allowing applications to request passwords.
    services.gnome.gnome-keyring.enable = true;

    # System-wide packages.
    environment.systemPackages = with pkgs; [
        wget
        light
        git
        librewolf
        clang
    ];

    # Enable OpenSSH daemon.
    services.openssh.enable = true;
}
