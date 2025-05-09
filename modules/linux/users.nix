{ pkgs, ... }:
{
  users = {
    users = {
      user = {
        isSystemUser = true;
        home = "/home/user/";
        group = "users";
        extraGroups = [
          "wheel"
          "users"
          "video"
          "audio"
          "input"
        ];
        shell = pkgs.zsh;
      };
    };
  };
  services.homed = {
    enable = true;
  };
}
