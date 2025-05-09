{
  config,
  lib,
  pkgs,
  ...
}:
{
  security = {
    lsm = [
      "landlock"
      "lockdown"
      "yama"
      "integrity"
      "bpf"
    ];
    protectKernelImage = true;
    forcePageTableIsolation = true;
    isolate = {
      enable = true;
    };
    tpm2 = {
      enable = true;
      applyUdevRules = true;
    };
    shadow = {
      enable = true;
    };
    rtkit = {
      enable = true;
    };
    polkit = {
      enable = true;
    };
    auditd = {
      enable = true;
    };
    audit = {
      enable = true;
      rules = [ "-a exit,always -F arch=x86_64 -S execve" ];
      backlogLimit = 8192;
    };
    pam = {
      services = {
        user = {
          enableGnomeKeyring = true;
          enableAppArmor = true;
        };
      };
    };
    apparmor = {
      enable = true;
    };
  };
  services.journald = {
    audit = true;
  };
}
