{ pkgs, ... }:
{
  services = {
    xserver = {
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
    libinput = {
      enable = true;
    };
    gnome = {
      gnome-settings-daemon = {
        enable = true;
      };
      gnome-keyring = {
        enable = true;
      };
      gnome-browser-connector = {
        enable = true;
      };
      glib-networking = {
        enable = true;
      };
      core-shell = {
        enable = true;
      };
      core-utilities = {
        enable = true;
      };
      core-os-services = {
        enable = true;
      };
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
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };
    terminal-exec = {
      enable = true;
      package = pkgs.kitty;
    };
  };
}
