# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./boot.nix
    ./systemd.nix
    ./graphics.nix
    ./networking.nix
    ./security.nix
    ./users.nix
    ./programs.nix
    ./desktop.nix
    ./fonts.nix
    ./sound.nix
  ];
  nixpkgs.config.allowUnfree = true;

  services.btrfs.autoScrub = {
    fileSystems = [ "/" ]; # Assuming root is formatted with Btrfs.
    interval = "daily";
    enable = true;
  };

  environment = {
    variables = {
      RADV_DEBUG = "zerovram";
      radeonsi_zerovram = "true";
      radeonsi_clamp_div_by_zero = "true";
      radeonsi_no_infinite_interp = "true";
      RADV_PERFTEST = "bolist,cswave32,dccmsaa,gewave32,localbos,nircache,pswave32,sam,transfer_queue,video_decode,video_encode";
      AMD_DEBUG = "lowlatencyenc,useaco";
      LIBVA_DRIVER_NAME = "radeonsi";
      VDPAU_DRIVER = "radeonsi";

      QT_QPA_PLATFORM = "wayland";
      QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
      CLUTTER_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      NIXOS_OZONE_WL = "1";
      GDK_BACKEND = "wayland";
      GSK_RENDERER = "vulkan";
      _JAVA_AWT_WM_NONREPARENTING = "1";

      VK_INSTANCE_LAYERS = "VK_LAYER_KHRONOS_validation";
    };
  };

  # Set your time zone.
  time.timeZone = "America/Montevideo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    enable = true;
    earlySetup = true;
    font = "Lat2-Terminus16";
  };

  system.stateVersion = "25.05";
}
