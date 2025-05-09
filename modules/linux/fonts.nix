{ pkgs, ... } : { 
	fonts = {
		enableDefaultPackages = true;
		enableGhostscriptFonts = true;
		packages = with pkgs; [
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-emoji
			nerd-fonts.liberation
			nerd-fonts.noto
			nerd-fonts.symbols-only
			nerd-fonts.jetbrains-mono
			liberation_ttf
		];
		fontDir = {
			enable = true;
			decompressFonts = true;
		};
		fontconfig = {
			enable = true;
			antialias = true;
			defaultFonts = {
      				serif = [ "LiterationSerif Nerd Font" ];
      				sansSerif = [ "LiterationSans Nerd Font" ];
				emoji = [ "Noto Color Emoji" ];
      				monospace = [ "JetBrainsMono Nerd Font" ];
    			};
			subpixel = {
				rgba = "rgb";
				lcdfilter = "default";
			};
			hinting = {
				enable = true;
				style = "medium";
			};
			useEmbeddedBitmaps = true;
		};
	};
}
