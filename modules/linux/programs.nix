{ pkgs, ... } : { 
	environment.systemPackages = with pkgs; [
		grim
		pre-commit
		nixfmt-rfc-style
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
		luajitPackages.luarocks
		tree-sitter
		ffmpeg-full
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
