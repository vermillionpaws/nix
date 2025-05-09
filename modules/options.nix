{
  config,
  lib,
  pkgs,
  ...
}:
{
  nix = {
    enable = true;
    daemonCPUSchedPolicy = "batch";
    daemonIOSchedPriority = 2;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "cgroups"
        "dynamic-derivations"
        "git-hashing"
        "verified-fetches"
        "fetch-tree"
        "fetch-closure"
      ];
      auto-optimise-store = true;
      http-connections = 0;
      preallocate-contents = true;
      sync-before-registering = true;
      use-cgroups = true;
      use-xdg-base-directories = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
    };
    optimise = {
      automatic = true;
      dates = [ "daily" ];
    };
  };
}
