{ pkgs, ... }:
{
  services = {
    dbus = {
      implementation = "broker";
      apparmor = "enabled";
    };
    upower = {
      enable = true;
    };
    udisks2 = {
      enable = true;
    };
    fwupd = {
      enable = true;

    };
    libinput = {
      enable = true;
    };
	
    colord = {
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
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-hyprland
      ];
    };
    terminal-exec = {
      enable = true;
      package = pkgs.kitty;
    };
  };
programs.hyprland.enable = true;
}
