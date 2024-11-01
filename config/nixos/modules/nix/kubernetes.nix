{ lib, config, pkgs, ... }:
let
    cfg = config.sys.virtualisation.kubernetes;
in {
    options = {
        sys.virtualisation.kubernetes.enable = lib.mkEnableOption "Enable Kubernetes";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            kubernetes
            kubernetes-helm
            minikube
        ];
    };
}
