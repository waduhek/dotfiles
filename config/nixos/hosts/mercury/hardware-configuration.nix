{ config, lib, modulesPath, ... }:

{
    imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [
        "nvme"
        "ahci"
        "xhci_pci"
        "usb_storage"
        "usbhid"
        "sd_mod"
    ];
    boot.initrd.kernelModules = [ "dm-snapshot" ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems = {
        "/" = {
            device = "/dev/pool/NixOS";
            fsType = "ext4";
        };

        "/home" = {
            device = "/dev/pool/NixHome";
            fsType = "ext4";
        };

        "/data" = {
            device = "/dev/disk/by-label/LinuxData";
            fsType = "ext4";
        };

        "/boot" = {
            device = "/dev/nvme0n1p6";
            fsType = "vfat";
            options = [ "fmask=0077" "dmask=0077" ];
        };
    };

    swapDevices = [ ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp12s0.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlp13s0.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
