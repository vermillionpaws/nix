{ pkgs, ... }:
{
  services.displayManager = {
    enable = true;
    ly = {
      enable = true;
    };
  };

  xdg = {
    mime = {
      enable = true;
    };
    menus = {
      enable = true;
    };
    icons = {
      enable = true;
    };
    sounds = {
      enable = true;
    };
    portal = {
      enable = true;
      wlr = {
        enable = true;
        settings = {
          screencast = {
            max_fps = 60;
          };
        };
      };
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
    terminal-exec = {
      enable = true;
      package = pkgs.kitty;
    };
  };
}
