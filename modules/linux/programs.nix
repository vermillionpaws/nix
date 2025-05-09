{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    grim
    pre-commit
    nixfmt-rfc-style
    cabal-install
    ghc
    slurp
    wl-clipboard
    brightnessctl
    mako
    kitty
    fuzzel
    sway
    neovim
    cmake
    ninja
    git
    fzf
    fd
    ripgrep
    meson
    cargo
    rustc
    rustfmt
    luajitPackages.luarocks
    tree-sitter
    ffmpeg-full
    llvmPackages_20.stdenv
    llvmPackages_20.libc
    llvmPackages_20.libcxx
    llvmPackages_20.libcxxClang
    llvmPackages_20.libcxxStdenv
    llvmPackages_20.libc-full
    llvmPackages_20.openmp
    llvmPackages_20.libllvm
    llvmPackages_20.bintools
    llvmPackages_20.libunwind
    llvmPackages_20.compiler-rt
    llvmPackages_20.clangUseLLVM
    lldb_20
    (chromium.override {
      commandLineArgs = [
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
        "--ozone-platform=wayland"
        "--enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE,TouchpadOverscrollHistoryNavigation"
        "--gtk-version=4"
        "--enable-wayland-ime"
        "--wayland-text-input-version=3"
        "--password-store=gnome-libsecret"
      ];
    })
  ];
  services.gnome.gnome-keyring = {
    enable = true;
  };
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableGlobalCompInit = true;
      autosuggestions = {
        enable = true;
        async = true;
        strategy = [ "completion" ];
      };
      syntaxHighlighting = {
        enable = true;
        highlighters = [ "main" ];
      };
      zsh-autoenv = {
        enable = true;
      };
      ohMyZsh = {
        enable = true;
      };
    };
    sway = {
      enable = true;
      wrapperFeatures = {
        gtk = true;
      };
    };
  };
}
