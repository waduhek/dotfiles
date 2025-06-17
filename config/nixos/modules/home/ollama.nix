{ config, lib, ... }:
let
    cfg = config.sys.ai.ollama;
in {
    options = {
        sys.ai.ollama.enable = lib.mkEnableOption "Enable Ollama";
    };

    config = lib.mkIf cfg.enable {
        services.ollama.enable = true;
    };
}
